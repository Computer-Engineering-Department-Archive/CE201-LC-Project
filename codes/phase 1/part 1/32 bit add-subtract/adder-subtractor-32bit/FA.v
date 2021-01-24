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
		sum,
		co
    );
	input A,
			B,
			cin;
	output sum,
			 co;
	
	wire ha1_s, // HA1 sum
		  ha1_c, // HA1 carry
		  ha2_s, // HA2 sum
		  ha2_c; // HA2 carry
		  
	HA ha1(A, B, ha1_s, ha1_c);
	HA ha2(cin, ha1_s, ha2_s, ha2_c);
	
	assign sum = ha2_s,
			 co = ha1_c | ha2_c;

endmodule
