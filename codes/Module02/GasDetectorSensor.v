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
---  Module Name: Gas Detector Sensor
---  Description: Module2:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module GasDetectorSensor (
	input        arst     , // async reset
	input        clk      , // clock posedge
	input        din      , // input data 
	output [2:0] dout       // output data
);

	/* write your code here */
	
	/* write your code here */
	ch4Detector first(.x(din),.Z(dout[0]),.CLK(clk),.RST(arst));
	coDetector second(.x(din),.Z(dout[1]),.CLK(clk),.RST(arst));
	co2Detector third(.x(din),.Z(dout[2]),.CLK(clk),.RST(arst));
endmodule
