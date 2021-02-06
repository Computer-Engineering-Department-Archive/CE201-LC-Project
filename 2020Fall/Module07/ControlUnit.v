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

//`define AAA 3'b001 // IDLE
//`define BBB 3'b010 // ACTIVE
//`define CCC 3'b011 // REQUEST
//`define DDD 3'b100 // STORE
//`define EEE 3'b101 // TRAP
//`define FFF 3'b111 // FFF

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
	output reg [34:0] configout , // conf to memory unit
	output reg write_en  , // conf mem write enable
	output reg [ 2:0] dbg_state   // current state (debug)
    );
	wire write;
	PassCheckUnit P(.pass(password),.key(syskey),.equal(write));
	always @ (posedge clk or negedge arst)
	begin
		if (~arst)
		begin
			configout =0;
			write_en = 1'b0;
			dbg_state = `STATE_IDLE;
		end
		else
		begin
			case (dbg_state)
				`STATE_IDLE : begin
					write_en = 1'b0;
					if (request) dbg_state = `STATE_ACTIVE;
				end
				`STATE_ACTIVE : begin
					if (~request) dbg_state = `STATE_IDLE;
					else if (confirm)
					begin
						write_en = write;
						if (write_en)
							dbg_state = `STATE_REQUEST;
						else
							dbg_state = `STATE_TRAP;
					end
					else dbg_state = `STATE_OTHERS;
				end
				`STATE_REQUEST : begin
					if (~request) dbg_state = `STATE_IDLE;
					else if (confirm)
					begin
						//write_en = write;
						configout = configin;
						dbg_state = `STATE_STORE;
					end
					else dbg_state = `STATE_OTHERS;
				end
				`STATE_STORE : begin
					if (~request) dbg_state = `STATE_IDLE;
					else
					begin
						configout = configin;
					end
				end
				`STATE_TRAP : begin
					//write_en = 1'b0;
					if (~request) dbg_state = `STATE_IDLE;
				end
				`STATE_OTHERS : begin
					if (write_en) dbg_state = `STATE_REQUEST;
					else dbg_state = `STATE_ACTIVE;
				end	
			endcase
		end
	end

endmodule
