`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/04 11:06:05
// Design Name: 
// Module Name: signal_trig
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


module signal_trig (
    input                       clk,            // clock
    input                       rst,            // reset

    input                       trig_sig_in,
    output                      trig_sig_out
  );

  signal_trig_ngc signal_trig_ngc_i (
    .clk(clk),
    .rst(rst),
    .trig_sig_in(trig_sig_in),
    .trig_sig_out(trig_sig_out)
  );
      
endmodule