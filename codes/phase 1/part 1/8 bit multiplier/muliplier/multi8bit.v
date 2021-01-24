`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:58:44 01/24/2021 
// Design Name: 
// Module Name:    multi8bit 
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
module multi8bit(
		input [7:0] A,B,
		output [15:0] P
    );
	 
	 //8 bit adder 1
	 wire AB00, AB10, AB20, AB30, AB40, AB50, AB60, AB70;
	 wire AB01, AB11, AB21, AB31, AB41, AB51, AB61, AB71;
	 wire c0;
	 wire [7:0] S0;
	 
	 //B[0]
	 assign AB00 = A[0] & B[0],
			  AB10 = A[1] & B[0],
			  AB20 = A[2] & B[0],
			  AB30 = A[3] & B[0],
			  AB40 = A[4] & B[0],
			  AB50 = A[5] & B[0],
			  AB60 = A[6] & B[0],
			  AB70 = A[7] & B[0];
	 
	 //B[1]
	 assign AB01 = A[0] & B[1],
			  AB11 = A[1] & B[1],
			  AB21 = A[2] & B[1],
			  AB31 = A[3] & B[1],
			  AB41 = A[4] & B[1],
			  AB51 = A[5] & B[1],
			  AB61 = A[6] & B[1],
			  AB71 = A[7] & B[1];
			  

	FA8bit FA8bit_0(.A({0, AB70, AB60, AB50, AB40, AB30, AB20, AB10}),
		    			 .B({AB71, AB61, AB51, AB41, AB31, AB21, AB11, AB01}),
	  				    .cin(0), .S(S0), .co(c0));
						 
	assign P[0] = AB00;
	//-------------------------------------------------------------------------------------------------------//
	
						  
	//8 bit adder 2
	 wire AB02, AB12, AB22, AB32, AB42, AB52, AB62, AB72;
	 wire c1;
	 wire [7:0] S1;
	 
	 //B[2]
	 assign AB02 = A[0] & B[2],
			  AB12 = A[1] & B[2],
			  AB22 = A[2] & B[2],
			  AB32 = A[3] & B[2],
			  AB42 = A[4] & B[2],
			  AB52 = A[5] & B[2],
			  AB62 = A[6] & B[2],
			  AB72 = A[7] & B[2];
			  

	FA8bit FA8bit_1(.A({c0, S0[7], S0[6], S0[5], S0[4], S0[3], S0[2], S0[1]}),
		    			 .B({AB72, AB62, AB52, AB42, AB32, AB22, AB12, AB02}),
	  				    .cin(0), .S(S1), .co(c1));
						 
	assign P[1] = S0[0];  
	//-------------------------------------------------------------------------------------------------------//
	
	
	//8 bit adder 3
	 wire AB03, AB13, AB23, AB33, AB43, AB53, AB63, AB73;
	 wire c2;
	 wire [7:0] S2;
	 
	 //B[3]
	 assign AB03 = A[0] & B[3],
			  AB13 = A[1] & B[3],
			  AB23 = A[2] & B[3],
			  AB33 = A[3] & B[3],
			  AB43 = A[4] & B[3],
			  AB53 = A[5] & B[3],
			  AB63 = A[6] & B[3],
			  AB73 = A[7] & B[3];
			  

	FA8bit FA8bit_2(.A({c1, S1[7], S1[6], S1[5], S1[4], S1[3], S1[2], S1[1]}),
					 .B({AB73, AB63, AB53, AB43, AB33, AB23, AB13, AB03}),
					 .cin(0), .S(S2), .co(c2));
					 
	assign P[2] = S1[0];
	//-------------------------------------------------------------------------------------------------------//
	
	
	//8 bit adder 4
	 wire AB04, AB14, AB24, AB34, AB44, AB54, AB64, AB74;
	 wire c3;
	 wire [7:0] S3;
	 
	 //B[4]
	 assign AB04 = A[0] & B[4],
			  AB14 = A[1] & B[4],
			  AB24 = A[2] & B[4],
			  AB34 = A[3] & B[4],
			  AB44 = A[4] & B[4],
			  AB54 = A[5] & B[4],
			  AB64 = A[6] & B[4],
			  AB74 = A[7] & B[4];
			  

	FA8bit FA8bit_3(.A({c2, S2[7], S2[6], S2[5], S2[4], S2[3], S2[2], S2[1]}),
						 .B({AB74, AB64, AB54, AB44, AB34, AB24, AB14, AB04}),
						 .cin(0), .S(S3), .co(c3));
						 
	assign P[3] = S1[0];
	//-------------------------------------------------------------------------------------------------------//
	
	
	//8 bit adder 5
	 wire AB05, AB15, AB25, AB35, AB45, AB55, AB65, AB75;
	 wire c4;
	 wire [7:0] S4;
	 
	 //B[5]
	 assign AB05 = A[0] & B[5],
			  AB15 = A[1] & B[5],
			  AB25 = A[2] & B[5],
			  AB35 = A[3] & B[5],
			  AB45 = A[4] & B[5],
			  AB55 = A[5] & B[5],
			  AB65 = A[6] & B[5],
			  AB75 = A[7] & B[5];
			  

	FA8bit FA8bit_4(.A({c3, S3[7], S3[6], S3[5], S3[4], S3[3], S3[2], S3[1]}),
						 .B({AB75, AB65, AB55, AB45, AB35, AB25, AB15, AB05}),
						 .cin(0), .S(S4), .co(c4));
						 
	assign P[4] = S3[0];
	//-------------------------------------------------------------------------------------------------------//
	
	
	//8 bit adder 6
	 wire AB06, AB16, AB26, AB36, AB46, AB56, AB66, AB76;
	 wire c5;
	 wire [7:0] S5;
	 
	 //B[6]
	 assign AB06 = A[0] & B[6],
			  AB16 = A[1] & B[6],
			  AB26 = A[2] & B[6],
			  AB36 = A[3] & B[6],
			  AB46 = A[4] & B[6],
			  AB56 = A[5] & B[6],
			  AB66 = A[6] & B[6],
			  AB76 = A[7] & B[6];
			  

	FA8bit FA8bit_5(.A({c4, S4[7], S4[6], S4[5], S4[4], S4[3], S4[2], S4[1]}),
						 .B({AB76, AB66, AB56, AB46, AB36, AB26, AB16, AB06}),
						 .cin(0), .S(S5), .co(c5));
						 
	assign P[5] = S4[0];
	//-------------------------------------------------------------------------------------------------------//
	
	
	//8 bit adder 7
	 wire AB07, AB17, AB27, AB37, AB47, AB57, AB67, AB77;
	 wire c6;
	 
	 //B[4]
	 assign AB07 = A[0] & B[7],
			  AB17 = A[1] & B[7],
			  AB27 = A[2] & B[7],
			  AB37 = A[3] & B[7],
			  AB47 = A[4] & B[7],
			  AB57 = A[5] & B[7],
			  AB67 = A[6] & B[7],
			  AB77 = A[7] & B[7];
			  

	FA8bit FA8bit_6(.A({c5, S5[7], S5[6], S5[5], S5[4], S5[3], S5[2], S5[1]}),
						 .B({AB77, AB67, AB57, AB47, AB37, AB27, AB17, AB07}),
						 .cin(0), 
						 .S({P[14], P[13], P[12], P[11], P[10], P[9], P[8], P[7]}),
						 .co(P[15]));
						 
	assign P[6] = S5[0];
		
						  
				


endmodule
