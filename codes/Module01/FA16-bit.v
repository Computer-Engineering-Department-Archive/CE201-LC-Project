`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:36 01/26/2021 
// Design Name: 
// Module Name:    FA16-bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FA16(
 
	input [15:0]A,
		input [15:0]B,
		input cin,
		output [15:0]S,
		output co
    );
	 
	 wire c1, c2, c3, c4, c5, c6, c7,c8,c9,c10,c11,c12,c13,c14,c15;
	 
	 FA fa0(A[0], B[0], cin, S[0], c1);
	 FA fa1(A[1], B[1], c1, S[1], c2);
	 FA fa2(A[2], B[2], c2, S[2], c3);
	 FA fa3(A[3], B[3], c3, S[3], c4);
	 FA fa4(A[4], B[4], c4, S[4], c5);
	 FA fa5(A[5], B[5], c5, S[5], c6);
	 FA fa6(A[6], B[6], c6, S[6], c7);
	 FA fa7(A[7], B[7], c7, S[7], c8);
	 //
	 FA fa8(A[8], B[8], c8, S[8], c9);
	 //
	 FA fa9(A[9], B[9], c9, S[9], c10);
	 //
	 FA fa10(A[10], B[10], c10, S[10], c11);
	 //
	 FA fa11(A[11], B[11], c11, S[11], c12);
	 //
	 FA fa12(A[12], B[12], c12, S[12], c13);
	 
	//
	FA fa13(A[13], B[13], c13, S[13], c14);
	 
	 //
	 FA fa14(A[14], B[14], c14, S[14], c15);
	 
	 //
	 FA fa15(A[15], B[15], c15, S[15], co);
	 
	 
	 

endmodule
