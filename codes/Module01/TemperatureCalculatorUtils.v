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
---  Module Name: Temperature Calculator Utils
---  Description: Module1:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module TemperatureCalculatorUtils();
	reg  [31:0] tc_base  ; // base [environment degree ]
	reg  [ 7:0] tc_ref   ; // ref  [system work voltage]
	reg  [15:0] adc_data ; // adc  [sensor digital data]
	wire [31:0] tempc;
	
	TemperatureCalculator uut (tc_base, tc_ref, adc_data, tempc);
	
	initial begin
		tc_base = 32'b00000000000000000000000000000001;
		tc_ref = 8'b00011000;
		adc_data = 16'b0011000010000001;
	end
endmodule
