`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:58 01/26/2021 
// Design Name: 
// Module Name:    CoolHeatSystemUtils 
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
module CoolHeatSystemUtils(
    );

	reg [7:0] chs_conf, speed;
	reg clk, arst;
	wire [3:0] chs_power;
	wire chs_mode, pwm_data;
	
	/*
	ModePower mp(chs_conf, chs_power, chs_mode);
	
	initial begin
        chs_conf = 8'hFFFF;   #100;
        chs_conf = 8'hF56F;   #100;
        chs_conf = 8'h3FFF;   #100;
        chs_conf = 8'h0001;   #100;
        chs_conf = 8'hF10F;   #100;
        chs_conf = 8'h7822;   #100;
        chs_conf = 8'h7ABC;   #100;   
    end
	 */
	 
	 //CoolHeatSystem(arst, clk, speed, chs_conf, chs_power, chs_mode, pwm_data);
	 ModePower modePower(chs_conf, chs_power, chs_mode);
	 FanSpeed fanSpeed(arst, clk, speed, pwm_data);
	 
	 initial begin
			chs_conf = 8'hFFFF;   #100;
         chs_conf = 8'hF56F;   #100;
         chs_conf = 8'h3FFF;   #100;
         chs_conf = 8'h0001;   #100;
         chs_conf = 8'hF10F;   #100;
         chs_conf = 8'h7822;   #100;
         chs_conf = 8'h7ABC;   #100; 
			
			clk = 0;
			arst = 1;
			speed = 8'b01000000;
	 end
	 
	 always begin
		#5  clk = 0;
		#5  clk = 1;
	 end
	 
endmodule
