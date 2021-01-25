`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:33 01/26/2021 
// Design Name: 
// Module Name:    FanSpeed 
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
module FanSpeed (
	input        arst     , // reset [asynch]  
	input        clk      , // clock [posedge] 
	input  [7:0] speed    , // speed [duty-cycle]  
	output reg   pwm_data   // data  [output]
);

	integer cycle, i = 1, period = 256;
	
	always @(posedge clk or negedge arst)
	begin
		cycle = speed;
		
		if(i%period <= cycle)
			pwm_data = 1;
		else
			pwm_data = 0;
		
		i = i+1;
	end
	
endmodule
