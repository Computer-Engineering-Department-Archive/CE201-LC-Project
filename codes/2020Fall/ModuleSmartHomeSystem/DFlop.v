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
---  Description: Module5:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module DFlop (
	input  arst  , // async reset
	input  clk   , // clock posedge
	input  din   , // data  in
	input  load,
	input load_data, // data  load 
	output reg dout    // data  out
);

	always@(posedge clk or negedge arst) begin
		 if(~arst)
			dout <= 1'b0;
		 else if(~load)
			dout <= din;
			else
			 dout<=load_data;
	end

endmodule
