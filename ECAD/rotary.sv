// Practical class and tick: ECAD+Arch Tick 1
// Full Name: Alexander Taylor
// CRSID: at736
// College: St John's

// rotary decoder template

module rotary
  (
        input  wire clk,
        input  wire rst,
        input  wire [1:0] rotary_in,
        output logic [7:0] rotary_pos,
        output logic rot_cw,
        output logic rot_ccw
   );
  		reg[9:0] internalRotPos;
  		reg[1:0] clean_rot;
        /* Add wire and register definitions */

        debounce debounce1( .clk(clk), .rst(rst), .bouncy_in(rotary_in[1]), .clean_out(clean_rot[1])); /* Instantiate debouncing components */
        debounce debounce0( .clk(clk), .rst(rst), .bouncy_in(rotary_in[0]), .clean_out(clean_rot[0]));
        /* Synchronous output value manipulation logic */

		reg delayed0, delayed1;

		always_ff @(posedge clk) delayed0 <= clean_rot[0]; // delayed signals are the signals from the last cycle
		always_ff @(posedge clk) delayed1 <= clean_rot[1];


		wire count_enable = (clean_rot[0] ^ delayed0 ^ clean_rot[1] ^ delayed1); // if one or three of the signals is on, then we have a change in rotation
		wire count_direction = clean_rot[1] ^ delayed0; // determine the turning direction

		always_comb begin
			rotary_pos = internalRotPos[9:2]; // divide by four (there are four triggering phases)
		end


		always_ff @(posedge clk or posedge rst)
		begin
			if (rst) begin // reset logic
				internalRotPos <= 0;
				rot_cw <= 0;
				rot_ccw <= 0;
				delayed0 <= 0;
				delayed1 <= 0;
			end
			else begin
			  	if(count_enable) // if we have a count to make
  				begin
    				if(count_direction) begin // od hte count according to the direction
    					internalRotPos<=internalRotPos-1;
    					rot_cw <= 1;
    					rot_ccw <= 0;
    				end
    				else begin
						internalRotPos<=internalRotPos+1;
						rot_cw <= 0;
						rot_ccw <= 1;
  					end
  				end	else begin
  					rot_cw <= 0;
  					rot_ccw <= 0;
  				end
			end
		end        
 endmodule