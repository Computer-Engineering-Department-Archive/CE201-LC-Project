<<<<<<< HEAD
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
=======
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:09 01/28/2021 
// Design Name: 
// Module Name:    TemperatureCalculatorUtils 
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
>>>>>>> cf7cbb9ed0800a9de5a5f8ba23d39996c1d43e6a
`timescale 1 ns/1 ns
module TemperatureCalculatorUtils();
	reg  [31:0] tc_base  ; // base [environment degree ]
	reg  [ 7:0] tc_ref   ; // ref  [system work voltage]
	reg  [15:0] adc_data ; // adc  [sensor digital data]
	wire [31:0] tempc;
<<<<<<< HEAD
	
	TemperatureCalculator uut (tc_base, tc_ref, asc_data, tempc);
	
=======

	TemperatureCalculator uut (tc_base, tc_ref, adc_data, tempc);

>>>>>>> cf7cbb9ed0800a9de5a5f8ba23d39996c1d43e6a
	initial begin
		tc_base = 32'b00000000000000000000000000000001;
		tc_ref = 8'b00011000;
		adc_data = 16'b0011000010000001;
<<<<<<< HEAD
=======
		#100;
		tc_base = 32'b10101010101010101010101010101010;
	   adc_data = 16'b1010101010101010;
	   tc_ref = 8'b11000110 ;
>>>>>>> cf7cbb9ed0800a9de5a5f8ba23d39996c1d43e6a
	end
endmodule
