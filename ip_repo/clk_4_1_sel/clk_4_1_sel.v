`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 10:39:44
// Design Name: 
// Module Name: clk_sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_4_1_sel (
    input       a_clk,
    input       b_clk,
    input       c_clk,
    input       d_clk,    
    input [1:0] sel,		// 00=a_clk, 01=b_clk, 10=c_clk, 11=d_clk
    output      out_clk
);

    assign out_clk = (sel == 2'b00) ? a_clk : 
                     (sel == 2'b01) ? b_clk :
                     (sel == 2'b10) ? c_clk : d_clk;

endmodule
