module signext (input logic [31:0] a,
					 output logic [63:0] y);
	always_comb
		casez(a[31:21])
		//LDUR CASE
		11'b111_1100_0010: y = {{55{a[20]}}, a[20:12]};
		//STUR CASE	
		11'b111_1100_0000: y = {{55{a[20]}}, a[20:12]};
		//CBZ CASE
		11'b101_1010_0???: y = {{43{a[23]}}, a[23:5], 2'b0};
		
		default: y = '0;
	endcase

endmodule