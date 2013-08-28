`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:02 08/19/2013 
// Design Name: 
// Module Name:    Top_level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DC7_PCI(

//PCI interface
	PCI_Clock,
	PCI_Reset,
	IRdy,
	Frame,
	IDSel,
	DevSel,
	TRdy,
	CBE,
	AD,
	ADex,
	
// USB FTDI FIFO interface
   USBRxValid,
	USBTxReady,
	USBData,
	USBRead,
	USBWrite,
	
//MCC Display
	DData,
	DClock,
	
//Synchronus Serial Interface (SSI)
	SSClock,
	SSAddr,
	SSStrobe,
	SSDOut,
	SSAck,

	//Diagnostics
	LED,
	Probe,

	);

	input wire  PCI_Clock;
	input wire PCI_Reset;
	input wire IRdy;
	input wire Frame;
	input wire IDSel;
	
	output reg DevSel;
	output reg TRdy;
	
	input wire [3:0] CBE;
	inout wire [17:0] AD;
	input wire [1:0] ADex;
	
// USB FTDI FIFO interface
   	input wire USBRxValid;
	input wire USBTxReady;
	inout wire [7:0] USBData;
	output reg USBRead;
	output reg USBWrite;
	
//MCCDisplay
   inout wire DData;
   output wire DClock;
	
//Synchronus Serial Interface (SSI)
	output wire SSClock;
	output reg SSAddr;
	output wire SSStrobe;
	output reg SSDOut;
	input wire SSAck;

	//Diagnostics
	output reg LED;
	output reg Probe;



///////////////////////////////Ports to other modules//////////////////////////////////////


//put in  connections to other modules


///////////////////////////////////////////////////////////////////////////////////////////




//=========================Internal signals================================================
parameter BaseAddress = 20'h00318;
parameter stIDLE = 2'b0, stWAIT_TO_WRITE = 2'b1, stWRITE = 2'b11; //SSI_State
//  ===================signals associated with 80x86 PCI bus================================
reg [17:0] x86_Dout;
reg [17:0] last_x86_Dout;
wire [19:0] x86_Din;
reg [3:0] x86_IOAddress;
reg x86_Hold;
wire x86_Read;
reg x86_Write;
reg x86_Active;
reg x86_PCI_Cfg;
reg x86_PCI_Cfg_Latch;
wire x86_Test;
reg FiducialMarker;

reg [19:0] x86_Dlast;
reg [3:0] DWordMode;

//  =================    FDTI USB interface    =======================

reg [7:0] USBControl;
reg [7:0] DataToHost;
reg HostTxDone;
reg WriteToHost;
reg USBSend;
reg [7:0] DataFromHost;
reg HostRxValid;
reg ReadFromHost;

reg [7:0] HostWriteCount;
reg [7:0] HostReadCount;

reg USBReadWire;
reg USBWriteWire;

reg DACKCounter;

// ===================Front panel LED display ===========================
reg [31:0] LEDRegister;
reg LEDShift;
reg LEDWrite;
reg Yellow;
integer [4:0] LEDIndex;

// ================= DB7 SSI interface =================================
wire DB7_SClock;
reg DB7_SDO;
reg DB7_SADR;
reg [15:0] DB7_Dout;
reg [15:0] DB7_Din;
reg [7:0] DB7_Address;
wire DB7_Strobe;
reg DB7_Ready;
reg DB7_NoResponse;
reg x86_to_DB7;
reg SSIProbe;

// ===================Diagnostics and on-card signals =====================

reg Show;
reg Show_PCI;
wire LEDOut;
reg FaultBlink;
reg Fault_PCIOut;
reg Fault_PCIIn;
reg Fault_DB7Out;
reg Fault_DB7In;
reg [3:0] StateOut;
reg [15:0] Scaler;
reg [4:0] ProbeSelect;
reg [17:0] nsCounter;
reg [1:0] Blinker;
reg [3:0] LastCBE;
reg ReadStarted;
reg not_x86_read;
reg Diagnostic;
 
// =============== digital scope =============================
integer [4:0] index;
reg [15:0] bit_array;
reg testbit;
reg sample_enable;
reg [3:0] sample_select;
reg sample_in;

reg [3:0] Shift_register;
reg Shift_register_sample;
reg [3:0] Shift_register_select;
reg [7:0] Scope_config;


reg Null;
// ======================== end of signals =================================
//////////////////////////////////////////////////////////////////////////////////////

//Put in Muxes for Probe and Digital scope

//////////////////////////////////////////////////////////////////////////////////////




/////////////////DB7 SSI interface////////////////////////////////////////////////////
assign SSDOut = DB7_SDO;
assign SSClock = DB7_SClock;
assign SSAddr = DB7_SADR;
assign DB7_Strobe = x86_to_DB7;

assign USBRead = USBReadWire;
assign USBWrite = USBWriteWire;

// ========================= Front panel LED display ========================

assign DClock = (nsCounter[0]&&LEDShift);
assign DDAta = (!(LEDWrite || Yellow))? 'bz : (LEDRegister[LEDindex] || ((!LEDWrite)&&Yellow)); //NEEDS TO BE FINISHED



if (PCI_Reset == 1'b0) begin
	x86_Hold <= 1'b0;
	x86_to_DB7 <= 1'b0;
	DB7_Address <= 8'hA5;
	Scope_config <= 8'h00;
	ReadFromHost <= 1'b0;
	x86_Active <= 1'b0;
	WriteToHost <= 1'b0;
	USBSend <= 1'b0;
	x86_Dlast <= BaseAddress;
	DWordMode <= 1'b0;
	x86_PCI_Cfg_Latch <= 1'b0; 
	LEDRegister <= 64'hffffffff;
	LEDShift <= 1'b1;
	LEDWrite <= 1'b1;
	LEDIndex <= 5'b11111;
	FiducialMarker <= 1'b0;
	DACKCounter <= 1'b0;
	Blinker <= 2'b11;
	LastCBE <= 4'hf;
	not_x86_read <= 1'b1;
	Diagnostic <= 1'b0;

	bit_array <= 16'h5A5A;
	index <= 5'b10000;
	sample_enable <= 1'b0;
	Shift_register <= 4'b0000;
	Shift_register_select <= 1'b0;
end
else begin
	always @(posedge PCI_Clock)
	begin
		if (x86_PCI_Cfg&&(!86_PCI_Cfg_Latch)) begin
			x86_PCI_Cfg_Latch <= 1'b1;
		 	LEDRegister <= 32'hAAAAAAAA;
		 	LEDShift <= 1'b1;
		 	LEDWrite <= 1'b1;
		 	LEDIndex <= 5'b11111;
		end

		if (x86_Read == 1'b1) begin
		 	//All of  PCI protocol here 
		 	ReadStarted <= 1'b1;
		 	x86_Active <= 1'b1;
		 	Yellow <= 1'b0;

		 	case (x86_IOAddress)

		 	4'b0: begin //read status
		 		case (CBE)
		 			1110 : begin //byte read
		 				x86_Hold <= 1'b0;
		 				x86_Dout[7:0] <= {StateOut, x86_Hold, DData, DB7_NoResponse,DB7_Ready};
		 				last_x86_Dout[7:0] <= {StateOut, x86_Hold, DData, DB7_NoResponse,DB7_Ready};
		 			end 
		 			1100: begin //word read
		 			end

		 			default:
		 		endcase
// 					...
		 	end 

		 	4'b1 : begin //read from USB port
		 		
		 	end

		 	4'b100 : begin//read last data for PCI parity check
		 		
		 	end

		 	4'b101 : begin //read last USB data
		 		
		 	end	

		 	default: 

		 	endcase
 
		end else if (x86_Write == 1'b1) begin
			x86_Active <= 1'b1;
			x86_Dlast <= x86_Din;
			case (x86_IOAddress)

			4'b0: begin
				case (CBE)
					4'b1110 : begin
					
						end

					4'b1100 : begin
					
						end

					default : begin
					
						end
				endcase

			4'b1 : begin
				
				end
			default:begin
				Null <= 1'b0;
			end 
			endcase
		end else begin
			x86_Active <= 1'b0;
		end
		if (ReadFromHost == 1'b1) begin
			ReadFromHost <= 1'b0;
			ReadStarted <= 1'b0;
		end
		if (HostTxDone == 1'b1) begin
			if (WriteToHost == 1'b1) begin
				USBSend <= 1'b1;
				WriteToHost <= 1'b1;
			end else begin
				USBSend <= 1'b0;
			end
		end
		if (x86_to_DB7 == 1'b1) begin
			x86_to_DB7 <= 1'b0;
		end
		if (LEDWrite == 1'b1)begin
			LEDShift <= 1'b1;
		end
// =================  LEDshift       ==================
		if (LEDshift && nsCounter) begin
			LEDIndex <= LEDIndex-1;
			if (LEDIndex == 5'b0) begin
				LEDshift <= 1'b0;
				LEDWrite <= 1'b0;
			end 
		end
//  ================  digital scope  ==================
		if (!index[4] && sample_enable)  begin 
			index <= index - 1;
			bit_array[index] <= Shift_register[3];
		end
		else if (index[4] == 1'b1) begin
			sample_enable <= 1'b0
		end
		Shift_register[3:1] <= Shift_register[2:0];
		Shift_register[0]	<= Shift_register_sample;
	end 
end




endmodule
