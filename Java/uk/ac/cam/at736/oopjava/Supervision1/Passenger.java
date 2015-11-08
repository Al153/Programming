public class TicketClerk{
	public String name;
	public String location;
	private Passenger[] passengers;
	private RailwayDB[] db;
	public void reserveSeat(String passengerName, int trainId);
	public void reserveTicket(String passengerName, String startLoc, String destLoc);
	public void cancelTicket(String passengerName, int ticketNo);
	public void reservePayment(String passengerName, int amount);
}

public class Passenger{
	public String name;
	public int age;
	public String address;
	private Ticket ticket;
	private Payment payment;
	private Train[] trains;
	private Ticket[] tickets;
	private Payment[] payments;
	public Train searchTrains(int trainId);
	public Train[] viewSchedule();
	public void reserveSeat(Train train, String startLoc, String destLoc);
	public void purchaseTicket(String startLoc, String destLoc, int passNo);
	public void cancelTicket(Ticket ticket);
	public void makePayment(Ticket ticket);
}

public class Payment{
	protected int amount;
}

public class Ticket{
	protected int ticketNo;
	protected int trainId;
}

public class RailwayDB{
	public int id;
}