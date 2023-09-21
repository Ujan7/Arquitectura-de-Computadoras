module alu (input logic [63:0] a, b,
				input logic [3:0] aluControl, 
				output logic zero,
				output logic [63:0] result);

	always_comb
		begin
			casez(aluControl)
				4'b0000: result = a & b; 
				4'b0001: result = a | b; 
				4'b0010: result = a + b;
				4'b0110: result = a - b;
				4'b0111: result = b;
				default: result = b;
			endcase
			
			zero = result === 64'b0;
	end

endmodule