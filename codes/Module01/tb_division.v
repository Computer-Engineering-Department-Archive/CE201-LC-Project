`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:00:09 01/26/2021
// Design Name:   division
// Module Name:   M:/uni/thirdsummestur/az manteghi/final proj/phase 1/part 1/tb_division.v
// Project Name:  moudle1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: division
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_division;

  parameter WIDTH = 8;
    // Inputs
    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    // Outputs
    wire [WIDTH-1:0] Res;

    // Instantiate the division module (UUT)
    division #(WIDTH) uut (
        .A(A), 
        .B(B), 
        .Res(Res)
    );

    initial begin
        // Initialize Inputs and wait for 100 ns
        A = 0;  B = 0;  #100;  //Undefined inputs
        //Apply each set of inputs and wait for 100 ns.
        A = 100;    B = 10; #100;
        A = 200;    B = 40; #100;
        A = 90; B = 9;  #100;
        A = 70; B = 10; #100;
        A = 16; B = 3;  #100;
        A = 255;    B = 5;  #100;
    end
      
endmodule

