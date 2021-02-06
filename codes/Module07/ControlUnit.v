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
---  Module Name: Control Unit
---  Description: Module7:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
`define AAA 3'b001 // IDLE
`define BBB 3'b010 // ACTIVE
`define CCC 3'b011 // REQUEST
`define DDD 3'b100 // STORE
`define EEE 3'b101 // TRAP
`define FFF 3'b111 // FFF

`define STATE_OFF     3'b000
`define STATE_IDLE    3'b001
`define STATE_ACTIVE  3'b010
`define STATE_REQUEST 3'b011
`define STATE_STORE   3'b100
`define STATE_TRAP    3'b101
`define STATE_OTHERS  3'b111


module ControlUnit (
	input         arst      , // async  reset
	input         clk       , // clock  posedge
	input         request   , // request input (asynch) 
	input         confirm   , // confirm input 
	input  [ 1:0] password  , // password from user
	input  [ 1:0] syskey    , // key  from memoty unit
	input  [34:0] configin  , // conf from user
	output reg [34:0] configout , // conf to memory unit
	output        write_en  , // conf mem write enable
	output [ 2:0] dbg_state   // current state (debug)
	);

	reg [2:0] State;
	wire passcheck;
	PassCheckUnit passCheck(.pass(password[1:0]),.key(syskey[1:0]),.equal(passcheck));
	
	assign dbg_state=State;
	
	always @(posedge clk or negedge arst or posedge request) begin
		if(arst ) State =`STATE_OFF;
		else if(request) State=`STATE_OFF;
		else begin
			if(request) begin
					State=`STATE_IDLE;
					if(confirm) begin
						State=`STATE_ACTIVE;
						if(passcheck) begin
							State=`STATE_REQUEST;
							
							if(write_en) State=`STATE_STORE;
							else State=`STATE_OTHERS;
						end else begin
							State=`STATE_TRAP;
						end
					end	
			 else State=`STATE_OTHERS;
		 end else State=`STATE_OFF;
		end
	end //end of always	

	always @(posedge clk)
	begin
		case(dbg_state)
			`STATE_STORE:configout<=configin;
		endcase
end		
endmodule
