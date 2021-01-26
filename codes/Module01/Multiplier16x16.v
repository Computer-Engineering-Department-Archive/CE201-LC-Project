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
---  Module Name: 16 Bit Multiplier
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module Multiplier16x16 (
	input  [15:0] A , // input  [unsigned 16 bits]
	input  [15:0] B , // input  [unsigned 16 bits]
	output [31:0] P   // output [unsigned 32 bits]
);


	/* write your code here */
	
	// we use 4 8 bit multiplier and two 24 bit adder and 16 bit adder 
	
	wire [15:0] out1;
	wire [15:0] out2;
	wire [15:0] out3;
	wire [15:0] out4;
	
	Multiplier8x8 first(.A(A[7:0]),.B(B[7:0]),.P(out1[15:0]));
	Multiplier8x8 second(.A(A[15:8]),.B(B[7:0]),.P(out2[15:0]));
	Multiplier8x8 third(.A(A[7:0]),.B(B[15:8]),.P(out3[15:0]));
	Multiplier8x8 fourth(.A(A[15:8]),.B(B[15:8]),.P(out4[15:0]));
	
	assign
		P[0]=out1[0],
		P[1]=out1[1],
		P[2]=out1[2],
		P[3]=out1[3],
		P[4]=out1[4],
		P[5]=out1[5],
		P[6]=out1[6],
		P[7]=out1[7];
	
	//
	wire co1,co2,co3;
	wire [15:0] outmid1;
	wire [23:0] outmid2;
	FA16 F1(.A({8'b00000000,out1[15:8]}),.B(out2[15:0]),.cin({1'b0}),.S(outmid1[15:0]),.co(co1));
	FA24bit F2(.A({8'b00000000,out3[15:0]}),.B({out4[15:0],8'b00000000}),.cin({1'b0}),.S(outmid2[23:0]),.co(co2));
	FA24bit F3(.A({8'b00000000,outmid1[15:0]}),.B(outmid2[23:0]),.cin({1,b0}),.S(P[31:8]),.co(co3));

	
	
	
	
	/* write your code here */

endmodule
