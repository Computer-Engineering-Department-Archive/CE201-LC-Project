`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:40:15 01/24/2021 
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
		sel,
		sum,
		co
    );
	input A,
			B,
			cin,
			sel;
	output sum,
			 co;
		
	//add or subtract
	wire Bin;
	assign Bin = B^sel;
			 
	assign sum = A^Bin^cin;
	assign co = A&Bin | Bin&cin | A&cin;

endmodule
