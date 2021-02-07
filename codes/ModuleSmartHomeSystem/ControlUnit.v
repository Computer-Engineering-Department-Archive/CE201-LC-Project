`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:50 02/03/2021 
// Design Name: 
// Module Name:    ControlUnit 
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

`define STATE_IDLE    3'b001
`define STATE_ACTIVE  3'b010
`define STATE_REQUEST 3'b011
`define STATE_STORE   3'b100
`define STATE_TRAP    3'b101
`define STATE_OTHERS  3'b111

module ControlUnit(
	input         arst      , // async  reset
	input         clk       , // clock  posedge
	input         request   , // request input (asynch) 
	input         confirm   , // confirm input 
	input  [ 1:0] password  , // password from user
	input  [ 1:0] syskey    , // key  from memoty unit
	input  [34:0] configin  , // conf from user
	output reg  [34:0] configout , // conf to memory unit
	output reg       write_en  ,  // conf mem write enable
	output reg [ 2:0] dbg_state   // current state (debug)
);
	 
	 wire equal;
	 PassCheckUnit pass(password,syskey,equal);
	 
	 always @(posedge clk or posedge arst or negedge request) begin
		if(arst)
			dbg_state = `STATE_IDLE;
		else if(~request) begin
			write_en = 1'b0;
			dbg_state = `STATE_IDLE;
		end else 
			case (dbg_state)
			`STATE_IDLE : begin
						dbg_state = `STATE_ACTIVE;
						write_en = 1'b0;
					end
			`STATE_ACTIVE : if(confirm) begin
						write_en = 1'b0;
						if(equal) dbg_state = `STATE_REQUEST;
						else dbg_state = `STATE_TRAP;
					 end else begin
						dbg_state = `STATE_OTHERS;
					 end
			`STATE_REQUEST : if(confirm) begin
						dbg_state = `STATE_STORE;
						write_en = 1'b0;
					 end else begin
						dbg_state = `STATE_OTHERS;
					 end
			`STATE_STORE : begin
						configout = configin;
						write_en = 1'b1;
					end
			endcase
	 end

endmodule

