`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:43:33 01/24/2021 
// Design Name: 
// Module Name:    adder-subtractor 
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
module adderSubtractor(
		input [31:0] A,
		input [31:0] B,
		input sel,
		output [31:0] S,
		output co
    );
	 
	 wire [32:0] cin;
	 assign cin[0] = sel;
	 genvar i;
	 for ( i = 0; i < 32; i = i + 1 )
	 begin
			FA fa(A[i], B[i]^sel, cin[i], S[i], cin[i+1]);
	 end
	 
	 assign co = cin[32];

endmodule
