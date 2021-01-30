/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name:  Light Dance Utils
---  Description: Module5:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module LightDanceUtils(
);
	reg arst, clk, din, load;
	reg [7:0]pdata;
	wire [7:0]qdata;
	
	LightDance ld(arst, clk, din, load, pdata, qdata);
	
	initial begin
		clk = 0; arst = 0; load = 0; din = 1; #5; 
		arst = 1;
		pdata = 8'b00000100; #10;
	end
	
	always begin
		#5; clk = ~clk;
	end
endmodule
