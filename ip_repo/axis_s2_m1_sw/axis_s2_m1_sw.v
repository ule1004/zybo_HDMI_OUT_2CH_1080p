`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/22 10:39:44
// Design Name: 
// Module Name: axis_s2_m1_sw
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


module axis_s2_m1_sw #(
    parameter       DATA_WIDTH  = 32
)
(
    input                       aclk,
    input                       aresetn,
    input                       axis_tdest_sel, // 0: s0_axis, 1: s01_axis
    
    input   [DATA_WIDTH-1:0]    s0_axis_tdata,
    input   [DATA_WIDTH/8-1:0]  s0_axis_tkeep,
    input                       s0_axis_tlast,
    output                      s0_axis_tready,
    input                       s0_axis_tuser,    
    input                       s0_axis_tvalid,
    
    input   [DATA_WIDTH-1:0]    s1_axis_tdata,
    input   [DATA_WIDTH/8-1:0]  s1_axis_tkeep,
    input                       s1_axis_tlast,
    output                      s1_axis_tready,
    input                       s1_axis_tuser,    
    input                       s1_axis_tvalid,
    
    output  [DATA_WIDTH-1:0]    m_axis_tdata,
    output  [DATA_WIDTH/8-1:0]  m_axis_tkeep,
    output                      m_axis_tlast,
    input                       m_axis_tready,
    output                      m_axis_tuser,
    output                      m_axis_tvalid
  );

  axis_s2_m1_sw_ngc #(
    .DATA_WIDTH(DATA_WIDTH)
  ) axis_s2_m1_sw_ngc_i (
    .aclk(aclk),
    .aresetn(aresetn),
    .axis_tdest_sel(axis_tdest_sel),
    .s0_axis_tdata(s0_axis_tdata),
    .s0_axis_tkeep(s0_axis_tkeep),
    .s0_axis_tlast(s0_axis_tlast),
    .s0_axis_tready(s0_axis_tready),
    .s0_axis_tuser(s0_axis_tuser),
    .s0_axis_tvalid(s0_axis_tvalid),
    .s1_axis_tdata(s1_axis_tdata),
    .s1_axis_tkeep(s1_axis_tkeep),
    .s1_axis_tlast(s1_axis_tlast),
    .s1_axis_tready(s1_axis_tready),
    .s1_axis_tuser(s1_axis_tuser),
    .s1_axis_tvalid(s1_axis_tvalid),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tvalid(m_axis_tvalid)
  );

endmodule
