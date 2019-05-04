`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/22 10:39:44
// Design Name: 
// Module Name: clk_div_by2
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


module clk_div_by2 (
    input  wire clk,
    input  wire rstn,
    output reg  out_clk
);

    always @(posedge clk) begin
        if (!rstn)
            out_clk <= 1'b0;
        else
            out_clk <= ~out_clk;
    end	

endmodule
