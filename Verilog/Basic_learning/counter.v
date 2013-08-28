module counter (
	clock,
	control,
	out
	);

input wire clock;
input wire [1:0] control;

output reg [15:0] out;

	always @ (posedge clock) 
		begin : COUNTER
			if (control == 2'b0) begin
				//reset sequence 
				out <= 16'b0;
			end
			else if (control == 2'b1) begin
				//count up
				out <= out + 1;
			end
			else if (control == 2'b11) begin
				//count down 
				out <= out - 1;
			end
			//else do nothing
		end
endmodule 