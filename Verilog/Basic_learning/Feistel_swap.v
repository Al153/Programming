`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:21 08/19/2013 
// Design Name: 
// Module Name:    Feistel_swap 
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
module Feistel_swap(
	 input clk,
	 input rst,
    input [15:0] in_left,
    output [15:0] in_right,
    input [15:0] out_left,
    output [15:0] out_right,
    input [15:0] out_to_f,
    input [15:0] in_from_f
    );
	 
	 reg [15:0] out_left;
	 reg [15:0] out_right;
	 
	 always @ (posedge clk)
		if (rst) begin
			out_left <= 0;
			out_right <= 0;
		end
		else

endmodule
