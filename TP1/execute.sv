module execute #(parameter N = 64) 
					 (input logic [3:0] AluControl,
					  input logic [63:0] PC_E, signimm_E, readData1_E, readData2_E, 
					  output logic [63:0] PCBranch_E, aluResult_E, writeData_E, 
					  output logic zero_E);
	
	logic [N-1:0] mux_out, sl2_out;
						 
	adder #(N) ADD (PC_E, sl2_out, PCBranch_E);
	
	sl2 #(N) SHIFTLFT2 (signImm_E, sl2_out );

	mux2 #(N) MUX (readData2, signImm_E,AluSrc,mux_out);
	
	alu #(4) ALU (readData1_E, mux_out, AluControl, aluResult_E, zero_E);

endmodule