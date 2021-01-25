`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:59 01/25/2021 
// Design Name: 
// Module Name:    M8to4 
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
module M8to4(
		input [7:0] in,
		output reg [4:0] chs_power, 
		output reg chs_mode
    );
	 
	   integer i;

		always@(in)
		begin
			 chs_power = 0;  //initialize count variable.
			 for(i=0;i<8;i=i+1)   //for all the bits.
				  chs_power = chs_power + in[i]; //Add the bit to the count.
				  
			 if(chs_power[0])
				chs_mode = 1;
			 else
				chs_mode = 0;
		end


endmodule
