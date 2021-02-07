`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:47 02/07/2021 
// Design Name: 
// Module Name:    Test 
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
module Test;
 // Inputs
 reg arst;
 reg clk;
 reg request;
 reg confirm;
 reg gds_din;
 reg [1:0] password;
 reg [34:0] confdata;
 reg [31:0] tc_base;
 reg [15:0] adc_data;
 reg [7:0] speed;
 reg [3:0] tcode;
 reg dance_load;
 // Outputs
 wire [2:0] gds_dout;
 wire [31:0] tempc;
 wire [3:0] chs_power;
 wire chs_mode;
 wire pwm_data;
 wire [3:0] wshade;
 wire [3:0] lightnum;
 wire [15:0] lightstate;
 wire [7:0] dance_qdata;
 wire [2:0] dbg_state;
 // Instantiate the Unit Under Test (UUT)
 SmartHomeSystem uut (
  .arst(arst),
  .clk(clk),
  .request(request),
  .confirm(confirm),
  .gds_din(gds_din),
  .gds_dout(gds_dout),
  .password(password),
  .confdata(confdata),
  .tc_base(tc_base),
  .adc_data(adc_data),
  .tempc(tempc),
  .speed(speed),
  .chs_power(chs_power),
  .chs_mode(chs_mode),
  .pwm_data(pwm_data),
  .tcode(tcode),
  .wshade(wshade),
  .lightnum(lightnum),
  .lightstate(lightstate),
  .dance_load(dance_load),
  .dance_qdata(dance_qdata),
  .dbg_state(dbg_state)
 );
 initial begin
   arst = 1;
   clk = 0;
   #20 arst=0;
   repeat (160)
  #20 clk = ~clk;
   end
 initial begin
  // Initialize Inputs
  gds_din = 0;
  speed = 8'b10001001;
  tc_base = 32'b10101010101010101010101010101010;
  adc_data = 16'b1010101010101010;
  tcode = 4'b1000;
  dance_load = 1;
   request = 0;
   confirm = 0;
   password = 2'b00;
   confdata = 0;
   #40;//IDLE state
   request = 1'b1;
   #40;// ACTIVE state
   confirm = 1'b1;
   request = 1'b1;
   #40;//REQUEST state
   confirm = 1'b1;
   request = 1'b1;
   confdata = 35'b11010101101000111001010101011001010;
   #80;
    dance_load = 0;
  // Add stimulus here
 #80;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b0;
  #40;
  request = 0;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b1;
  #40;
  gds_din = 1'b0;
   #40;
  gds_din = 1'b0;
  #40;
  gds_din = 1'b1;
   #40;
  gds_din = 1'b0;
   #40;
  gds_din = 1'b0;
   #40;
  gds_din = 1'b1;
   #40;
  gds_din = 1'b0;
   #40;
  gds_din = 1'b0;
 end
endmodule
