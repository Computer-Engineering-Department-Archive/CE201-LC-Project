`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:46:36 01/26/2021 
// Design Name: 
// Module Name:    ch4Detector 
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
module ch4Detector(x,Z,CLK,RST);
   input x,CLK,RST;
   output Z;
	
   reg [3:0] state;
   parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001,S10=4'b1010;
      always @ (posedge CLK or negedge RST)
         if (~RST) state = S0;  //Initialize to state S0
	    else
case (state)
            S0: if (~x)  state = S0; else state = S1; 
            S1: if (~x)  state = S2; else state = S1;   
            S2: if (~x)  state = S0; else state = S3;
			   S3: if (~x)  state = S2; else state = S4;
			   S4: if (~x)  state = S2; else state = S5; 
			   S5: if (~x)  state = S6; else state = S1; 
			   S6: if (~x)  state = S0; else state = S7;
		      S7: if (~x)  state = S8; else state = S4; 
			   S8: if (~x)  state = S0; else state = S9; 
				S9: if (~x)  state = S10; else state = S4; 
				S10: if (~x)  state = S0; else state = S3; 
				
         endcase
		assign
			Z=state[3]&state[1];
endmodule

