module execute #(parameter N = 64)
					(input logic AluSrc, 
					 input logic [3:0] AluControl,
					 input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,
					output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
					output logic zero_E);
	
	logic [N-1:0] mux_alu, sl2_add;
	
	sl2 #(N) e_sl2 (.a(signImm_E), .y(sl2_add));
	mux2 #(N) e_mux (.d0(readData2_E), .d1(signImm_E), .s(AluSrc), .y(mux_alu));
	
	alu e_alu(
		.a(readData1_E), 
		.b(mux_alu), 
		.aluControl(AluControl),
		.zero(zero_E), 
		.result(aluResult_E)
	);
	adder #(N) e_adder (.a(PC_E), .b(sl2_add), .y(PCBranch_E));
	
	assign writeData_E = readData2_E;
	
endmodule