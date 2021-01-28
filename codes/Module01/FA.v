`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:23 01/23/2021 
// Design Name: 
// Module Name:    FA 
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
module FA(
		A,
		B,
		cin,
		sum,
		co
    );
	input A,
			B,
			cin;
	output sum,
			 co;
	
	 assign {co,sum} = A + B + cin;

endmodule
