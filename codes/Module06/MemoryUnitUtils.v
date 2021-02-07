`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:07:53 02/07/2021
// Design Name:   MemoryUnit
// Module Name:   E:/git/LCF99/codes/Module06/MemoryUnitUtils.v
// Project Name:  Module06
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryUnitUtils;

	// Inputs
	reg arst;
	reg clk;
	reg wren;
	reg [34:0] din;

	// Outputs
	wire [34:0] dout;

	// Instantiate the Unit Under Test (UUT)
	MemoryUnit uut (
		.arst(arst), 
		.clk(clk), 
		.wren(wren), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		arst = 1;
		clk = 0;
		wren = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
		arst = 0;
		wren = 1;
      din = 35'b1010010011100110011110100010011;
		// Add stimulus here


	 forever begin
		#10 clk = ~clk;
	 end
	end
      
endmodule

