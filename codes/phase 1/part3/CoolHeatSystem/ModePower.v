`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:53 01/26/2021 
// Design Name: 
// Module Name:    ModePower 
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
module ModePower (
	input  [7:0] chs_conf  , // degree [temprature] 
	output reg [3:0] chs_power , // power  [cooler/heater] 
	output reg       chs_mode    // model  [heat=1/cool=0]
);

	integer i;

	always@(chs_conf)
	begin
		 chs_power = 0;  //initialize count variable.
		 for(i=0;i<8;i=i+1)   //for all the bits.
			  chs_power = chs_power + chs_conf[i]; //Add the bit to the count.
			  
		 if(chs_power[0])
			chs_mode = 1;
		 else
			chs_mode = 0;
	end

endmodule

