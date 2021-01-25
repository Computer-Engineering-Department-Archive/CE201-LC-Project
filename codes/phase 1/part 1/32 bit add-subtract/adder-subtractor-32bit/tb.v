`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:12 01/26/2021 
// Design Name: 
// Module Name:    tb 
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
module tb(
    );
	 
	 reg [31:0] A,B,S;
	 

	initial begin
		A = 32'b00111011100110101100101000000000;
		B = 32'b01110111001101011001010000000000;
	end
endmodule
