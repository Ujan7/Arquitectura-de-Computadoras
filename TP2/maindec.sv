module maindec (input logic [10:0] Op, 
					output logic Reg2Loc, ALUSrc, MemtoReg,
					RegWrite, MemRead, MemWrite, Branch,
					output logic [1:0] ALUOp);


	function void setRFormat();
		Reg2Loc = 0;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 1;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 2'b10;
	endfunction
	
	function void setCBZ();
		Reg2Loc = 1;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 1;
		ALUOp = 2'b01;
	endfunction

	function void setLDUR();
		Reg2Loc = 0;
		ALUSrc = 1;
		MemtoReg = 1;
		RegWrite = 1;
		MemRead = 1;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 2'b0;
	endfunction
	
	function void setSTUR();
		Reg2Loc = 1;
		ALUSrc = 1;
		MemtoReg = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 1;
		Branch = 0;
		ALUOp = 2'b0;
	endfunction
	
	function void setDefault();
		Reg2Loc = 0;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 2'b0;
	endfunction

	always_comb
		begin
			casez(Op)
				11'b1?0_0101_1000: setRFormat();
				11'b10?_0101_0000: setRFormat(); 
				11'b101_1010_0???: setCBZ(); 
				11'b111_1100_0010: setLDUR();
				11'b111_1100_0000: setSTUR();
				default: setDefault();
			endcase
	end
		
endmodule