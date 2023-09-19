module alu #(parameter N = 4)
			  (input logic [63:0] a, b,
			   input logic [N-1:0] ALUControl,
			   output logic [63:0] result,
				output logic zero);
	
	always_comb
		begin
			case (ALUControl)
				4'b0000 : result = a & b;
				4'b0001 : result = a | b;
				4'b0010 : result = a + b;
				4'b0110 : result = a - b;
				4'b0111 : result = b;
				default : result = a;
			endcase
			
			zero = result === 0;
		end
endmodule