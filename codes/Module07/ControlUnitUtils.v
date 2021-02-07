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
---  Module Name:  Control Unit Utils
---  Description: Module7:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module ControlUnitUtils;
 // Inputs
 reg arst;
 reg clk;
 reg request;
 reg confirm;
 reg [1:0] password;
 reg [1:0] syskey;
 reg [34:0] configin;
 // Outputs
 wire [34:0] configout;
 wire write_en;
 wire [2:0] dbg_state;
 // Instantiate the Unit Under Test (UUT)
 ControlUnit uut (
  .arst(arst), 
  .clk(clk), 
  .request(request), 
  .confirm(confirm), 
  .password(password), 
  .syskey(syskey), 
  .configin(configin), 
  .configout(configout), 
  .write_en(write_en), 
  .dbg_state(dbg_state)
 );
 initial begin
  arst = 1;
  clk = 0;
  #40 arst=0;
  repeat (30)
   #40 clk = ~clk;
   end
 initial begin
  // Initialize Inputs
  request = 0;
  confirm = 0;
  syskey = 2'b10;
  configin = 0;
  #80;//IDLE state
  request = 1'b1;
  #80;// ACTIVE state
  password = 2'b10;
  confirm = 1'b1;
  request = 1'b1;
  #80;//REQUEST state
  confirm = 1'b1;
  request = 1'b1;
  configin = 35'b11010101101000111001010101011001010;
  #80;//STORE state
  password = 2'b11;
  #80;//IDLE state
  request = 1'b1;
  #80;// ACTIVE state
  confirm = 1'b1;
  request = 1'b1;
  #80;//REQUEST state
  confirm = 1'b1;
  request = 1'b1;
  configin = 35'b11010101101000111001111111111111111;
  #80;//STORE state
  #80
  request = 1'b0;
 end
endmodule
