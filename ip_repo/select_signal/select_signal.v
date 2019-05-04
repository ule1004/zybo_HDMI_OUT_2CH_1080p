`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/05 10:39:44
// Design Name: 
// Module Name: select_signal
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


module select_signal (
    input       a_in,
    input       b_in,
    input       sel,	// 0: a_in, 1: b_in    
    output      y_out
  );

  select_signal_ngc select_signal_ngc_i (
    .a_in(a_in),
    .b_in(b_in),
    .sel(sel),
    .y_out(y_out)
  );

endmodule
