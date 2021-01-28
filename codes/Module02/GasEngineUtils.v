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
---  Module Name: Gas Engine Utils
---  Description: Module2:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module GasEngineUtils();

	reg arst, clk, din;
	wire [2:0]dout;
	
	GasDetectorSensor gds(arst, clk, din, dout);
	
	always begin
		#5; clk = ~clk;
	end
		
	initial begin
		clk = 0; arst = 1; din = 0; #10
		din = 1; #10;
		din = 0; #10;
		din = 1; #10;
		din = 1; #10;
		din = 1; #10;
		din = 0; #10;
		din = 1; #10;
		din = 0; #10;
		din = 1; #10;
		din = 0; #10; //ch4
		din = 0; #10; 
		din = 1; #10; 
		din = 0; #10;
		din = 0; #10;
		din = 1; #10;
		din = 1; #10; //co
		din = 1; #10;
		din = 0; #10;
		din = 0; #10;
		din = 1; #10;
		din = 0; #10;
		din = 0; #10;
		din = 1; #10;
		din = 0; #10;
		din = 0; #10; //co2
	end
endmodule
