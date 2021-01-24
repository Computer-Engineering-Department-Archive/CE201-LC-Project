`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:39 01/23/2021 
// Design Name: 
// Module Name:    FA8bit 
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
module FA8bit(
		input [0:7]A,
		input [0:7]B,
		input cin,
		output [0:7]S,
		output co
    );
	 
	 wire c1, c2, c3, c4, c5, c6, c7;
	 
	 FA fa0(A[0], B[0], cin, S[0], c1);
	 FA fa1(A[1], B[1], c1, S[1], c2);
	 FA fa2(A[2], B[2], c2, S[2], c3);
	 FA fa3(A[3], B[3], c3, S[3], c4);
	 FA fa4(A[4], B[4], c4, S[4], c5);
	 FA fa5(A[5], B[5], c5, S[5], c6);
	 FA fa6(A[6], B[6], c6, S[6], c7);
	 FA fa7(A[7], B[7], c7, S[7], co);
	 
endmodule
