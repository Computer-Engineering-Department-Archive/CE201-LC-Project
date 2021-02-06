`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:48 01/28/2021 
// Design Name: 
// Module Name:    LampState 
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
module LampState(
		input  [ 3:0] active_lights , // number of active light
		output [15:0] lights_state    // state of lights is on
    );
	 
	assign
		lights_state[0] = (active_lights[0] | active_lights[1]) | (active_lights[2] | active_lights[3]),
		lights_state[1] = active_lights[1] | (active_lights[2] | active_lights[3]),
		lights_state[2] = (active_lights[0] & active_lights[1]) | (active_lights[2] | active_lights[3]),
		lights_state[3] = active_lights[2] | active_lights[3],
		lights_state[4] = active_lights[3] | (active_lights[2] & active_lights[1]) | (active_lights[2] & active_lights[0]),
		lights_state[5] = active_lights[3] | (active_lights[2] & active_lights[1]),
		lights_state[6] = active_lights[3] | ((active_lights[2] & active_lights[1]) & active_lights[0]),
		lights_state[7] = active_lights[3],
		lights_state[8] = active_lights[3] & ((active_lights[2] | active_lights[1]) | active_lights[0]),
		lights_state[9] = active_lights[3] & (active_lights[2] | active_lights[1]),
		lights_state[10] = active_lights[3] & (active_lights[2] | (active_lights[1] & active_lights[0])),
		lights_state[11] = active_lights[3] & active_lights[2],
		lights_state[12] = (active_lights[3] & active_lights[2]) & (active_lights[1] | active_lights[0]),
		lights_state[13] = (active_lights[3] & active_lights[2]) & active_lights[1],
		lights_state[14] = (active_lights[3] & active_lights[2]) & (active_lights[1] & active_lights[0]),
		lights_state[15] = 1'b0;

endmodule
