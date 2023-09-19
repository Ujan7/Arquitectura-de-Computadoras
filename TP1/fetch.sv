module fetch #(parameter N =64)
				  (input logic PCSrc_F, clk, reset,
				   input logic [63:0] PCBranch_F,
				   output logic [63:0] imem_addr_F);
	
	logic [N-1:0] add_out, mux_out;
	
	flopr #(N) PC (clk, reset, mux_out, imem_addr_F);
	
	mux2 #(N) MUX (add_out, PCBranch_F, PCSrc_F, mux_out);
						 
	adder #(N) ADD (imem_addr_F, 64'b100, add_out);

endmodule