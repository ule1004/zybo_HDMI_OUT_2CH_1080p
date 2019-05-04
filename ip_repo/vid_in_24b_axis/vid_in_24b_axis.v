`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/07/01 17:01:51
// Design Name: 
// Module Name: vid_in_24b_axis
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


  module vid_in_24b_axis #(
    parameter integer DATA_WIDTH    = 24
  ) 
  (
    input                       vclk,               // video clock
    input                       aclk,               // axis clock
    input                       resetn,             // video clock resetn
    
    input                       vid_vblank,         // video vertical blank
    input                       vid_vsync,          // video vertical sync
    input                       vid_hblank,         // video horizontal blank
    input                       vid_hsync,          // video horizontal sync
    input                       vid_active_video,   // video data enable
    input   [DATA_WIDTH-1:0]    vid_data,           // video data
    input                       field_id_in,        // field_id in
    
    output  [DATA_WIDTH-1:0]    m_axis_tdata,       // axis M data
    output  [DATA_WIDTH/8-1:0]  m_axis_tkeep,       // axis M keep
    output                      m_axis_tlast,       // axis M end of line
    input                       m_axis_tready,      // axis M ready 
    output                      m_axis_tuser,       // axis M user(sof) 
    output                      m_axis_tvalid,      // axis M valid 
    
    output                      vtd_vblank,         // vtiming vblank
    output                      vtd_vsync,          // vtiming vsync
    output                      vtd_hblank,         // vtiming hblank
    output                      vtd_hsync,          // vtiming hsync
    output                      vtd_active_video,   // vtiming active_video
    output                      field_id_out,       // field_id out   
    output                      axis_enable         // axi stream enable   
  );

  vid_in_24b_axis_ngc #(
    .DATA_WIDTH(DATA_WIDTH)
  ) vid_in_24b_axis_ngc_i (
    .vclk(vclk),
    .aclk(aclk),
    .resetn(resetn),
    
    .vid_vblank(vid_vblank),
    .vid_vsync(vid_vsync),
    .vid_hblank(vid_hblank),
    .vid_hsync(vid_hsync),
    .vid_active_video(vid_active_video),
    .vid_data(vid_data),
    .field_id_in(field_id_in),
    
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tvalid(m_axis_tvalid), 
    
    .vtd_vblank(vtd_vblank),
    .vtd_vsync(vtd_vsync),
    .vtd_hblank(vtd_hblank),
    .vtd_hsync(vtd_hsync),
    .vtd_active_video(vtd_active_video),
    .field_id_out(field_id_out),   
    .axis_enable(axis_enable)  
  );
    
endmodule
