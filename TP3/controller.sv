// CONTROLLER

module controller(input logic reset, ExtIRQ, 
                        input logic [10:0] instr, ExcAck, 
                        output logic [3:0] AluControl, EStatus,                        
                        output logic reg2loc, regWrite, AluSrc, Branch, memtoReg, memRead, memWrite, Exc, ERet, ExtIAck);
                                            
    logic [1:0] AluOp_s;
	 logic NotAnInstr;
                                            
		maindec     decPpal     (.reset(reset),
										 .Op(instr), 
										 .Reg2Loc(reg2loc), 
										 .ALUSrc(AluSrc), 
										 .MemtoReg(memtoReg), 
										 .RegWrite(regWrite), 
										 .MemRead(memRead), 
										 .MemWrite(memWrite), 
										 .Branch(Branch), 
										 .ALUOp(AluOp_s),
										 .NotAnInstr(NotAnInstr));    
                    
                                
		aludec     decAlu     (.funct(instr), 
                             .aluop(AluOp_s), 
                             .alucontrol(AluControl));
	
		assign Exc = NotAnInstr | ExtIRQ;
		assign ExtIAck = ExtIRQ && ExcAck;
		
		always_comb begin
			if (NotAnInstr) EStatus = 4'b0010;
			else if (ExtIRQ) EStatus =  4'b0001;
			else EStatus = 4'b0000;
		end     
endmodule