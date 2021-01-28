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
---  Module Name: Temperature Calculator
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns 


module TemperatureCalculator (
	input  [31:0] tc_base  , // base [environment degree ]
	input  [ 7:0] tc_ref   , // ref  [system work voltage]
	input  [15:0] adc_data , // adc  [sensor digital data]
	output [31:0] tempc      // temp [temperature celsius]
);

	wire [7:0] tempRef;
	wire [15:0] _8x8res;
	wire [31:0] tempbase, ttempc, _16x16res;
	
	assign tempRef=(tc_ref[7]?-tc_ref:tc_ref);
	assign tempbase=~(tc_base-1);
	
	Multiplier8x8 m8x8(.A(tempRef[7:0]),.B(tempRef[7:0]),.P(_8x8res[15:0]));
	Multiplier16x16 m16x16(.A(_8x8res[15:0]),.B({1'b0,adc_data[14:0]}),.P(_16x16res[31:0]));
	AdderSubtractor32x32 adder32x32(.A(tempbase[31:0]),.B(_16x16res[31:0]),.sel(adc_data[15]),.S(ttempc[31:0]));
	assign tempc=~ttempc+1;
	

endmodule

