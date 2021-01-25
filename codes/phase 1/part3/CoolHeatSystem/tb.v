`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:48 01/25/2021 
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

/*
	 // Inputs
    reg [7:0]in;

    // Outputs
    wire [4:0] chs_power;
	 wire chs_mode;

    M8to4 m84(.in(in), .chs_power(chs_power), .chs_mode(chs_mode));

    initial begin
        in = 8'hFFFF;   #100;
        in = 8'hF56F;   #100;
        in = 8'h3FFF;   #100;
        in = 8'h0001;   #100;
        in = 8'hF10F;   #100;
        in = 8'h7822;   #100;
        in = 8'h7ABC;   #100;   
    end
*/
		reg [7:0] speed = 8'b01000000;
		wire pwd_data;
		reg clk;
		
		DutyCycle dc(.speed(speed), .clk(clk), .pwd_data(pwd_data));

		 initial begin
			clk = 0;
		 end
		 
		 always begin
			#5  clk = 0;
			#5  clk = 1;
		 end
endmodule
