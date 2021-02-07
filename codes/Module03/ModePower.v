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
---  Module Name: Power Mode (Conting Ones)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module ModePower (
	input  [7:0] chs_conf  , // degree [temprature] 
	output reg [3:0] chs_power , // power  [cooler/heater] 
	output reg       chs_mode    // model  [heat=1/cool=0]
);

	integer i;

	always@(chs_conf)
	begin
		 chs_power = 0;  //initialize count variable.
		 for(i=0;i<8;i=i+1)   //for all the bits.
			  chs_power = chs_power + chs_conf[i]; //Add the bit to the count.
			  
		 if(chs_conf[0])
			chs_mode = 1;
		 else
			chs_mode = 0;
	end

endmodule