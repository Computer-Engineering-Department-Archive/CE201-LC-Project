/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: 32 Bit Adder/Subtractor
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module AdderSubtractor32x32 (
	input  [31:0] A    , // input  [2's complement 32 bits]
	input  [31:0] B    , // input  [2's complement 32 bits]
	input         sel  , // input  [add:sel=0 || sub:sel=1] 
	output [31:0] S      // output [2's complement 32 bits]
);
<<<<<<< HEAD
	 // if sel = 0 then add else subtract
	 wire [31:0] cin;
=======
	// if sel = 0 then add else subtract
	/* write your code here */
/*	wire [31:0] cin;
>>>>>>> cf7cbb9ed0800a9de5a5f8ba23d39996c1d43e6a
	 assign cin[0] = sel;
	 genvar i;
	 
	 generate
		 for ( i = 0; i < 31; i = i + 1 )
		 begin : loop
				FA fa(.A(A[i]), .B(B[i]^sel), .cin(cin[i]), .sum(S[i]), .co(cin[i+1]));
		 end
	 endgenerate

		reg [31:0] s2;
		always @(sel or A or B)
		if(sel)
			begin
				s2=A-B;
			end
		else
			begin
				s2=A+B;
			end
		assign S=s2;
endmodule
