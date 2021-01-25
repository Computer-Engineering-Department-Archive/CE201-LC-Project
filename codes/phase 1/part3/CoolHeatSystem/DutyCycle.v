`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:36 01/25/2021 
// Design Name: 
// Module Name:    DutyCycle 
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
module DutyCycle(
		input [7:0] speed,
		input clk,
		output reg pwd_data
    );

	integer i = 1;
	integer periodLen = 256;
	
	integer DC;
	always @(posedge clk)
	begin
		DC = speed;
		
		if(i%periodLen < DC)
		begin
			$display("1");
			pwd_data = 1;
		end
		else
		begin
			$display("0");
			pwd_data = 0;
		end
		
		i = i+1;
		
	end

endmodule
