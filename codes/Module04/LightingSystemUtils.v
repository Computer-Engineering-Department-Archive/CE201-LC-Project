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
---  Module Name: Lighting System Utils
---  Description: Module4:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module LightningSystemUtils();

	reg [3:0] tcode, ulight, lenght;
	wire [3:0] wshade, lightnum;
	wire [15:0] lightstate;

	LightingSystem uut (
		.tcode(tcode), 
		.ulight(ulight), 
		.lenght(lenght), 
		.wshade(wshade), 
		.lightnum(lightnum), 
		.lightstate(lightstate)
	);

	initial begin
		tcode = 4'b0000; ulight = 4'b1010; lenght = 4'b1100; #100;
		tcode = 4'b0001; #100;
		tcode = 4'b0010; #100;
		tcode = 4'b0100; #100;
		tcode = 4'b1000; #100;  
	end
      
endmodule