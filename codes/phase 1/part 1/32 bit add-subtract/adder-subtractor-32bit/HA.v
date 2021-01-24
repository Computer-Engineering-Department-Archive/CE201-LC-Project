`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:39 01/24/2021 
// Design Name: 
// Module Name:    HA 
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
module HA(
   A,
   B,
   sum,
   carry
   );
 
  input  A;
  input  B;
  output sum;
  output carry;
 
  assign sum   = A ^ B;
  assign carry = A & B;  
 
endmodule // half_adder
