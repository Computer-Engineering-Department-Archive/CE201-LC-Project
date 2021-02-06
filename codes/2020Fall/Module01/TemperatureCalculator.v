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

	wire [15:0] _8x8res;
	wire [7:0] tempRef;
	wire [31:0] div, _16x16res;
	
	assign tempRef=(tc_ref[7]?-tc_ref:tc_ref);
	
	Multiplier8x8 multiplier_first(.A(tempRef[7:0]),.B(tempRef[7:0]),.P(_8x8res[15:0]));
	Multiplier16x16 multiplier_second(.A(_8x8res[15:0]),.B({1'b0,adc_data[14:0]}),.P(_16x16res[31:0]));

	assign div = _16x16res / 64;
	AdderSubtractor32x32 adder32x32(.A(tc_base[31:0]),.B(div[31:0]),.sel(adc_data[15]),.S(tempc[31:0]));
	

endmodule

