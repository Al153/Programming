/**
 * NTPClient.java
 */

import java.io.IOException;
import java.io.InterruptedIOException;

import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.UnknownHostException;

import java.util.Date;

/*
 * |---------------------------------------------------------------------|
 * | LI | VN   | Mode | Stratum        | Poll (2^Y s)$  | Precn (2^Y s)$ |
 * |---------------------------------------------------------------------|
 * | Root Delay (secs) $               |  Root delay (part secs)         |
 * |---------------------------------------------------------------------|
 * | Root Dispersion (secs)$           | Dispersion (part secs)          |
 * |---------------------------------------------------------------------|
 * | Reference  ID (32 bits) Stratum one IP source?                      |
 * |---------------------------------------------------------------------|
 * |                    Reference Timestamp (64 bits)                    |
 * |  high 32 bits is seconds                                            |
 * |  low 32 bits is fractional part                                     |
 * |---------------------------------------------------------------------|
 * |                    Originate Timestamp (64 bits)                    |
 * |                                                                     |
 * |                                                                     |
 * |---------------------------------------------------------------------|
 * |                    Receive Timestamp (64 bits)                      |
 * |                                                                     |
 * |                                                                     |
 * |---------------------------------------------------------------------|
 * |                    Transmit Timestamp (64 bits)                     |
 * |                                                                     |
 * |                                                                     |
 * |---------------------------------------------------------------------|
 * |                    Authenticator (96 bits)                          |
 * |                                                                     |
 * |                                                                     |
 * |                                                                     |
 * |                                                                     |
 * |                                                                     |
 * |---------------------------------------------------------------------|
 * 
 * LI:	Leap indicator
 *           00 none 
 *           01 last min of UTC day has 61 secs 
 *           10 last min of UTC day has 59 secs
 *           11 error (not synchronized)
 * VN:  SNTP version (last official release is 3)
 * Mode: Client mode is 3 - there are others 
 * Stratum:  >= 1 - bigger nums are furthest away from ref source 
 * Poll: used to govern maximum interval of sessional packet exchange
 *       not set in client/server mode
 * Precision: Resolution of reference clock in powers of 2 (neg powers likely)
 * Root delay: calculated delay from reference source fixed point value 
 * Root dispersion: measured scatter (statistical mumbo jumbo) 
 * Reference ID: for Stratum 1 a four octet acsii code word
 *               for Stratum >1 the IP address of this service's source
 * Reference Timestamp: this is the last time this service got synchronized
 * Originate Timestamp: the client fills this in to whatever its clock says
 * Receive Timestamp: the time the message arrived at the service
 * Transmit Timestamp: the client or server's timestamp when it the packet
 *                     the server will copy the client's timestamp to
 *                     the originate field
 * </pre>
 */

public class NTPClient {

    final static int  PORT         = 123; // SNTP standard port
    final static long DIVISOR32    = 0x100000000L;
    final static int  DIVISOR16    = 0x10000;
    final static long EPOCH_OFFSET = 2208988800L;
    final static String nl = System.getProperty("line.separator");

    DatagramPacket packet;
    DatagramSocket socket;
    byte data[]; // packet data
    Date replytime; 

    public NTPClient(InetAddress ina) throws IOException {
        data = new byte[60]; // UDP payload size
        packet = new DatagramPacket(data, data.length, ina, PORT);
        socket = new DatagramSocket();
        data[0] = 0x1B; // version 3 and client mode (3)
    }

    public boolean isNotLeapSecond() {
        if( ((data[0] >>> 6) & 0x03) == 0 )
            return true;
        return false;
    }
    
    public boolean isPositiveLeapSecond() {
        if( ((data[0] >>> 6) & 0x03) == 1 )
            return true;
        return false;
    }
    
    public boolean isNegativeLeapSecond() {
        if( ((data[0] >>> 6) & 0x03) == 2 )
            return true;
        return false;
    }
    
    public boolean isErrorLeapSecond() {
        if( ((data[0] >>> 6) & 0x03) == 3 )
            return true;
        return false;
    }
    
    public String getMode() {
        switch( data[0]&0x07 ) {
         case 1: return "Symetric Active";
         case 2: return "Symetric Passive";
         case 3: return "Client";
         case 4: return "Server";
         case 5: return "Broadcast";
         case 6: return "Control Message";
         case 7: return "Private";
        }
      return "Invalid mode";
    }

    public int getStratum() {
        // must convert from 2s compliment
        // to unsigned
        return data[1] & 0xFE + 1;
    }

    public double getPollIntervalSeconds() {
        return Math.pow(2.0,data[2]);
    }

    public double getPrecisionSeconds() {
        return Math.pow(2.0,data[3]);
    }

    public double getRootDelaySeconds() {
        return getFixedPointVal32(4);
    }

    public double getRootDispersionSeconds() {
        return getFixedPointVal32(8);
    }

    public String getReferenceID() {

        byte [] a = new byte[4]; // IPv4 address buffer

        // src,spos,dest,dpos,len
        System.arraycopy(data,12,a,0,4);

        StringBuffer sb = new StringBuffer();

        switch( getStratum() ) {
        case 0:
        case 1: sb.append((char)a[0]);
                sb.append((char)a[1]);
                sb.append((char)a[2]);
                sb.append((char)a[3]);
                break;
        default: 
          try {
            sb.append(
                InetAddress.getByAddress(a).getHostAddress()
            );
          } catch(UnknownHostException e) {
            sb.append("Invalid or unset");
          }
        }
        return sb.toString();
    }

    

    public double getReferenceTimestamp() {
        return getTimeStamp(0);
    }

    public double getOriginateTimestamp() {
        return getTimeStamp(1);
    }

    public double getReceiveTimestamp() {
        return getTimeStamp(2);
    }

    public double getTransmitTimestamp() {
        return getTimeStamp(3);
    }

    private double getFixedPointVal32(int offset) {

        // woe is me that there is no unsigned byte
        // what a mess this makes

        int b, i1, i2;

        b  = data[offset++]; // get the byte into an int
        b &= 0xFF;          // chop its head off!
        i1 = b << 8;       // now shift left

        b   = data[offset++];
        b  &= 0xFF;
        i1 += b;      // at this point we have 16 bits

        b  = data[offset++];
        b &= 0xFF;
        i2 = b << 8;

        b   = data[offset++];
        b  &= 0xFF;
        i2 += b;     // 16 bits of fractional part

        // convert i2 to a double and divide it down
        // to a fraction and then add the integer
        // part and return the whole lot to caller
        return i1 + (double)i2/DIVISOR16; 
    }


    private double getFixedPointVal64(int offset) {
        long i1=0, i2=0;
        int b;


        // integer part
        for(int i=0; i<4; i++) {
            i1 <<= 8;              // first time is shifting 0's
            b   = data[offset++]; // get the byte into an int
            b  &= 0xFF;          // chop its head off!
            i1 += b;            // place in register
        }


        // fractional part
        for(int i=0; i<4; i++) {
            i2 <<= 8;
            b   = data[offset++];
            b  &= 0xFF;
            i2 += b;
        }


        // convert i2 to a double and divide it down
        // to a fraction and then add the integer
        // part and return the whole lot to caller
        return i1 + (double)i2/DIVISOR32; 
    }

    /**
     * Gets the number of milliseconds since 00:00 1/Jan/1970.
     *
     * @param field to get: 0 Reference, 1 Originate, 2 Receive, 3 Transmit
     * @return The timestamp in milliseconds since 1970
     */
    public double getTimeStamp(int which) {

        double ts = getFixedPointVal64(16+8*which);

        // adjust for 1900 NTP and 1970 Java date
        ts -= EPOCH_OFFSET;
        ts *= 1000; // convert to milliseconds

        return ts;
    }

    private void setTransmitTimestamp(Date d) {
        long s = d.getTime();
        long ms = s % 1000;

        ms *= DIVISOR32;

        s /= 1000;
        s += EPOCH_OFFSET;

        for(int i=43; i>=40; i--) {
             data[i] = 0;
             data[i] |= (byte)((char)s & 0x00FF);
             s >>>= 8;
        }

        for(int i=47; i>=44; i--) {
             data[i] = 0;
             data[i] |= (byte)((char)ms & 0x00FF);
             ms >>>= 8;
        }
    }

    public void send() throws IOException {
        if(socket==null)
            throw new IOException("NTPClient.send: Socket not bound");

        setTransmitTimestamp(new Date());
        socket.send(packet);        
    }

    public void receive() throws IOException {
        if(socket==null)
            throw new IOException("NTPClient.send: Socket not bound");
        // don't want to wait if there is no server
        socket.setSoTimeout(5000); // 5 seconds
        socket.receive(packet);
        replytime = new Date(); // only if no exception
    }

    public void close() throws IOException {
        socket.close();
        socket=null;
    }        

    public double getReplyTimestamp() {
        long rt = replytime.getTime();
        rt >>>= 1; // move out any sign bit

        return (double)rt * 2;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("SMTP mode = ");
        sb.append(getMode());
        sb.append(nl);
        sb.append("Server Stratum = ");
        sb.append(getStratum());
        sb.append(nl);
        sb.append("PollInterval = ");
        sb.append(getPollIntervalSeconds());
        sb.append(" seconds");
        sb.append(nl);
        sb.append("Precision = ");
        sb.append(getPrecisionSeconds());
        sb.append(" seconds");
        sb.append(nl);
        sb.append("Root Delay = ");
        sb.append(getRootDelaySeconds());
        sb.append(" seconds");
        sb.append(nl);
        sb.append("Root Dispersion = ");
        sb.append(getRootDispersionSeconds());
        sb.append(" seconds");
        sb.append(nl);
        sb.append("Reference ID = ");
        sb.append(getReferenceID());
        sb.append(nl);
        if(isNotLeapSecond())
            sb.append("Not subject to leap second");
        else if(isPositiveLeapSecond())
            sb.append("Subject to positive leap second");
        else if(isNegativeLeapSecond())
            sb.append("Subject to negative leap second");
        else if(isErrorLeapSecond())
            sb.append("Clocks not synchronized");
        sb.append(nl);
        sb.append("Reference Timestamp   = ");
        sb.append( new Date((long)getReferenceTimestamp()) );
        sb.append(nl);
        sb.append("Originator Timestamp  = ");
        sb.append( new Date((long)getOriginateTimestamp()) );
        sb.append(nl);
        sb.append("Receive Timestamp     = ");
        sb.append( new Date((long)getReceiveTimestamp()) );
        sb.append(nl);
        sb.append("Transmit Timestamp    = ");
        sb.append( new Date((long)getTransmitTimestamp()) );

        return sb.toString();
    }

    /**
     * Creates the client object.  A failure may be the address
     * given as an argument may not be valid.
     * @param args Only one argument and must be a valid IP address
     * or net name of an NTP host.
     */
    public static void main(String [] args) {

        if(args.length!=1) {
            System.out.println("Usage: java NTPClient <server>");
            return;
        }

        try {
            NTPClient c = new NTPClient(InetAddress.getByName(args[0]));

            c.send(); // send query

            System.out.println("--- sent data ----");
            System.out.println(c.toString());

            c.receive(); // wait reply

            System.out.println("--- rcvd data ----");
            System.out.println(c.toString());

            c.close();

            // delay and offset calculations
            // see RFC2030

            double T1 = c.getOriginateTimestamp();
            double T2 = c.getReceiveTimestamp();
            double T3 = c.getTransmitTimestamp();
            double T4 = c.getReplyTimestamp();

            System.out.println("=================");

            System.out.print("Roundtrip delay = ");
            System.out.print((T4-T1)-(T2-T3));
            System.out.println(" milliseconds");

            System.out.print("Clock offset = ");
            System.out.print(((T2-T1)+(T3-T4))/2);
            System.out.println(" milliseconds");

            System.out.println("=================");

        }
        catch(UnknownHostException e) {
            System.out.println("Unknown host: " + args[0]);
        }
        catch(InterruptedIOException e) {
            System.out.println("No data from: " + args[0]);
        }
        catch(IOException e) {
            System.out.println("NTPClient: " + e);
        }
    }

}

    
    