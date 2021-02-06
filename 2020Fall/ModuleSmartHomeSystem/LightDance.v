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
---  Module Name: Light Dance
---  Description: Module5
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input wire [7:0] pdata , // load   data
	output wire [7:0] qdata   // output data
);

	DFlop d7(arst, clk, din^qdata[0], load,pdata[7], qdata[7]);
	DFlop d6(arst, clk, qdata[7], load,pdata[6], qdata[6]);
	DFlop d5(arst, clk, qdata[6]^qdata[0], load,pdata[5], qdata[5]);
	DFlop d4(arst, clk, qdata[5]^qdata[0], load, pdata[4],qdata[4]);
	DFlop d3(arst, clk, qdata[4], load, pdata[3],qdata[3]);
	DFlop d2(arst, clk, qdata[3], load,pdata[2], qdata[2]);
	DFlop d1(arst, clk, qdata[2]^qdata[0], pdata[1],load, qdata[1]);
	DFlop d0(arst, clk, qdata[1]^qdata[0], load,pdata[0], qdata[0]);
	
endmodule
