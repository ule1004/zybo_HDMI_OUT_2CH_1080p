//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sat May  4 12:49:58 2019
//Host        : ALICE354D running 64-bit major release  (build 9200)
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module HDMI_OUT1_imp_RXEMK2
   (S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid,
    TMDS_clk_n,
    TMDS_clk_p,
    TMDS_data_n,
    TMDS_data_p,
    pix_aresetn,
    pix_clk);
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [0:0]S_AXIS_tuser;
  input S_AXIS_tvalid;
  output TMDS_clk_n;
  output TMDS_clk_p;
  output [2:0]TMDS_data_n;
  output [2:0]TMDS_data_p;
  input pix_aresetn;
  input pix_clk;

  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [2:0]Conn1_DATA_N;
  wire [2:0]Conn1_DATA_P;
  wire Net;
  wire Net1;
  wire [31:0]S_AXIS_1_TDATA;
  wire [3:0]S_AXIS_1_TKEEP;
  wire S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire [0:0]S_AXIS_1_TUSER;
  wire S_AXIS_1_TVALID;
  wire [23:0]axis_32to24_converter_M_AXIS_TDATA;
  wire axis_32to24_converter_M_AXIS_TLAST;
  wire axis_32to24_converter_M_AXIS_TREADY;
  wire [0:0]axis_32to24_converter_M_AXIS_TUSER;
  wire axis_32to24_converter_M_AXIS_TVALID;
  wire [0:0]hdmi_high_dout;
  wire hdmi_vid_out_locked;
  wire hdmi_vid_out_overflow;
  wire hdmi_vid_out_underflow;
  wire hdmi_vid_out_vid_active_video;
  wire [23:0]hdmi_vid_out_vid_data;
  wire hdmi_vid_out_vid_field_id;
  wire hdmi_vid_out_vid_hblank;
  wire hdmi_vid_out_vid_hsync;
  wire hdmi_vid_out_vid_vblank;
  wire hdmi_vid_out_vid_vsync;
  wire hdmi_vid_out_vtg_ce;
  wire [0:0]util_vector_logic_and_Res;
  wire [0:0]util_vector_logic_not_Res;
  wire v_tc_active_video_out;
  wire v_tc_hblank_out;
  wire v_tc_hsync_out;
  wire v_tc_vblank_out;
  wire v_tc_vsync_out;

  assign Net = pix_clk;
  assign Net1 = pix_aresetn;
  assign S_AXIS_1_TDATA = S_AXIS_tdata[31:0];
  assign S_AXIS_1_TKEEP = S_AXIS_tkeep[3:0];
  assign S_AXIS_1_TLAST = S_AXIS_tlast;
  assign S_AXIS_1_TUSER = S_AXIS_tuser[0];
  assign S_AXIS_1_TVALID = S_AXIS_tvalid;
  assign S_AXIS_tready = S_AXIS_1_TREADY;
  assign TMDS_clk_n = Conn1_CLK_N;
  assign TMDS_clk_p = Conn1_CLK_P;
  assign TMDS_data_n[2:0] = Conn1_DATA_N;
  assign TMDS_data_p[2:0] = Conn1_DATA_P;
  system_axis_32to24_converter_0 axis_32to24_converter
       (.aclk(Net),
        .aresetn(Net1),
        .m_axis_tdata(axis_32to24_converter_M_AXIS_TDATA),
        .m_axis_tlast(axis_32to24_converter_M_AXIS_TLAST),
        .m_axis_tready(axis_32to24_converter_M_AXIS_TREADY),
        .m_axis_tuser(axis_32to24_converter_M_AXIS_TUSER),
        .m_axis_tvalid(axis_32to24_converter_M_AXIS_TVALID),
        .s_axis_tdata(S_AXIS_1_TDATA),
        .s_axis_tkeep(S_AXIS_1_TKEEP),
        .s_axis_tlast(S_AXIS_1_TLAST),
        .s_axis_tready(S_AXIS_1_TREADY),
        .s_axis_tuser(S_AXIS_1_TUSER),
        .s_axis_tvalid(S_AXIS_1_TVALID));
  system_hdmi_high_0 hdmi_high
       (.dout(hdmi_high_dout));
  system_hdmi_vid_out_0 hdmi_vid_out
       (.aclk(Net),
        .aclken(util_vector_logic_and_Res),
        .aresetn(Net1),
        .fid(1'b0),
        .locked(hdmi_vid_out_locked),
        .overflow(hdmi_vid_out_overflow),
        .s_axis_video_tdata(axis_32to24_converter_M_AXIS_TDATA),
        .s_axis_video_tlast(axis_32to24_converter_M_AXIS_TLAST),
        .s_axis_video_tready(axis_32to24_converter_M_AXIS_TREADY),
        .s_axis_video_tuser(axis_32to24_converter_M_AXIS_TUSER),
        .s_axis_video_tvalid(axis_32to24_converter_M_AXIS_TVALID),
        .underflow(hdmi_vid_out_underflow),
        .vid_active_video(hdmi_vid_out_vid_active_video),
        .vid_data(hdmi_vid_out_vid_data),
        .vid_field_id(hdmi_vid_out_vid_field_id),
        .vid_hblank(hdmi_vid_out_vid_hblank),
        .vid_hsync(hdmi_vid_out_vid_hsync),
        .vid_io_out_ce(hdmi_high_dout),
        .vid_vblank(hdmi_vid_out_vid_vblank),
        .vid_vsync(hdmi_vid_out_vid_vsync),
        .vtg_active_video(v_tc_active_video_out),
        .vtg_ce(hdmi_vid_out_vtg_ce),
        .vtg_field_id(1'b0),
        .vtg_hblank(v_tc_hblank_out),
        .vtg_hsync(v_tc_hsync_out),
        .vtg_vblank(v_tc_vblank_out),
        .vtg_vsync(v_tc_vsync_out));
  system_ila_video_out_0 ila_video_out
       (.clk(Net),
        .probe0(hdmi_vid_out_vid_active_video),
        .probe1(hdmi_vid_out_vid_data),
        .probe10(hdmi_vid_out_underflow),
        .probe2(hdmi_vid_out_vid_field_id),
        .probe3(hdmi_vid_out_vid_hblank),
        .probe4(hdmi_vid_out_vid_hsync),
        .probe5(hdmi_vid_out_vid_vblank),
        .probe6(hdmi_vid_out_vid_vsync),
        .probe7(hdmi_vid_out_vtg_ce),
        .probe8(hdmi_vid_out_locked),
        .probe9(hdmi_vid_out_overflow));
  system_rgb2dvi_0 rgb2dvi
       (.PixelClk(Net),
        .TMDS_Clk_n(Conn1_CLK_N),
        .TMDS_Clk_p(Conn1_CLK_P),
        .TMDS_Data_n(Conn1_DATA_N),
        .TMDS_Data_p(Conn1_DATA_P),
        .aRst(util_vector_logic_not_Res),
        .vid_pData(hdmi_vid_out_vid_data),
        .vid_pHSync(hdmi_vid_out_vid_hsync),
        .vid_pVDE(hdmi_vid_out_vid_active_video),
        .vid_pVSync(hdmi_vid_out_vid_vsync));
  system_util_vector_logic_and_0 util_vector_logic_and
       (.Op1(hdmi_high_dout),
        .Op2(Net1),
        .Res(util_vector_logic_and_Res));
  system_util_vector_logic_not_0 util_vector_logic_not
       (.Op1(Net1),
        .Res(util_vector_logic_not_Res));
  system_v_tc_0 v_tc
       (.active_video_out(v_tc_active_video_out),
        .clk(Net),
        .clken(util_vector_logic_and_Res),
        .gen_clken(hdmi_vid_out_vtg_ce),
        .hblank_out(v_tc_hblank_out),
        .hsync_out(v_tc_hsync_out),
        .resetn(Net1),
        .vblank_out(v_tc_vblank_out),
        .vsync_out(v_tc_vsync_out));
endmodule

module HDMI_OUT_imp_1Y13FX3
   (S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid,
    TMDS_clk_n,
    TMDS_clk_p,
    TMDS_data_n,
    TMDS_data_p,
    pix_aresetn,
    pix_clk);
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [0:0]S_AXIS_tuser;
  input S_AXIS_tvalid;
  output TMDS_clk_n;
  output TMDS_clk_p;
  output [2:0]TMDS_data_n;
  output [2:0]TMDS_data_p;
  input pix_aresetn;
  input pix_clk;

  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [2:0]Conn1_DATA_N;
  wire [2:0]Conn1_DATA_P;
  wire Net;
  wire Net1;
  wire [31:0]S_AXIS_1_TDATA;
  wire [3:0]S_AXIS_1_TKEEP;
  wire S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire [0:0]S_AXIS_1_TUSER;
  wire S_AXIS_1_TVALID;
  wire [23:0]axis_32to24_converter_M_AXIS_TDATA;
  wire axis_32to24_converter_M_AXIS_TLAST;
  wire axis_32to24_converter_M_AXIS_TREADY;
  wire [0:0]axis_32to24_converter_M_AXIS_TUSER;
  wire axis_32to24_converter_M_AXIS_TVALID;
  wire [0:0]hdmi_high_dout;
  wire hdmi_vid_out_locked;
  wire hdmi_vid_out_overflow;
  wire hdmi_vid_out_underflow;
  wire hdmi_vid_out_vid_active_video;
  wire [23:0]hdmi_vid_out_vid_data;
  wire hdmi_vid_out_vid_field_id;
  wire hdmi_vid_out_vid_hblank;
  wire hdmi_vid_out_vid_hsync;
  wire hdmi_vid_out_vid_vblank;
  wire hdmi_vid_out_vid_vsync;
  wire hdmi_vid_out_vtg_ce;
  wire [0:0]util_vector_logic_and_Res;
  wire [0:0]util_vector_logic_not_Res;
  wire v_tc_active_video_out;
  wire v_tc_hblank_out;
  wire v_tc_hsync_out;
  wire v_tc_vblank_out;
  wire v_tc_vsync_out;

  assign Net = pix_clk;
  assign Net1 = pix_aresetn;
  assign S_AXIS_1_TDATA = S_AXIS_tdata[31:0];
  assign S_AXIS_1_TKEEP = S_AXIS_tkeep[3:0];
  assign S_AXIS_1_TLAST = S_AXIS_tlast;
  assign S_AXIS_1_TUSER = S_AXIS_tuser[0];
  assign S_AXIS_1_TVALID = S_AXIS_tvalid;
  assign S_AXIS_tready = S_AXIS_1_TREADY;
  assign TMDS_clk_n = Conn1_CLK_N;
  assign TMDS_clk_p = Conn1_CLK_P;
  assign TMDS_data_n[2:0] = Conn1_DATA_N;
  assign TMDS_data_p[2:0] = Conn1_DATA_P;
  system_axis_subset_converter_0_1 axis_32to24_converter
       (.aclk(Net),
        .aresetn(Net1),
        .m_axis_tdata(axis_32to24_converter_M_AXIS_TDATA),
        .m_axis_tlast(axis_32to24_converter_M_AXIS_TLAST),
        .m_axis_tready(axis_32to24_converter_M_AXIS_TREADY),
        .m_axis_tuser(axis_32to24_converter_M_AXIS_TUSER),
        .m_axis_tvalid(axis_32to24_converter_M_AXIS_TVALID),
        .s_axis_tdata(S_AXIS_1_TDATA),
        .s_axis_tkeep(S_AXIS_1_TKEEP),
        .s_axis_tlast(S_AXIS_1_TLAST),
        .s_axis_tready(S_AXIS_1_TREADY),
        .s_axis_tuser(S_AXIS_1_TUSER),
        .s_axis_tvalid(S_AXIS_1_TVALID));
  system_xlconstant_0_0 hdmi_high
       (.dout(hdmi_high_dout));
  system_v_axi4s_vid_out_0_0 hdmi_vid_out
       (.aclk(Net),
        .aclken(util_vector_logic_and_Res),
        .aresetn(Net1),
        .fid(1'b0),
        .locked(hdmi_vid_out_locked),
        .overflow(hdmi_vid_out_overflow),
        .s_axis_video_tdata(axis_32to24_converter_M_AXIS_TDATA),
        .s_axis_video_tlast(axis_32to24_converter_M_AXIS_TLAST),
        .s_axis_video_tready(axis_32to24_converter_M_AXIS_TREADY),
        .s_axis_video_tuser(axis_32to24_converter_M_AXIS_TUSER),
        .s_axis_video_tvalid(axis_32to24_converter_M_AXIS_TVALID),
        .underflow(hdmi_vid_out_underflow),
        .vid_active_video(hdmi_vid_out_vid_active_video),
        .vid_data(hdmi_vid_out_vid_data),
        .vid_field_id(hdmi_vid_out_vid_field_id),
        .vid_hblank(hdmi_vid_out_vid_hblank),
        .vid_hsync(hdmi_vid_out_vid_hsync),
        .vid_io_out_ce(hdmi_high_dout),
        .vid_vblank(hdmi_vid_out_vid_vblank),
        .vid_vsync(hdmi_vid_out_vid_vsync),
        .vtg_active_video(v_tc_active_video_out),
        .vtg_ce(hdmi_vid_out_vtg_ce),
        .vtg_field_id(1'b0),
        .vtg_hblank(v_tc_hblank_out),
        .vtg_hsync(v_tc_hsync_out),
        .vtg_vblank(v_tc_vblank_out),
        .vtg_vsync(v_tc_vsync_out));
  system_ila_0_2 ila_video_out
       (.clk(Net),
        .probe0(hdmi_vid_out_vid_active_video),
        .probe1(hdmi_vid_out_vid_data),
        .probe10(hdmi_vid_out_underflow),
        .probe2(hdmi_vid_out_vid_field_id),
        .probe3(hdmi_vid_out_vid_hblank),
        .probe4(hdmi_vid_out_vid_hsync),
        .probe5(hdmi_vid_out_vid_vblank),
        .probe6(hdmi_vid_out_vid_vsync),
        .probe7(hdmi_vid_out_vtg_ce),
        .probe8(hdmi_vid_out_locked),
        .probe9(hdmi_vid_out_overflow));
  system_rgb2dvi_0_1 rgb2dvi
       (.PixelClk(Net),
        .TMDS_Clk_n(Conn1_CLK_N),
        .TMDS_Clk_p(Conn1_CLK_P),
        .TMDS_Data_n(Conn1_DATA_N),
        .TMDS_Data_p(Conn1_DATA_P),
        .aRst(util_vector_logic_not_Res),
        .vid_pData(hdmi_vid_out_vid_data),
        .vid_pHSync(hdmi_vid_out_vid_hsync),
        .vid_pVDE(hdmi_vid_out_vid_active_video),
        .vid_pVSync(hdmi_vid_out_vid_vsync));
  system_util_vector_logic_0_1 util_vector_logic_and
       (.Op1(hdmi_high_dout),
        .Op2(Net1),
        .Res(util_vector_logic_and_Res));
  system_util_vector_logic_0_0 util_vector_logic_not
       (.Op1(Net1),
        .Res(util_vector_logic_not_Res));
  system_v_tc_0_0 v_tc
       (.active_video_out(v_tc_active_video_out),
        .clk(Net),
        .clken(util_vector_logic_and_Res),
        .gen_clken(hdmi_vid_out_vtg_ce),
        .hblank_out(v_tc_hblank_out),
        .hsync_out(v_tc_hsync_out),
        .resetn(Net1),
        .vblank_out(v_tc_vblank_out),
        .vsync_out(v_tc_vsync_out));
endmodule

module TPG_imp_1PPIREW
   (AXIS_TPG_tdata,
    AXIS_TPG_tkeep,
    AXIS_TPG_tlast,
    AXIS_TPG_tready,
    AXIS_TPG_tuser,
    AXIS_TPG_tvalid,
    pix_clk,
    pix_rst_n,
    s_axi_CTRL_araddr,
    s_axi_CTRL_arready,
    s_axi_CTRL_arvalid,
    s_axi_CTRL_awaddr,
    s_axi_CTRL_awready,
    s_axi_CTRL_awvalid,
    s_axi_CTRL_bready,
    s_axi_CTRL_bresp,
    s_axi_CTRL_bvalid,
    s_axi_CTRL_rdata,
    s_axi_CTRL_rready,
    s_axi_CTRL_rresp,
    s_axi_CTRL_rvalid,
    s_axi_CTRL_wdata,
    s_axi_CTRL_wready,
    s_axi_CTRL_wstrb,
    s_axi_CTRL_wvalid);
  output [31:0]AXIS_TPG_tdata;
  output [3:0]AXIS_TPG_tkeep;
  output AXIS_TPG_tlast;
  input AXIS_TPG_tready;
  output [0:0]AXIS_TPG_tuser;
  output AXIS_TPG_tvalid;
  input pix_clk;
  input [0:0]pix_rst_n;
  input [7:0]s_axi_CTRL_araddr;
  output s_axi_CTRL_arready;
  input s_axi_CTRL_arvalid;
  input [7:0]s_axi_CTRL_awaddr;
  output s_axi_CTRL_awready;
  input s_axi_CTRL_awvalid;
  input s_axi_CTRL_bready;
  output [1:0]s_axi_CTRL_bresp;
  output s_axi_CTRL_bvalid;
  output [31:0]s_axi_CTRL_rdata;
  input s_axi_CTRL_rready;
  output [1:0]s_axi_CTRL_rresp;
  output s_axi_CTRL_rvalid;
  input [31:0]s_axi_CTRL_wdata;
  output s_axi_CTRL_wready;
  input [3:0]s_axi_CTRL_wstrb;
  input s_axi_CTRL_wvalid;

  wire [31:0]Conn1_TDATA;
  wire [3:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire [0:0]Conn1_TUSER;
  wire Conn1_TVALID;
  wire ap_clk_1;
  wire [0:0]ap_rst_n_1;
  wire [7:0]s_axi_CTRL_1_ARADDR;
  wire s_axi_CTRL_1_ARREADY;
  wire s_axi_CTRL_1_ARVALID;
  wire [7:0]s_axi_CTRL_1_AWADDR;
  wire s_axi_CTRL_1_AWREADY;
  wire s_axi_CTRL_1_AWVALID;
  wire s_axi_CTRL_1_BREADY;
  wire [1:0]s_axi_CTRL_1_BRESP;
  wire s_axi_CTRL_1_BVALID;
  wire [31:0]s_axi_CTRL_1_RDATA;
  wire s_axi_CTRL_1_RREADY;
  wire [1:0]s_axi_CTRL_1_RRESP;
  wire s_axi_CTRL_1_RVALID;
  wire [31:0]s_axi_CTRL_1_WDATA;
  wire s_axi_CTRL_1_WREADY;
  wire [3:0]s_axi_CTRL_1_WSTRB;
  wire s_axi_CTRL_1_WVALID;
  wire [23:0]v_tpg_m_axis_video_TDATA;
  wire [0:0]v_tpg_m_axis_video_TDEST;
  wire [0:0]v_tpg_m_axis_video_TID;
  wire [2:0]v_tpg_m_axis_video_TKEEP;
  wire [0:0]v_tpg_m_axis_video_TLAST;
  wire v_tpg_m_axis_video_TREADY;
  wire [2:0]v_tpg_m_axis_video_TSTRB;
  wire [0:0]v_tpg_m_axis_video_TUSER;
  wire v_tpg_m_axis_video_TVALID;

  assign AXIS_TPG_tdata[31:0] = Conn1_TDATA;
  assign AXIS_TPG_tkeep[3:0] = Conn1_TKEEP;
  assign AXIS_TPG_tlast = Conn1_TLAST;
  assign AXIS_TPG_tuser[0] = Conn1_TUSER;
  assign AXIS_TPG_tvalid = Conn1_TVALID;
  assign Conn1_TREADY = AXIS_TPG_tready;
  assign ap_clk_1 = pix_clk;
  assign ap_rst_n_1 = pix_rst_n[0];
  assign s_axi_CTRL_1_ARADDR = s_axi_CTRL_araddr[7:0];
  assign s_axi_CTRL_1_ARVALID = s_axi_CTRL_arvalid;
  assign s_axi_CTRL_1_AWADDR = s_axi_CTRL_awaddr[7:0];
  assign s_axi_CTRL_1_AWVALID = s_axi_CTRL_awvalid;
  assign s_axi_CTRL_1_BREADY = s_axi_CTRL_bready;
  assign s_axi_CTRL_1_RREADY = s_axi_CTRL_rready;
  assign s_axi_CTRL_1_WDATA = s_axi_CTRL_wdata[31:0];
  assign s_axi_CTRL_1_WSTRB = s_axi_CTRL_wstrb[3:0];
  assign s_axi_CTRL_1_WVALID = s_axi_CTRL_wvalid;
  assign s_axi_CTRL_arready = s_axi_CTRL_1_ARREADY;
  assign s_axi_CTRL_awready = s_axi_CTRL_1_AWREADY;
  assign s_axi_CTRL_bresp[1:0] = s_axi_CTRL_1_BRESP;
  assign s_axi_CTRL_bvalid = s_axi_CTRL_1_BVALID;
  assign s_axi_CTRL_rdata[31:0] = s_axi_CTRL_1_RDATA;
  assign s_axi_CTRL_rresp[1:0] = s_axi_CTRL_1_RRESP;
  assign s_axi_CTRL_rvalid = s_axi_CTRL_1_RVALID;
  assign s_axi_CTRL_wready = s_axi_CTRL_1_WREADY;
  system_axis_subset_converter_0_0 axis_24to32_converter
       (.aclk(ap_clk_1),
        .aresetn(ap_rst_n_1),
        .m_axis_tdata(Conn1_TDATA),
        .m_axis_tkeep(Conn1_TKEEP),
        .m_axis_tlast(Conn1_TLAST),
        .m_axis_tready(Conn1_TREADY),
        .m_axis_tuser(Conn1_TUSER),
        .m_axis_tvalid(Conn1_TVALID),
        .s_axis_tdata(v_tpg_m_axis_video_TDATA),
        .s_axis_tdest(v_tpg_m_axis_video_TDEST),
        .s_axis_tid(v_tpg_m_axis_video_TID),
        .s_axis_tkeep(v_tpg_m_axis_video_TKEEP),
        .s_axis_tlast(v_tpg_m_axis_video_TLAST),
        .s_axis_tready(v_tpg_m_axis_video_TREADY),
        .s_axis_tstrb(v_tpg_m_axis_video_TSTRB),
        .s_axis_tuser(v_tpg_m_axis_video_TUSER),
        .s_axis_tvalid(v_tpg_m_axis_video_TVALID));
  system_v_tpg_0_0 v_tpg
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .fid_in(1'b1),
        .m_axis_video_TDATA(v_tpg_m_axis_video_TDATA),
        .m_axis_video_TDEST(v_tpg_m_axis_video_TDEST),
        .m_axis_video_TID(v_tpg_m_axis_video_TID),
        .m_axis_video_TKEEP(v_tpg_m_axis_video_TKEEP),
        .m_axis_video_TLAST(v_tpg_m_axis_video_TLAST),
        .m_axis_video_TREADY(v_tpg_m_axis_video_TREADY),
        .m_axis_video_TSTRB(v_tpg_m_axis_video_TSTRB),
        .m_axis_video_TUSER(v_tpg_m_axis_video_TUSER),
        .m_axis_video_TVALID(v_tpg_m_axis_video_TVALID),
        .s_axi_CTRL_ARADDR(s_axi_CTRL_1_ARADDR),
        .s_axi_CTRL_ARREADY(s_axi_CTRL_1_ARREADY),
        .s_axi_CTRL_ARVALID(s_axi_CTRL_1_ARVALID),
        .s_axi_CTRL_AWADDR(s_axi_CTRL_1_AWADDR),
        .s_axi_CTRL_AWREADY(s_axi_CTRL_1_AWREADY),
        .s_axi_CTRL_AWVALID(s_axi_CTRL_1_AWVALID),
        .s_axi_CTRL_BREADY(s_axi_CTRL_1_BREADY),
        .s_axi_CTRL_BRESP(s_axi_CTRL_1_BRESP),
        .s_axi_CTRL_BVALID(s_axi_CTRL_1_BVALID),
        .s_axi_CTRL_RDATA(s_axi_CTRL_1_RDATA),
        .s_axi_CTRL_RREADY(s_axi_CTRL_1_RREADY),
        .s_axi_CTRL_RRESP(s_axi_CTRL_1_RRESP),
        .s_axi_CTRL_RVALID(s_axi_CTRL_1_RVALID),
        .s_axi_CTRL_WDATA(s_axi_CTRL_1_WDATA),
        .s_axi_CTRL_WREADY(s_axi_CTRL_1_WREADY),
        .s_axi_CTRL_WSTRB(s_axi_CTRL_1_WSTRB),
        .s_axi_CTRL_WVALID(s_axi_CTRL_1_WVALID));
endmodule

module Zynq_system_imp_CEU7LT
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    HP_Interconnect_ACLK,
    HP_interconnect_aresetn,
    HP_peripheral_aresetn,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S_AXI_HP0_awaddr,
    S_AXI_HP0_awburst,
    S_AXI_HP0_awcache,
    S_AXI_HP0_awlen,
    S_AXI_HP0_awlock,
    S_AXI_HP0_awprot,
    S_AXI_HP0_awqos,
    S_AXI_HP0_awready,
    S_AXI_HP0_awsize,
    S_AXI_HP0_awvalid,
    S_AXI_HP0_bready,
    S_AXI_HP0_bresp,
    S_AXI_HP0_bvalid,
    S_AXI_HP0_wdata,
    S_AXI_HP0_wlast,
    S_AXI_HP0_wready,
    S_AXI_HP0_wstrb,
    S_AXI_HP0_wvalid,
    S_AXI_HP1_araddr,
    S_AXI_HP1_arburst,
    S_AXI_HP1_arcache,
    S_AXI_HP1_arlen,
    S_AXI_HP1_arlock,
    S_AXI_HP1_arprot,
    S_AXI_HP1_arqos,
    S_AXI_HP1_arready,
    S_AXI_HP1_arsize,
    S_AXI_HP1_arvalid,
    S_AXI_HP1_rdata,
    S_AXI_HP1_rlast,
    S_AXI_HP1_rready,
    S_AXI_HP1_rresp,
    S_AXI_HP1_rvalid,
    S_AXI_HP2_araddr,
    S_AXI_HP2_arburst,
    S_AXI_HP2_arcache,
    S_AXI_HP2_arlen,
    S_AXI_HP2_arlock,
    S_AXI_HP2_arprot,
    S_AXI_HP2_arqos,
    S_AXI_HP2_arready,
    S_AXI_HP2_arsize,
    S_AXI_HP2_arvalid,
    S_AXI_HP2_rdata,
    S_AXI_HP2_rlast,
    S_AXI_HP2_rready,
    S_AXI_HP2_rresp,
    S_AXI_HP2_rvalid,
    axi_lite_ARESETN,
    axi_lite_CLK,
    intr_0,
    intr_1,
    intr_2,
    per_pix_aresetn150,
    pix_clk150);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output HP_Interconnect_ACLK;
  output [0:0]HP_interconnect_aresetn;
  output [0:0]HP_peripheral_aresetn;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [0:0]M01_AXI_wvalid;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [0:0]M02_AXI_wvalid;
  output [7:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [7:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output M04_AXI_wvalid;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output M05_AXI_wvalid;
  output [7:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [7:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input [31:0]S_AXI_HP0_awaddr;
  input [1:0]S_AXI_HP0_awburst;
  input [3:0]S_AXI_HP0_awcache;
  input [3:0]S_AXI_HP0_awlen;
  input [1:0]S_AXI_HP0_awlock;
  input [2:0]S_AXI_HP0_awprot;
  input [3:0]S_AXI_HP0_awqos;
  output S_AXI_HP0_awready;
  input [2:0]S_AXI_HP0_awsize;
  input S_AXI_HP0_awvalid;
  input S_AXI_HP0_bready;
  output [1:0]S_AXI_HP0_bresp;
  output S_AXI_HP0_bvalid;
  input [63:0]S_AXI_HP0_wdata;
  input S_AXI_HP0_wlast;
  output S_AXI_HP0_wready;
  input [7:0]S_AXI_HP0_wstrb;
  input S_AXI_HP0_wvalid;
  input [31:0]S_AXI_HP1_araddr;
  input [1:0]S_AXI_HP1_arburst;
  input [3:0]S_AXI_HP1_arcache;
  input [3:0]S_AXI_HP1_arlen;
  input [1:0]S_AXI_HP1_arlock;
  input [2:0]S_AXI_HP1_arprot;
  input [3:0]S_AXI_HP1_arqos;
  output S_AXI_HP1_arready;
  input [2:0]S_AXI_HP1_arsize;
  input S_AXI_HP1_arvalid;
  output [63:0]S_AXI_HP1_rdata;
  output S_AXI_HP1_rlast;
  input S_AXI_HP1_rready;
  output [1:0]S_AXI_HP1_rresp;
  output S_AXI_HP1_rvalid;
  input [31:0]S_AXI_HP2_araddr;
  input [1:0]S_AXI_HP2_arburst;
  input [3:0]S_AXI_HP2_arcache;
  input [3:0]S_AXI_HP2_arlen;
  input [1:0]S_AXI_HP2_arlock;
  input [2:0]S_AXI_HP2_arprot;
  input [3:0]S_AXI_HP2_arqos;
  output S_AXI_HP2_arready;
  input [2:0]S_AXI_HP2_arsize;
  input S_AXI_HP2_arvalid;
  output [63:0]S_AXI_HP2_rdata;
  output S_AXI_HP2_rlast;
  input S_AXI_HP2_rready;
  output [1:0]S_AXI_HP2_rresp;
  output S_AXI_HP2_rvalid;
  output [0:0]axi_lite_ARESETN;
  output axi_lite_CLK;
  input [0:0]intr_0;
  input [0:0]intr_1;
  input [0:0]intr_2;
  output [0:0]per_pix_aresetn150;
  output pix_clk150;

  wire [0:0]ARESETN_1;
  wire [31:0]Conn1_ARADDR;
  wire [1:0]Conn1_ARBURST;
  wire [3:0]Conn1_ARCACHE;
  wire [3:0]Conn1_ARLEN;
  wire [1:0]Conn1_ARLOCK;
  wire [2:0]Conn1_ARPROT;
  wire [3:0]Conn1_ARQOS;
  wire Conn1_ARREADY;
  wire [2:0]Conn1_ARSIZE;
  wire Conn1_ARVALID;
  wire [63:0]Conn1_RDATA;
  wire Conn1_RLAST;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn3_ARADDR;
  wire Conn3_ARREADY;
  wire Conn3_ARVALID;
  wire [31:0]Conn3_AWADDR;
  wire Conn3_AWREADY;
  wire Conn3_AWVALID;
  wire Conn3_BREADY;
  wire [1:0]Conn3_BRESP;
  wire Conn3_BVALID;
  wire [31:0]Conn3_RDATA;
  wire Conn3_RREADY;
  wire [1:0]Conn3_RRESP;
  wire Conn3_RVALID;
  wire [31:0]Conn3_WDATA;
  wire Conn3_WREADY;
  wire Conn3_WVALID;
  wire [31:0]Conn4_ARADDR;
  wire Conn4_ARREADY;
  wire Conn4_ARVALID;
  wire [31:0]Conn4_AWADDR;
  wire Conn4_AWREADY;
  wire Conn4_AWVALID;
  wire Conn4_BREADY;
  wire [1:0]Conn4_BRESP;
  wire Conn4_BVALID;
  wire [31:0]Conn4_RDATA;
  wire Conn4_RREADY;
  wire [1:0]Conn4_RRESP;
  wire Conn4_RVALID;
  wire [31:0]Conn4_WDATA;
  wire Conn4_WREADY;
  wire Conn4_WVALID;
  wire [7:0]Conn5_ARADDR;
  wire Conn5_ARREADY;
  wire Conn5_ARVALID;
  wire [7:0]Conn5_AWADDR;
  wire Conn5_AWREADY;
  wire Conn5_AWVALID;
  wire Conn5_BREADY;
  wire [1:0]Conn5_BRESP;
  wire Conn5_BVALID;
  wire [31:0]Conn5_RDATA;
  wire Conn5_RREADY;
  wire [1:0]Conn5_RRESP;
  wire Conn5_RVALID;
  wire [31:0]Conn5_WDATA;
  wire Conn5_WREADY;
  wire [3:0]Conn5_WSTRB;
  wire Conn5_WVALID;
  wire [0:0]In1_1;
  wire [0:0]In2_1;
  wire [3:0]PL2PS_IRQ_dout;
  wire [0:0]PL_Switch_ip2intc_irpt;
  wire [31:0]S_AXI_HP0_1_AWADDR;
  wire [1:0]S_AXI_HP0_1_AWBURST;
  wire [3:0]S_AXI_HP0_1_AWCACHE;
  wire [3:0]S_AXI_HP0_1_AWLEN;
  wire [1:0]S_AXI_HP0_1_AWLOCK;
  wire [2:0]S_AXI_HP0_1_AWPROT;
  wire [3:0]S_AXI_HP0_1_AWQOS;
  wire S_AXI_HP0_1_AWREADY;
  wire [2:0]S_AXI_HP0_1_AWSIZE;
  wire S_AXI_HP0_1_AWVALID;
  wire S_AXI_HP0_1_BREADY;
  wire [1:0]S_AXI_HP0_1_BRESP;
  wire S_AXI_HP0_1_BVALID;
  wire [63:0]S_AXI_HP0_1_WDATA;
  wire S_AXI_HP0_1_WLAST;
  wire S_AXI_HP0_1_WREADY;
  wire [7:0]S_AXI_HP0_1_WSTRB;
  wire S_AXI_HP0_1_WVALID;
  wire [31:0]S_AXI_HP1_1_ARADDR;
  wire [1:0]S_AXI_HP1_1_ARBURST;
  wire [3:0]S_AXI_HP1_1_ARCACHE;
  wire [3:0]S_AXI_HP1_1_ARLEN;
  wire [1:0]S_AXI_HP1_1_ARLOCK;
  wire [2:0]S_AXI_HP1_1_ARPROT;
  wire [3:0]S_AXI_HP1_1_ARQOS;
  wire S_AXI_HP1_1_ARREADY;
  wire [2:0]S_AXI_HP1_1_ARSIZE;
  wire S_AXI_HP1_1_ARVALID;
  wire [63:0]S_AXI_HP1_1_RDATA;
  wire S_AXI_HP1_1_RLAST;
  wire S_AXI_HP1_1_RREADY;
  wire [1:0]S_AXI_HP1_1_RRESP;
  wire S_AXI_HP1_1_RVALID;
  wire clk_150_200_150_clk_out1;
  wire [0:0]proc_sys_reset_150M_peripheral_aresetn;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_CLK1;
  wire processing_system7_0_FCLK_CLK2;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire [31:0]ps7_0_axi_periph_M00_AXI_ARADDR;
  wire [0:0]ps7_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]ps7_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps7_0_axi_periph_M00_AXI_AWADDR;
  wire [0:0]ps7_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]ps7_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]ps7_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps7_0_axi_periph_M00_AXI_BRESP;
  wire [0:0]ps7_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps7_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]ps7_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps7_0_axi_periph_M00_AXI_RRESP;
  wire [0:0]ps7_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps7_0_axi_periph_M00_AXI_WDATA;
  wire [0:0]ps7_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps7_0_axi_periph_M00_AXI_WSTRB;
  wire [0:0]ps7_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps7_0_axi_periph_M01_AXI_ARADDR;
  wire [0:0]ps7_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]ps7_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps7_0_axi_periph_M01_AXI_AWADDR;
  wire [0:0]ps7_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]ps7_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]ps7_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps7_0_axi_periph_M01_AXI_BRESP;
  wire [0:0]ps7_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps7_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]ps7_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps7_0_axi_periph_M01_AXI_RRESP;
  wire [0:0]ps7_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps7_0_axi_periph_M01_AXI_WDATA;
  wire [0:0]ps7_0_axi_periph_M01_AXI_WREADY;
  wire [0:0]ps7_0_axi_periph_M01_AXI_WVALID;
  wire [31:0]ps7_0_axi_periph_M02_AXI_ARADDR;
  wire [0:0]ps7_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]ps7_0_axi_periph_M02_AXI_ARVALID;
  wire [31:0]ps7_0_axi_periph_M02_AXI_AWADDR;
  wire [0:0]ps7_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]ps7_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]ps7_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]ps7_0_axi_periph_M02_AXI_BRESP;
  wire [0:0]ps7_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]ps7_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]ps7_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]ps7_0_axi_periph_M02_AXI_RRESP;
  wire [0:0]ps7_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]ps7_0_axi_periph_M02_AXI_WDATA;
  wire [0:0]ps7_0_axi_periph_M02_AXI_WREADY;
  wire [0:0]ps7_0_axi_periph_M02_AXI_WVALID;
  wire [7:0]ps7_0_axi_periph_M03_AXI_ARADDR;
  wire ps7_0_axi_periph_M03_AXI_ARREADY;
  wire ps7_0_axi_periph_M03_AXI_ARVALID;
  wire [7:0]ps7_0_axi_periph_M03_AXI_AWADDR;
  wire ps7_0_axi_periph_M03_AXI_AWREADY;
  wire ps7_0_axi_periph_M03_AXI_AWVALID;
  wire ps7_0_axi_periph_M03_AXI_BREADY;
  wire [1:0]ps7_0_axi_periph_M03_AXI_BRESP;
  wire ps7_0_axi_periph_M03_AXI_BVALID;
  wire [31:0]ps7_0_axi_periph_M03_AXI_RDATA;
  wire ps7_0_axi_periph_M03_AXI_RREADY;
  wire [1:0]ps7_0_axi_periph_M03_AXI_RRESP;
  wire ps7_0_axi_periph_M03_AXI_RVALID;
  wire [31:0]ps7_0_axi_periph_M03_AXI_WDATA;
  wire ps7_0_axi_periph_M03_AXI_WREADY;
  wire [3:0]ps7_0_axi_periph_M03_AXI_WSTRB;
  wire ps7_0_axi_periph_M03_AXI_WVALID;
  wire [0:0]rst_ps7_0_250M_interconnect_aresetn;
  wire [0:0]rst_ps7_0_250M_peripheral_aresetn;
  wire [0:0]rst_ps7_0_50M_peripheral_aresetn;

  assign Conn1_ARADDR = S_AXI_HP2_araddr[31:0];
  assign Conn1_ARBURST = S_AXI_HP2_arburst[1:0];
  assign Conn1_ARCACHE = S_AXI_HP2_arcache[3:0];
  assign Conn1_ARLEN = S_AXI_HP2_arlen[3:0];
  assign Conn1_ARLOCK = S_AXI_HP2_arlock[1:0];
  assign Conn1_ARPROT = S_AXI_HP2_arprot[2:0];
  assign Conn1_ARQOS = S_AXI_HP2_arqos[3:0];
  assign Conn1_ARSIZE = S_AXI_HP2_arsize[2:0];
  assign Conn1_ARVALID = S_AXI_HP2_arvalid;
  assign Conn1_RREADY = S_AXI_HP2_rready;
  assign Conn3_ARREADY = M04_AXI_arready;
  assign Conn3_AWREADY = M04_AXI_awready;
  assign Conn3_BRESP = M04_AXI_bresp[1:0];
  assign Conn3_BVALID = M04_AXI_bvalid;
  assign Conn3_RDATA = M04_AXI_rdata[31:0];
  assign Conn3_RRESP = M04_AXI_rresp[1:0];
  assign Conn3_RVALID = M04_AXI_rvalid;
  assign Conn3_WREADY = M04_AXI_wready;
  assign Conn4_ARREADY = M05_AXI_arready;
  assign Conn4_AWREADY = M05_AXI_awready;
  assign Conn4_BRESP = M05_AXI_bresp[1:0];
  assign Conn4_BVALID = M05_AXI_bvalid;
  assign Conn4_RDATA = M05_AXI_rdata[31:0];
  assign Conn4_RRESP = M05_AXI_rresp[1:0];
  assign Conn4_RVALID = M05_AXI_rvalid;
  assign Conn4_WREADY = M05_AXI_wready;
  assign Conn5_ARREADY = M06_AXI_arready;
  assign Conn5_AWREADY = M06_AXI_awready;
  assign Conn5_BRESP = M06_AXI_bresp[1:0];
  assign Conn5_BVALID = M06_AXI_bvalid;
  assign Conn5_RDATA = M06_AXI_rdata[31:0];
  assign Conn5_RRESP = M06_AXI_rresp[1:0];
  assign Conn5_RVALID = M06_AXI_rvalid;
  assign Conn5_WREADY = M06_AXI_wready;
  assign HP_Interconnect_ACLK = processing_system7_0_FCLK_CLK2;
  assign HP_interconnect_aresetn[0] = rst_ps7_0_250M_interconnect_aresetn;
  assign HP_peripheral_aresetn[0] = rst_ps7_0_250M_peripheral_aresetn;
  assign In1_1 = intr_1[0];
  assign In2_1 = intr_2[0];
  assign M00_AXI_araddr[31:0] = ps7_0_axi_periph_M00_AXI_ARADDR;
  assign M00_AXI_arvalid[0] = ps7_0_axi_periph_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[31:0] = ps7_0_axi_periph_M00_AXI_AWADDR;
  assign M00_AXI_awvalid[0] = ps7_0_axi_periph_M00_AXI_AWVALID;
  assign M00_AXI_bready[0] = ps7_0_axi_periph_M00_AXI_BREADY;
  assign M00_AXI_rready[0] = ps7_0_axi_periph_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = ps7_0_axi_periph_M00_AXI_WDATA;
  assign M00_AXI_wstrb[3:0] = ps7_0_axi_periph_M00_AXI_WSTRB;
  assign M00_AXI_wvalid[0] = ps7_0_axi_periph_M00_AXI_WVALID;
  assign M01_AXI_araddr[31:0] = ps7_0_axi_periph_M01_AXI_ARADDR;
  assign M01_AXI_arvalid[0] = ps7_0_axi_periph_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[31:0] = ps7_0_axi_periph_M01_AXI_AWADDR;
  assign M01_AXI_awvalid[0] = ps7_0_axi_periph_M01_AXI_AWVALID;
  assign M01_AXI_bready[0] = ps7_0_axi_periph_M01_AXI_BREADY;
  assign M01_AXI_rready[0] = ps7_0_axi_periph_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = ps7_0_axi_periph_M01_AXI_WDATA;
  assign M01_AXI_wvalid[0] = ps7_0_axi_periph_M01_AXI_WVALID;
  assign M02_AXI_araddr[31:0] = ps7_0_axi_periph_M02_AXI_ARADDR;
  assign M02_AXI_arvalid[0] = ps7_0_axi_periph_M02_AXI_ARVALID;
  assign M02_AXI_awaddr[31:0] = ps7_0_axi_periph_M02_AXI_AWADDR;
  assign M02_AXI_awvalid[0] = ps7_0_axi_periph_M02_AXI_AWVALID;
  assign M02_AXI_bready[0] = ps7_0_axi_periph_M02_AXI_BREADY;
  assign M02_AXI_rready[0] = ps7_0_axi_periph_M02_AXI_RREADY;
  assign M02_AXI_wdata[31:0] = ps7_0_axi_periph_M02_AXI_WDATA;
  assign M02_AXI_wvalid[0] = ps7_0_axi_periph_M02_AXI_WVALID;
  assign M03_AXI_araddr[7:0] = ps7_0_axi_periph_M03_AXI_ARADDR;
  assign M03_AXI_arvalid = ps7_0_axi_periph_M03_AXI_ARVALID;
  assign M03_AXI_awaddr[7:0] = ps7_0_axi_periph_M03_AXI_AWADDR;
  assign M03_AXI_awvalid = ps7_0_axi_periph_M03_AXI_AWVALID;
  assign M03_AXI_bready = ps7_0_axi_periph_M03_AXI_BREADY;
  assign M03_AXI_rready = ps7_0_axi_periph_M03_AXI_RREADY;
  assign M03_AXI_wdata[31:0] = ps7_0_axi_periph_M03_AXI_WDATA;
  assign M03_AXI_wstrb[3:0] = ps7_0_axi_periph_M03_AXI_WSTRB;
  assign M03_AXI_wvalid = ps7_0_axi_periph_M03_AXI_WVALID;
  assign M04_AXI_araddr[31:0] = Conn3_ARADDR;
  assign M04_AXI_arvalid = Conn3_ARVALID;
  assign M04_AXI_awaddr[31:0] = Conn3_AWADDR;
  assign M04_AXI_awvalid = Conn3_AWVALID;
  assign M04_AXI_bready = Conn3_BREADY;
  assign M04_AXI_rready = Conn3_RREADY;
  assign M04_AXI_wdata[31:0] = Conn3_WDATA;
  assign M04_AXI_wvalid = Conn3_WVALID;
  assign M05_AXI_araddr[31:0] = Conn4_ARADDR;
  assign M05_AXI_arvalid = Conn4_ARVALID;
  assign M05_AXI_awaddr[31:0] = Conn4_AWADDR;
  assign M05_AXI_awvalid = Conn4_AWVALID;
  assign M05_AXI_bready = Conn4_BREADY;
  assign M05_AXI_rready = Conn4_RREADY;
  assign M05_AXI_wdata[31:0] = Conn4_WDATA;
  assign M05_AXI_wvalid = Conn4_WVALID;
  assign M06_AXI_araddr[7:0] = Conn5_ARADDR;
  assign M06_AXI_arvalid = Conn5_ARVALID;
  assign M06_AXI_awaddr[7:0] = Conn5_AWADDR;
  assign M06_AXI_awvalid = Conn5_AWVALID;
  assign M06_AXI_bready = Conn5_BREADY;
  assign M06_AXI_rready = Conn5_RREADY;
  assign M06_AXI_wdata[31:0] = Conn5_WDATA;
  assign M06_AXI_wstrb[3:0] = Conn5_WSTRB;
  assign M06_AXI_wvalid = Conn5_WVALID;
  assign PL_Switch_ip2intc_irpt = intr_0[0];
  assign S_AXI_HP0_1_AWADDR = S_AXI_HP0_awaddr[31:0];
  assign S_AXI_HP0_1_AWBURST = S_AXI_HP0_awburst[1:0];
  assign S_AXI_HP0_1_AWCACHE = S_AXI_HP0_awcache[3:0];
  assign S_AXI_HP0_1_AWLEN = S_AXI_HP0_awlen[3:0];
  assign S_AXI_HP0_1_AWLOCK = S_AXI_HP0_awlock[1:0];
  assign S_AXI_HP0_1_AWPROT = S_AXI_HP0_awprot[2:0];
  assign S_AXI_HP0_1_AWQOS = S_AXI_HP0_awqos[3:0];
  assign S_AXI_HP0_1_AWSIZE = S_AXI_HP0_awsize[2:0];
  assign S_AXI_HP0_1_AWVALID = S_AXI_HP0_awvalid;
  assign S_AXI_HP0_1_BREADY = S_AXI_HP0_bready;
  assign S_AXI_HP0_1_WDATA = S_AXI_HP0_wdata[63:0];
  assign S_AXI_HP0_1_WLAST = S_AXI_HP0_wlast;
  assign S_AXI_HP0_1_WSTRB = S_AXI_HP0_wstrb[7:0];
  assign S_AXI_HP0_1_WVALID = S_AXI_HP0_wvalid;
  assign S_AXI_HP0_awready = S_AXI_HP0_1_AWREADY;
  assign S_AXI_HP0_bresp[1:0] = S_AXI_HP0_1_BRESP;
  assign S_AXI_HP0_bvalid = S_AXI_HP0_1_BVALID;
  assign S_AXI_HP0_wready = S_AXI_HP0_1_WREADY;
  assign S_AXI_HP1_1_ARADDR = S_AXI_HP1_araddr[31:0];
  assign S_AXI_HP1_1_ARBURST = S_AXI_HP1_arburst[1:0];
  assign S_AXI_HP1_1_ARCACHE = S_AXI_HP1_arcache[3:0];
  assign S_AXI_HP1_1_ARLEN = S_AXI_HP1_arlen[3:0];
  assign S_AXI_HP1_1_ARLOCK = S_AXI_HP1_arlock[1:0];
  assign S_AXI_HP1_1_ARPROT = S_AXI_HP1_arprot[2:0];
  assign S_AXI_HP1_1_ARQOS = S_AXI_HP1_arqos[3:0];
  assign S_AXI_HP1_1_ARSIZE = S_AXI_HP1_arsize[2:0];
  assign S_AXI_HP1_1_ARVALID = S_AXI_HP1_arvalid;
  assign S_AXI_HP1_1_RREADY = S_AXI_HP1_rready;
  assign S_AXI_HP1_arready = S_AXI_HP1_1_ARREADY;
  assign S_AXI_HP1_rdata[63:0] = S_AXI_HP1_1_RDATA;
  assign S_AXI_HP1_rlast = S_AXI_HP1_1_RLAST;
  assign S_AXI_HP1_rresp[1:0] = S_AXI_HP1_1_RRESP;
  assign S_AXI_HP1_rvalid = S_AXI_HP1_1_RVALID;
  assign S_AXI_HP2_arready = Conn1_ARREADY;
  assign S_AXI_HP2_rdata[63:0] = Conn1_RDATA;
  assign S_AXI_HP2_rlast = Conn1_RLAST;
  assign S_AXI_HP2_rresp[1:0] = Conn1_RRESP;
  assign S_AXI_HP2_rvalid = Conn1_RVALID;
  assign axi_lite_ARESETN[0] = rst_ps7_0_50M_peripheral_aresetn;
  assign axi_lite_CLK = processing_system7_0_FCLK_CLK0;
  assign per_pix_aresetn150[0] = proc_sys_reset_150M_peripheral_aresetn;
  assign pix_clk150 = clk_150_200_150_clk_out1;
  assign ps7_0_axi_periph_M00_AXI_ARREADY = M00_AXI_arready[0];
  assign ps7_0_axi_periph_M00_AXI_AWREADY = M00_AXI_awready[0];
  assign ps7_0_axi_periph_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign ps7_0_axi_periph_M00_AXI_BVALID = M00_AXI_bvalid[0];
  assign ps7_0_axi_periph_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign ps7_0_axi_periph_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign ps7_0_axi_periph_M00_AXI_RVALID = M00_AXI_rvalid[0];
  assign ps7_0_axi_periph_M00_AXI_WREADY = M00_AXI_wready[0];
  assign ps7_0_axi_periph_M01_AXI_ARREADY = M01_AXI_arready[0];
  assign ps7_0_axi_periph_M01_AXI_AWREADY = M01_AXI_awready[0];
  assign ps7_0_axi_periph_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign ps7_0_axi_periph_M01_AXI_BVALID = M01_AXI_bvalid[0];
  assign ps7_0_axi_periph_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign ps7_0_axi_periph_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign ps7_0_axi_periph_M01_AXI_RVALID = M01_AXI_rvalid[0];
  assign ps7_0_axi_periph_M01_AXI_WREADY = M01_AXI_wready[0];
  assign ps7_0_axi_periph_M02_AXI_ARREADY = M02_AXI_arready[0];
  assign ps7_0_axi_periph_M02_AXI_AWREADY = M02_AXI_awready[0];
  assign ps7_0_axi_periph_M02_AXI_BRESP = M02_AXI_bresp[1:0];
  assign ps7_0_axi_periph_M02_AXI_BVALID = M02_AXI_bvalid[0];
  assign ps7_0_axi_periph_M02_AXI_RDATA = M02_AXI_rdata[31:0];
  assign ps7_0_axi_periph_M02_AXI_RRESP = M02_AXI_rresp[1:0];
  assign ps7_0_axi_periph_M02_AXI_RVALID = M02_AXI_rvalid[0];
  assign ps7_0_axi_periph_M02_AXI_WREADY = M02_AXI_wready[0];
  assign ps7_0_axi_periph_M03_AXI_ARREADY = M03_AXI_arready;
  assign ps7_0_axi_periph_M03_AXI_AWREADY = M03_AXI_awready;
  assign ps7_0_axi_periph_M03_AXI_BRESP = M03_AXI_bresp[1:0];
  assign ps7_0_axi_periph_M03_AXI_BVALID = M03_AXI_bvalid;
  assign ps7_0_axi_periph_M03_AXI_RDATA = M03_AXI_rdata[31:0];
  assign ps7_0_axi_periph_M03_AXI_RRESP = M03_AXI_rresp[1:0];
  assign ps7_0_axi_periph_M03_AXI_RVALID = M03_AXI_rvalid;
  assign ps7_0_axi_periph_M03_AXI_WREADY = M03_AXI_wready;
  system_xlconcat_0_0 PL2PS_IRQ
       (.In0(PL_Switch_ip2intc_irpt),
        .In1(In1_1),
        .In2(In2_1),
        .In3(1'b0),
        .dout(PL2PS_IRQ_dout));
  pix_clk_imp_SQ3M8U pix_clk
       (.clk_in1(processing_system7_0_FCLK_CLK1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .per_pix_aresetn150(proc_sys_reset_150M_peripheral_aresetn),
        .pix_clk150(clk_150_200_150_clk_out1));
  system_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_CLK1(processing_system7_0_FCLK_CLK1),
        .FCLK_CLK2(processing_system7_0_FCLK_CLK2),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .IRQ_F2P(PL2PS_IRQ_dout),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(processing_system7_0_FCLK_CLK2),
        .S_AXI_HP0_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARBURST({1'b0,1'b1}),
        .S_AXI_HP0_ARCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP0_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP0_ARVALID(1'b0),
        .S_AXI_HP0_AWADDR(S_AXI_HP0_1_AWADDR),
        .S_AXI_HP0_AWBURST(S_AXI_HP0_1_AWBURST),
        .S_AXI_HP0_AWCACHE(S_AXI_HP0_1_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(S_AXI_HP0_1_AWLEN),
        .S_AXI_HP0_AWLOCK(S_AXI_HP0_1_AWLOCK),
        .S_AXI_HP0_AWPROT(S_AXI_HP0_1_AWPROT),
        .S_AXI_HP0_AWQOS(S_AXI_HP0_1_AWQOS),
        .S_AXI_HP0_AWREADY(S_AXI_HP0_1_AWREADY),
        .S_AXI_HP0_AWSIZE(S_AXI_HP0_1_AWSIZE),
        .S_AXI_HP0_AWVALID(S_AXI_HP0_1_AWVALID),
        .S_AXI_HP0_BREADY(S_AXI_HP0_1_BREADY),
        .S_AXI_HP0_BRESP(S_AXI_HP0_1_BRESP),
        .S_AXI_HP0_BVALID(S_AXI_HP0_1_BVALID),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RREADY(1'b0),
        .S_AXI_HP0_WDATA(S_AXI_HP0_1_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(S_AXI_HP0_1_WLAST),
        .S_AXI_HP0_WREADY(S_AXI_HP0_1_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(S_AXI_HP0_1_WSTRB),
        .S_AXI_HP0_WVALID(S_AXI_HP0_1_WVALID),
        .S_AXI_HP1_ACLK(processing_system7_0_FCLK_CLK2),
        .S_AXI_HP1_ARADDR(S_AXI_HP1_1_ARADDR),
        .S_AXI_HP1_ARBURST(S_AXI_HP1_1_ARBURST),
        .S_AXI_HP1_ARCACHE(S_AXI_HP1_1_ARCACHE),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN(S_AXI_HP1_1_ARLEN),
        .S_AXI_HP1_ARLOCK(S_AXI_HP1_1_ARLOCK),
        .S_AXI_HP1_ARPROT(S_AXI_HP1_1_ARPROT),
        .S_AXI_HP1_ARQOS(S_AXI_HP1_1_ARQOS),
        .S_AXI_HP1_ARREADY(S_AXI_HP1_1_ARREADY),
        .S_AXI_HP1_ARSIZE(S_AXI_HP1_1_ARSIZE),
        .S_AXI_HP1_ARVALID(S_AXI_HP1_1_ARVALID),
        .S_AXI_HP1_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWBURST({1'b0,1'b1}),
        .S_AXI_HP1_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP1_AWVALID(1'b0),
        .S_AXI_HP1_BREADY(1'b0),
        .S_AXI_HP1_RDATA(S_AXI_HP1_1_RDATA),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RLAST(S_AXI_HP1_1_RLAST),
        .S_AXI_HP1_RREADY(S_AXI_HP1_1_RREADY),
        .S_AXI_HP1_RRESP(S_AXI_HP1_1_RRESP),
        .S_AXI_HP1_RVALID(S_AXI_HP1_1_RVALID),
        .S_AXI_HP1_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(1'b0),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP1_WVALID(1'b0),
        .S_AXI_HP2_ACLK(processing_system7_0_FCLK_CLK2),
        .S_AXI_HP2_ARADDR(Conn1_ARADDR),
        .S_AXI_HP2_ARBURST(Conn1_ARBURST),
        .S_AXI_HP2_ARCACHE(Conn1_ARCACHE),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLEN(Conn1_ARLEN),
        .S_AXI_HP2_ARLOCK(Conn1_ARLOCK),
        .S_AXI_HP2_ARPROT(Conn1_ARPROT),
        .S_AXI_HP2_ARQOS(Conn1_ARQOS),
        .S_AXI_HP2_ARREADY(Conn1_ARREADY),
        .S_AXI_HP2_ARSIZE(Conn1_ARSIZE),
        .S_AXI_HP2_ARVALID(Conn1_ARVALID),
        .S_AXI_HP2_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWBURST({1'b0,1'b1}),
        .S_AXI_HP2_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP2_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWVALID(1'b0),
        .S_AXI_HP2_BREADY(1'b0),
        .S_AXI_HP2_RDATA(Conn1_RDATA),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RLAST(Conn1_RLAST),
        .S_AXI_HP2_RREADY(Conn1_RREADY),
        .S_AXI_HP2_RRESP(Conn1_RRESP),
        .S_AXI_HP2_RVALID(Conn1_RVALID),
        .S_AXI_HP2_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WLAST(1'b0),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP2_WVALID(1'b0),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_ps7_0_axi_periph_0 ps7_0_axi_periph
       (.ACLK(processing_system7_0_FCLK_CLK0),
        .ARESETN(ARESETN_1),
        .M00_ACLK(processing_system7_0_FCLK_CLK0),
        .M00_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .M00_AXI_araddr(ps7_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps7_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps7_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps7_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps7_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps7_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps7_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps7_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps7_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps7_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps7_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps7_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps7_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps7_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps7_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(ps7_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(ps7_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(processing_system7_0_FCLK_CLK0),
        .M01_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .M01_AXI_araddr(ps7_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps7_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps7_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps7_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps7_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps7_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps7_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps7_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps7_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps7_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps7_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps7_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps7_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps7_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps7_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps7_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(processing_system7_0_FCLK_CLK0),
        .M02_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .M02_AXI_araddr(ps7_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(ps7_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(ps7_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(ps7_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(ps7_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(ps7_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(ps7_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(ps7_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(ps7_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(ps7_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(ps7_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(ps7_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(ps7_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(ps7_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(ps7_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wvalid(ps7_0_axi_periph_M02_AXI_WVALID),
        .M03_ACLK(clk_150_200_150_clk_out1),
        .M03_ARESETN(proc_sys_reset_150M_peripheral_aresetn),
        .M03_AXI_araddr(ps7_0_axi_periph_M03_AXI_ARADDR),
        .M03_AXI_arready(ps7_0_axi_periph_M03_AXI_ARREADY),
        .M03_AXI_arvalid(ps7_0_axi_periph_M03_AXI_ARVALID),
        .M03_AXI_awaddr(ps7_0_axi_periph_M03_AXI_AWADDR),
        .M03_AXI_awready(ps7_0_axi_periph_M03_AXI_AWREADY),
        .M03_AXI_awvalid(ps7_0_axi_periph_M03_AXI_AWVALID),
        .M03_AXI_bready(ps7_0_axi_periph_M03_AXI_BREADY),
        .M03_AXI_bresp(ps7_0_axi_periph_M03_AXI_BRESP),
        .M03_AXI_bvalid(ps7_0_axi_periph_M03_AXI_BVALID),
        .M03_AXI_rdata(ps7_0_axi_periph_M03_AXI_RDATA),
        .M03_AXI_rready(ps7_0_axi_periph_M03_AXI_RREADY),
        .M03_AXI_rresp(ps7_0_axi_periph_M03_AXI_RRESP),
        .M03_AXI_rvalid(ps7_0_axi_periph_M03_AXI_RVALID),
        .M03_AXI_wdata(ps7_0_axi_periph_M03_AXI_WDATA),
        .M03_AXI_wready(ps7_0_axi_periph_M03_AXI_WREADY),
        .M03_AXI_wstrb(ps7_0_axi_periph_M03_AXI_WSTRB),
        .M03_AXI_wvalid(ps7_0_axi_periph_M03_AXI_WVALID),
        .M04_ACLK(processing_system7_0_FCLK_CLK0),
        .M04_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .M04_AXI_araddr(Conn3_ARADDR),
        .M04_AXI_arready(Conn3_ARREADY),
        .M04_AXI_arvalid(Conn3_ARVALID),
        .M04_AXI_awaddr(Conn3_AWADDR),
        .M04_AXI_awready(Conn3_AWREADY),
        .M04_AXI_awvalid(Conn3_AWVALID),
        .M04_AXI_bready(Conn3_BREADY),
        .M04_AXI_bresp(Conn3_BRESP),
        .M04_AXI_bvalid(Conn3_BVALID),
        .M04_AXI_rdata(Conn3_RDATA),
        .M04_AXI_rready(Conn3_RREADY),
        .M04_AXI_rresp(Conn3_RRESP),
        .M04_AXI_rvalid(Conn3_RVALID),
        .M04_AXI_wdata(Conn3_WDATA),
        .M04_AXI_wready(Conn3_WREADY),
        .M04_AXI_wvalid(Conn3_WVALID),
        .M05_ACLK(processing_system7_0_FCLK_CLK0),
        .M05_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .M05_AXI_araddr(Conn4_ARADDR),
        .M05_AXI_arready(Conn4_ARREADY),
        .M05_AXI_arvalid(Conn4_ARVALID),
        .M05_AXI_awaddr(Conn4_AWADDR),
        .M05_AXI_awready(Conn4_AWREADY),
        .M05_AXI_awvalid(Conn4_AWVALID),
        .M05_AXI_bready(Conn4_BREADY),
        .M05_AXI_bresp(Conn4_BRESP),
        .M05_AXI_bvalid(Conn4_BVALID),
        .M05_AXI_rdata(Conn4_RDATA),
        .M05_AXI_rready(Conn4_RREADY),
        .M05_AXI_rresp(Conn4_RRESP),
        .M05_AXI_rvalid(Conn4_RVALID),
        .M05_AXI_wdata(Conn4_WDATA),
        .M05_AXI_wready(Conn4_WREADY),
        .M05_AXI_wvalid(Conn4_WVALID),
        .M06_ACLK(clk_150_200_150_clk_out1),
        .M06_ARESETN(proc_sys_reset_150M_peripheral_aresetn),
        .M06_AXI_araddr(Conn5_ARADDR),
        .M06_AXI_arready(Conn5_ARREADY),
        .M06_AXI_arvalid(Conn5_ARVALID),
        .M06_AXI_awaddr(Conn5_AWADDR),
        .M06_AXI_awready(Conn5_AWREADY),
        .M06_AXI_awvalid(Conn5_AWVALID),
        .M06_AXI_bready(Conn5_BREADY),
        .M06_AXI_bresp(Conn5_BRESP),
        .M06_AXI_bvalid(Conn5_BVALID),
        .M06_AXI_rdata(Conn5_RDATA),
        .M06_AXI_rready(Conn5_RREADY),
        .M06_AXI_rresp(Conn5_RRESP),
        .M06_AXI_rvalid(Conn5_RVALID),
        .M06_AXI_wdata(Conn5_WDATA),
        .M06_AXI_wready(Conn5_WREADY),
        .M06_AXI_wstrb(Conn5_WSTRB),
        .M06_AXI_wvalid(Conn5_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK0),
        .S00_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  system_rst_ps7_0_100M_0 rst_ps7_0_100M1
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK1));
  system_proc_sys_reset_0_2 rst_ps7_0_250M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_ps7_0_250M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps7_0_250M_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK2));
  system_rst_ps7_0_50M_0 rst_ps7_0_50M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(ARESETN_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps7_0_50M_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK0));
endmodule

module m00_couplers_imp_HIM33Y
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output M_AXI_araddr;
  output M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input S_AXI_araddr;
  input S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input S_AXI_awaddr;
  input S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output S_AXI_bresp;
  output S_AXI_bvalid;
  output S_AXI_rdata;
  input S_AXI_rready;
  output S_AXI_rresp;
  output S_AXI_rvalid;
  input S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wstrb;
  input S_AXI_wvalid;

  wire m00_couplers_to_m00_couplers_ARADDR;
  wire m00_couplers_to_m00_couplers_ARPROT;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire m00_couplers_to_m00_couplers_AWADDR;
  wire m00_couplers_to_m00_couplers_AWPROT;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arprot = m00_couplers_to_m00_couplers_ARPROT;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awprot = m00_couplers_to_m00_couplers_AWPROT;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr;
  assign m00_couplers_to_m00_couplers_ARPROT = S_AXI_arprot;
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr;
  assign m00_couplers_to_m00_couplers_AWPROT = S_AXI_awprot;
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp;
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata;
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp;
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata;
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb;
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_14B8CZ3
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_1F6ZLNH
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m03_couplers_imp_6CUUVG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [7:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [7:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [7:0]auto_cc_to_m03_couplers_ARADDR;
  wire auto_cc_to_m03_couplers_ARREADY;
  wire auto_cc_to_m03_couplers_ARVALID;
  wire [7:0]auto_cc_to_m03_couplers_AWADDR;
  wire auto_cc_to_m03_couplers_AWREADY;
  wire auto_cc_to_m03_couplers_AWVALID;
  wire auto_cc_to_m03_couplers_BREADY;
  wire [1:0]auto_cc_to_m03_couplers_BRESP;
  wire auto_cc_to_m03_couplers_BVALID;
  wire [31:0]auto_cc_to_m03_couplers_RDATA;
  wire auto_cc_to_m03_couplers_RREADY;
  wire [1:0]auto_cc_to_m03_couplers_RRESP;
  wire auto_cc_to_m03_couplers_RVALID;
  wire [31:0]auto_cc_to_m03_couplers_WDATA;
  wire auto_cc_to_m03_couplers_WREADY;
  wire [3:0]auto_cc_to_m03_couplers_WSTRB;
  wire auto_cc_to_m03_couplers_WVALID;
  wire [31:0]m03_couplers_to_auto_cc_ARADDR;
  wire [2:0]m03_couplers_to_auto_cc_ARPROT;
  wire m03_couplers_to_auto_cc_ARREADY;
  wire m03_couplers_to_auto_cc_ARVALID;
  wire [31:0]m03_couplers_to_auto_cc_AWADDR;
  wire [2:0]m03_couplers_to_auto_cc_AWPROT;
  wire m03_couplers_to_auto_cc_AWREADY;
  wire m03_couplers_to_auto_cc_AWVALID;
  wire m03_couplers_to_auto_cc_BREADY;
  wire [1:0]m03_couplers_to_auto_cc_BRESP;
  wire m03_couplers_to_auto_cc_BVALID;
  wire [31:0]m03_couplers_to_auto_cc_RDATA;
  wire m03_couplers_to_auto_cc_RREADY;
  wire [1:0]m03_couplers_to_auto_cc_RRESP;
  wire m03_couplers_to_auto_cc_RVALID;
  wire [31:0]m03_couplers_to_auto_cc_WDATA;
  wire m03_couplers_to_auto_cc_WREADY;
  wire [3:0]m03_couplers_to_auto_cc_WSTRB;
  wire m03_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[7:0] = auto_cc_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid = auto_cc_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[7:0] = auto_cc_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid = auto_cc_to_m03_couplers_AWVALID;
  assign M_AXI_bready = auto_cc_to_m03_couplers_BREADY;
  assign M_AXI_rready = auto_cc_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_cc_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_cc_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = auto_cc_to_m03_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m03_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m03_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_auto_cc_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m03_couplers_to_auto_cc_WREADY;
  assign auto_cc_to_m03_couplers_ARREADY = M_AXI_arready;
  assign auto_cc_to_m03_couplers_AWREADY = M_AXI_awready;
  assign auto_cc_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_cc_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign auto_cc_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_cc_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_cc_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign auto_cc_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m03_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m03_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m03_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m03_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  system_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_m03_couplers_ARADDR),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arready(auto_cc_to_m03_couplers_ARREADY),
        .m_axi_arvalid(auto_cc_to_m03_couplers_ARVALID),
        .m_axi_awaddr(auto_cc_to_m03_couplers_AWADDR),
        .m_axi_awready(auto_cc_to_m03_couplers_AWREADY),
        .m_axi_awvalid(auto_cc_to_m03_couplers_AWVALID),
        .m_axi_bready(auto_cc_to_m03_couplers_BREADY),
        .m_axi_bresp(auto_cc_to_m03_couplers_BRESP),
        .m_axi_bvalid(auto_cc_to_m03_couplers_BVALID),
        .m_axi_rdata(auto_cc_to_m03_couplers_RDATA),
        .m_axi_rready(auto_cc_to_m03_couplers_RREADY),
        .m_axi_rresp(auto_cc_to_m03_couplers_RRESP),
        .m_axi_rvalid(auto_cc_to_m03_couplers_RVALID),
        .m_axi_wdata(auto_cc_to_m03_couplers_WDATA),
        .m_axi_wready(auto_cc_to_m03_couplers_WREADY),
        .m_axi_wstrb(auto_cc_to_m03_couplers_WSTRB),
        .m_axi_wvalid(auto_cc_to_m03_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m03_couplers_to_auto_cc_ARADDR[7:0]),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arprot(m03_couplers_to_auto_cc_ARPROT),
        .s_axi_arready(m03_couplers_to_auto_cc_ARREADY),
        .s_axi_arvalid(m03_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m03_couplers_to_auto_cc_AWADDR[7:0]),
        .s_axi_awprot(m03_couplers_to_auto_cc_AWPROT),
        .s_axi_awready(m03_couplers_to_auto_cc_AWREADY),
        .s_axi_awvalid(m03_couplers_to_auto_cc_AWVALID),
        .s_axi_bready(m03_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m03_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(m03_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m03_couplers_to_auto_cc_RDATA),
        .s_axi_rready(m03_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m03_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(m03_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m03_couplers_to_auto_cc_WDATA),
        .s_axi_wready(m03_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m03_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(m03_couplers_to_auto_cc_WVALID));
endmodule

module m04_couplers_imp_1T7ZYD5
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output M_AXI_araddr;
  output M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input S_AXI_araddr;
  input S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input S_AXI_awaddr;
  input S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output S_AXI_bresp;
  output S_AXI_bvalid;
  output S_AXI_rdata;
  input S_AXI_rready;
  output S_AXI_rresp;
  output S_AXI_rvalid;
  input S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wstrb;
  input S_AXI_wvalid;

  wire m04_couplers_to_m04_couplers_ARADDR;
  wire m04_couplers_to_m04_couplers_ARPROT;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire m04_couplers_to_m04_couplers_AWADDR;
  wire m04_couplers_to_m04_couplers_AWPROT;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arprot = m04_couplers_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awprot = m04_couplers_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr;
  assign m04_couplers_to_m04_couplers_ARPROT = S_AXI_arprot;
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr;
  assign m04_couplers_to_m04_couplers_AWPROT = S_AXI_awprot;
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp;
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata;
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp;
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata;
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb;
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module m05_couplers_imp_J9WTGO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire m05_couplers_to_m05_couplers_ARREADY;
  wire m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire m05_couplers_to_m05_couplers_AWREADY;
  wire m05_couplers_to_m05_couplers_AWVALID;
  wire m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire m05_couplers_to_m05_couplers_WREADY;
  wire m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wvalid = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid;
endmodule

module m06_couplers_imp_U5O3X6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output M_AXI_araddr;
  output M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input S_AXI_araddr;
  input S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input S_AXI_awaddr;
  input S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output S_AXI_bresp;
  output S_AXI_bvalid;
  output S_AXI_rdata;
  input S_AXI_rready;
  output S_AXI_rresp;
  output S_AXI_rvalid;
  input S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wstrb;
  input S_AXI_wvalid;

  wire m06_couplers_to_m06_couplers_ARADDR;
  wire m06_couplers_to_m06_couplers_ARPROT;
  wire m06_couplers_to_m06_couplers_ARREADY;
  wire m06_couplers_to_m06_couplers_ARVALID;
  wire m06_couplers_to_m06_couplers_AWADDR;
  wire m06_couplers_to_m06_couplers_AWPROT;
  wire m06_couplers_to_m06_couplers_AWREADY;
  wire m06_couplers_to_m06_couplers_AWVALID;
  wire m06_couplers_to_m06_couplers_BREADY;
  wire m06_couplers_to_m06_couplers_BRESP;
  wire m06_couplers_to_m06_couplers_BVALID;
  wire m06_couplers_to_m06_couplers_RDATA;
  wire m06_couplers_to_m06_couplers_RREADY;
  wire m06_couplers_to_m06_couplers_RRESP;
  wire m06_couplers_to_m06_couplers_RVALID;
  wire m06_couplers_to_m06_couplers_WDATA;
  wire m06_couplers_to_m06_couplers_WREADY;
  wire m06_couplers_to_m06_couplers_WSTRB;
  wire m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arprot = m06_couplers_to_m06_couplers_ARPROT;
  assign M_AXI_arvalid = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awprot = m06_couplers_to_m06_couplers_AWPROT;
  assign M_AXI_awvalid = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wstrb = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr;
  assign m06_couplers_to_m06_couplers_ARPROT = S_AXI_arprot;
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready;
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid;
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr;
  assign m06_couplers_to_m06_couplers_AWPROT = S_AXI_awprot;
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready;
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid;
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready;
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp;
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid;
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata;
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready;
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp;
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid;
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata;
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready;
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb;
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid;
endmodule

module pix_clk_imp_SQ3M8U
   (clk_in1,
    ext_reset_in,
    per_pix_aresetn150,
    pix_clk150);
  input clk_in1;
  input ext_reset_in;
  output [0:0]per_pix_aresetn150;
  output pix_clk150;

  wire clk_150_200_150_clk_out1;
  wire clk_150_200_150_clk_out2;
  wire clk_150_200_150_clk_out3;
  wire [0:0]proc_sys_reset_150M_peripheral_aresetn;
  wire processing_system7_0_FCLK_CLK1;
  wire processing_system7_0_FCLK_RESET0_N;

  assign per_pix_aresetn150[0] = proc_sys_reset_150M_peripheral_aresetn;
  assign pix_clk150 = clk_150_200_150_clk_out1;
  assign processing_system7_0_FCLK_CLK1 = clk_in1;
  assign processing_system7_0_FCLK_RESET0_N = ext_reset_in;
  system_clk_wiz_0_0 clk_150_200_150
       (.clk_in1(processing_system7_0_FCLK_CLK1),
        .clk_out1(clk_150_200_150_clk_out1),
        .clk_out2(clk_150_200_150_clk_out2),
        .clk_out3(clk_150_200_150_clk_out3));
  pix_clk_reset_imp_88JCKD pix_clk_reset
       (.ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .per_pix_aresetn150(proc_sys_reset_150M_peripheral_aresetn),
        .pix_clk150(clk_150_200_150_clk_out1),
        .slowest_sync_clk(clk_150_200_150_clk_out2),
        .slowest_sync_clk1(clk_150_200_150_clk_out3));
endmodule

module pix_clk_reset_imp_88JCKD
   (ext_reset_in,
    per_pix_aresetn150,
    pix_clk150,
    slowest_sync_clk,
    slowest_sync_clk1);
  input ext_reset_in;
  output [0:0]per_pix_aresetn150;
  input pix_clk150;
  input slowest_sync_clk;
  input slowest_sync_clk1;

  wire clk_150_200_150_clk_out1;
  wire clk_150_200_150_clk_out2;
  wire clk_150_200_150_clk_out3;
  wire [0:0]proc_sys_reset_150M_peripheral_aresetn;
  wire processing_system7_0_FCLK_RESET0_N;

  assign clk_150_200_150_clk_out1 = pix_clk150;
  assign clk_150_200_150_clk_out2 = slowest_sync_clk;
  assign clk_150_200_150_clk_out3 = slowest_sync_clk1;
  assign per_pix_aresetn150[0] = proc_sys_reset_150M_peripheral_aresetn;
  assign processing_system7_0_FCLK_RESET0_N = ext_reset_in;
  system_proc_sys_reset_0_0 proc_sys_reset_150M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_150M_peripheral_aresetn),
        .slowest_sync_clk(clk_150_200_150_clk_out1));
  system_proc_sys_reset_0_1 proc_sys_reset_200M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_150_200_150_clk_out2));
  system_proc_sys_reset_1_0 proc_sys_reset_250M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_150_200_150_clk_out3));
endmodule

module s00_couplers_imp_2ERGDR
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_2 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_H3F9MB
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [63:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [1:0]auto_pc_to_s00_couplers_ARBURST;
  wire [3:0]auto_pc_to_s00_couplers_ARCACHE;
  wire [3:0]auto_pc_to_s00_couplers_ARLEN;
  wire [1:0]auto_pc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire [3:0]auto_pc_to_s00_couplers_ARQOS;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire [2:0]auto_pc_to_s00_couplers_ARSIZE;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [63:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RLAST;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [7:0]s00_couplers_to_auto_pc_ARLEN;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [63:0]s00_couplers_to_auto_pc_RDATA;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = auto_pc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_rdata[63:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  system_auto_pc_3 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s00_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID));
endmodule

module s00_couplers_imp_U5IPAH
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [63:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [1:0]auto_pc_to_s00_couplers_ARBURST;
  wire [3:0]auto_pc_to_s00_couplers_ARCACHE;
  wire [3:0]auto_pc_to_s00_couplers_ARLEN;
  wire [1:0]auto_pc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire [3:0]auto_pc_to_s00_couplers_ARQOS;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire [2:0]auto_pc_to_s00_couplers_ARSIZE;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [63:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RLAST;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [7:0]s00_couplers_to_auto_pc_ARLEN;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [63:0]s00_couplers_to_auto_pc_RDATA;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = auto_pc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_rdata[63:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  system_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s00_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID));
endmodule

module s00_couplers_imp_YI60WO
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [1:0]auto_pc_to_s00_couplers_AWBURST;
  wire [3:0]auto_pc_to_s00_couplers_AWCACHE;
  wire [3:0]auto_pc_to_s00_couplers_AWLEN;
  wire [1:0]auto_pc_to_s00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire [3:0]auto_pc_to_s00_couplers_AWQOS;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire [2:0]auto_pc_to_s00_couplers_AWSIZE;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [63:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WLAST;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [7:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [7:0]s00_couplers_to_auto_pc_AWLEN;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [63:0]s00_couplers_to_auto_pc_WDATA;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [7:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s00_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = auto_pc_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_wdata[63:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[63:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[7:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s00_couplers_AWCACHE),
        .m_axi_awlen(auto_pc_to_s00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(1'b0),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=63,numReposBlks=39,numNonXlnxBlks=2,numHierBlks=24,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=1,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    TMDS_User_clk_n,
    TMDS_User_clk_p,
    TMDS_User_data_n,
    TMDS_User_data_p,
    TMDS_clk_n,
    TMDS_clk_p,
    TMDS_data_n,
    TMDS_data_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS_User " *) output TMDS_User_clk_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS_User " *) output TMDS_User_clk_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS_User " *) output [2:0]TMDS_User_data_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS_User " *) output [2:0]TMDS_User_data_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_N" *) output TMDS_clk_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_P" *) output TMDS_clk_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_N" *) output [2:0]TMDS_data_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_P" *) output [2:0]TMDS_data_p;

  wire [0:0]ARESETN_1;
  wire HDMI_OUT1_TMDS_CLK_N;
  wire HDMI_OUT1_TMDS_CLK_P;
  wire [2:0]HDMI_OUT1_TMDS_DATA_N;
  wire [2:0]HDMI_OUT1_TMDS_DATA_P;
  wire HDMI_OUT_TMDS_0_CLK_N;
  wire HDMI_OUT_TMDS_0_CLK_P;
  wire [2:0]HDMI_OUT_TMDS_0_DATA_N;
  wire [2:0]HDMI_OUT_TMDS_0_DATA_P;
  wire [0:0]M00_ARESETN_1;
  wire [31:0]S_AXIS_1_TDATA;
  wire [3:0]S_AXIS_1_TKEEP;
  wire S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire [0:0]S_AXIS_1_TUSER;
  wire S_AXIS_1_TVALID;
  wire [31:0]S_AXIS_2_TDATA;
  wire [3:0]S_AXIS_2_TKEEP;
  wire S_AXIS_2_TLAST;
  wire S_AXIS_2_TREADY;
  wire [0:0]S_AXIS_2_TUSER;
  wire S_AXIS_2_TVALID;
  wire [31:0]S_AXIS_S2MM_1_TDATA;
  wire [3:0]S_AXIS_S2MM_1_TKEEP;
  wire S_AXIS_S2MM_1_TLAST;
  wire S_AXIS_S2MM_1_TREADY;
  wire [0:0]S_AXIS_S2MM_1_TUSER;
  wire S_AXIS_S2MM_1_TVALID;
  wire [31:0]S_AXI_HP2_1_ARADDR;
  wire [1:0]S_AXI_HP2_1_ARBURST;
  wire [3:0]S_AXI_HP2_1_ARCACHE;
  wire [3:0]S_AXI_HP2_1_ARLEN;
  wire [1:0]S_AXI_HP2_1_ARLOCK;
  wire [2:0]S_AXI_HP2_1_ARPROT;
  wire [3:0]S_AXI_HP2_1_ARQOS;
  wire S_AXI_HP2_1_ARREADY;
  wire [2:0]S_AXI_HP2_1_ARSIZE;
  wire S_AXI_HP2_1_ARVALID;
  wire [63:0]S_AXI_HP2_1_RDATA;
  wire S_AXI_HP2_1_RLAST;
  wire S_AXI_HP2_1_RREADY;
  wire [1:0]S_AXI_HP2_1_RRESP;
  wire S_AXI_HP2_1_RVALID;
  wire [31:0]S_AXI_LITE_1_ARADDR;
  wire [0:0]S_AXI_LITE_1_ARREADY;
  wire [0:0]S_AXI_LITE_1_ARVALID;
  wire [31:0]S_AXI_LITE_1_AWADDR;
  wire [0:0]S_AXI_LITE_1_AWREADY;
  wire [0:0]S_AXI_LITE_1_AWVALID;
  wire [0:0]S_AXI_LITE_1_BREADY;
  wire [1:0]S_AXI_LITE_1_BRESP;
  wire [0:0]S_AXI_LITE_1_BVALID;
  wire [31:0]S_AXI_LITE_1_RDATA;
  wire [0:0]S_AXI_LITE_1_RREADY;
  wire [1:0]S_AXI_LITE_1_RRESP;
  wire [0:0]S_AXI_LITE_1_RVALID;
  wire [31:0]S_AXI_LITE_1_WDATA;
  wire [0:0]S_AXI_LITE_1_WREADY;
  wire [0:0]S_AXI_LITE_1_WVALID;
  wire [31:0]S_AXI_LITE_3_ARADDR;
  wire S_AXI_LITE_3_ARREADY;
  wire S_AXI_LITE_3_ARVALID;
  wire [31:0]S_AXI_LITE_3_AWADDR;
  wire S_AXI_LITE_3_AWREADY;
  wire S_AXI_LITE_3_AWVALID;
  wire S_AXI_LITE_3_BREADY;
  wire [1:0]S_AXI_LITE_3_BRESP;
  wire S_AXI_LITE_3_BVALID;
  wire [31:0]S_AXI_LITE_3_RDATA;
  wire S_AXI_LITE_3_RREADY;
  wire [1:0]S_AXI_LITE_3_RRESP;
  wire S_AXI_LITE_3_RVALID;
  wire [31:0]S_AXI_LITE_3_WDATA;
  wire S_AXI_LITE_3_WREADY;
  wire S_AXI_LITE_3_WVALID;
  wire Zynq_system_FCLK_CLK2;
  wire [31:0]Zynq_system_M02_AXI_ARADDR;
  wire [0:0]Zynq_system_M02_AXI_ARREADY;
  wire [0:0]Zynq_system_M02_AXI_ARVALID;
  wire [31:0]Zynq_system_M02_AXI_AWADDR;
  wire [0:0]Zynq_system_M02_AXI_AWREADY;
  wire [0:0]Zynq_system_M02_AXI_AWVALID;
  wire [0:0]Zynq_system_M02_AXI_BREADY;
  wire [1:0]Zynq_system_M02_AXI_BRESP;
  wire [0:0]Zynq_system_M02_AXI_BVALID;
  wire [31:0]Zynq_system_M02_AXI_RDATA;
  wire [0:0]Zynq_system_M02_AXI_RREADY;
  wire [1:0]Zynq_system_M02_AXI_RRESP;
  wire [0:0]Zynq_system_M02_AXI_RVALID;
  wire [31:0]Zynq_system_M02_AXI_WDATA;
  wire [0:0]Zynq_system_M02_AXI_WREADY;
  wire [0:0]Zynq_system_M02_AXI_WVALID;
  wire [7:0]Zynq_system_M03_AXI_ARADDR;
  wire Zynq_system_M03_AXI_ARREADY;
  wire Zynq_system_M03_AXI_ARVALID;
  wire [7:0]Zynq_system_M03_AXI_AWADDR;
  wire Zynq_system_M03_AXI_AWREADY;
  wire Zynq_system_M03_AXI_AWVALID;
  wire Zynq_system_M03_AXI_BREADY;
  wire [1:0]Zynq_system_M03_AXI_BRESP;
  wire Zynq_system_M03_AXI_BVALID;
  wire [31:0]Zynq_system_M03_AXI_RDATA;
  wire Zynq_system_M03_AXI_RREADY;
  wire [1:0]Zynq_system_M03_AXI_RRESP;
  wire Zynq_system_M03_AXI_RVALID;
  wire [31:0]Zynq_system_M03_AXI_WDATA;
  wire Zynq_system_M03_AXI_WREADY;
  wire [3:0]Zynq_system_M03_AXI_WSTRB;
  wire Zynq_system_M03_AXI_WVALID;
  wire [0:0]Zynq_system_peripheral_aresetn;
  wire [5:0]mm2s_frame_ptr_in_1;
  wire pix_clk;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [0:0]rst_ps7_0_50M_peripheral_aresetn;
  wire [31:0]vdma_in_s2mm_M00_AXI_AWADDR;
  wire [1:0]vdma_in_s2mm_M00_AXI_AWBURST;
  wire [3:0]vdma_in_s2mm_M00_AXI_AWCACHE;
  wire [3:0]vdma_in_s2mm_M00_AXI_AWLEN;
  wire [1:0]vdma_in_s2mm_M00_AXI_AWLOCK;
  wire [2:0]vdma_in_s2mm_M00_AXI_AWPROT;
  wire [3:0]vdma_in_s2mm_M00_AXI_AWQOS;
  wire vdma_in_s2mm_M00_AXI_AWREADY;
  wire [2:0]vdma_in_s2mm_M00_AXI_AWSIZE;
  wire vdma_in_s2mm_M00_AXI_AWVALID;
  wire vdma_in_s2mm_M00_AXI_BREADY;
  wire [1:0]vdma_in_s2mm_M00_AXI_BRESP;
  wire vdma_in_s2mm_M00_AXI_BVALID;
  wire [63:0]vdma_in_s2mm_M00_AXI_WDATA;
  wire vdma_in_s2mm_M00_AXI_WLAST;
  wire vdma_in_s2mm_M00_AXI_WREADY;
  wire [7:0]vdma_in_s2mm_M00_AXI_WSTRB;
  wire vdma_in_s2mm_M00_AXI_WVALID;
  wire vdma_in_s2mm_s2mm_introut;
  wire [31:0]vdma_out_mm2s_M00_AXI_ARADDR;
  wire [1:0]vdma_out_mm2s_M00_AXI_ARBURST;
  wire [3:0]vdma_out_mm2s_M00_AXI_ARCACHE;
  wire [3:0]vdma_out_mm2s_M00_AXI_ARLEN;
  wire [1:0]vdma_out_mm2s_M00_AXI_ARLOCK;
  wire [2:0]vdma_out_mm2s_M00_AXI_ARPROT;
  wire [3:0]vdma_out_mm2s_M00_AXI_ARQOS;
  wire vdma_out_mm2s_M00_AXI_ARREADY;
  wire [2:0]vdma_out_mm2s_M00_AXI_ARSIZE;
  wire vdma_out_mm2s_M00_AXI_ARVALID;
  wire [63:0]vdma_out_mm2s_M00_AXI_RDATA;
  wire vdma_out_mm2s_M00_AXI_RLAST;
  wire vdma_out_mm2s_M00_AXI_RREADY;
  wire [1:0]vdma_out_mm2s_M00_AXI_RRESP;
  wire vdma_out_mm2s_M00_AXI_RVALID;

  assign TMDS_User_clk_n = HDMI_OUT1_TMDS_CLK_N;
  assign TMDS_User_clk_p = HDMI_OUT1_TMDS_CLK_P;
  assign TMDS_User_data_n[2:0] = HDMI_OUT1_TMDS_DATA_N;
  assign TMDS_User_data_p[2:0] = HDMI_OUT1_TMDS_DATA_P;
  assign TMDS_clk_n = HDMI_OUT_TMDS_0_CLK_N;
  assign TMDS_clk_p = HDMI_OUT_TMDS_0_CLK_P;
  assign TMDS_data_n[2:0] = HDMI_OUT_TMDS_0_DATA_N;
  assign TMDS_data_p[2:0] = HDMI_OUT_TMDS_0_DATA_P;
  HDMI_OUT_imp_1Y13FX3 HDMI_OUT
       (.S_AXIS_tdata(S_AXIS_1_TDATA),
        .S_AXIS_tkeep(S_AXIS_1_TKEEP),
        .S_AXIS_tlast(S_AXIS_1_TLAST),
        .S_AXIS_tready(S_AXIS_1_TREADY),
        .S_AXIS_tuser(S_AXIS_1_TUSER),
        .S_AXIS_tvalid(S_AXIS_1_TVALID),
        .TMDS_clk_n(HDMI_OUT_TMDS_0_CLK_N),
        .TMDS_clk_p(HDMI_OUT_TMDS_0_CLK_P),
        .TMDS_data_n(HDMI_OUT_TMDS_0_DATA_N),
        .TMDS_data_p(HDMI_OUT_TMDS_0_DATA_P),
        .pix_aresetn(Zynq_system_peripheral_aresetn),
        .pix_clk(pix_clk));
  HDMI_OUT1_imp_RXEMK2 HDMI_OUT1
       (.S_AXIS_tdata(S_AXIS_2_TDATA),
        .S_AXIS_tkeep(S_AXIS_2_TKEEP),
        .S_AXIS_tlast(S_AXIS_2_TLAST),
        .S_AXIS_tready(S_AXIS_2_TREADY),
        .S_AXIS_tuser(S_AXIS_2_TUSER),
        .S_AXIS_tvalid(S_AXIS_2_TVALID),
        .TMDS_clk_n(HDMI_OUT1_TMDS_CLK_N),
        .TMDS_clk_p(HDMI_OUT1_TMDS_CLK_P),
        .TMDS_data_n(HDMI_OUT1_TMDS_DATA_N),
        .TMDS_data_p(HDMI_OUT1_TMDS_DATA_P),
        .pix_aresetn(Zynq_system_peripheral_aresetn),
        .pix_clk(pix_clk));
  TPG_imp_1PPIREW TPG
       (.AXIS_TPG_tdata(S_AXIS_S2MM_1_TDATA),
        .AXIS_TPG_tkeep(S_AXIS_S2MM_1_TKEEP),
        .AXIS_TPG_tlast(S_AXIS_S2MM_1_TLAST),
        .AXIS_TPG_tready(S_AXIS_S2MM_1_TREADY),
        .AXIS_TPG_tuser(S_AXIS_S2MM_1_TUSER),
        .AXIS_TPG_tvalid(S_AXIS_S2MM_1_TVALID),
        .pix_clk(pix_clk),
        .pix_rst_n(Zynq_system_peripheral_aresetn),
        .s_axi_CTRL_araddr(Zynq_system_M03_AXI_ARADDR),
        .s_axi_CTRL_arready(Zynq_system_M03_AXI_ARREADY),
        .s_axi_CTRL_arvalid(Zynq_system_M03_AXI_ARVALID),
        .s_axi_CTRL_awaddr(Zynq_system_M03_AXI_AWADDR),
        .s_axi_CTRL_awready(Zynq_system_M03_AXI_AWREADY),
        .s_axi_CTRL_awvalid(Zynq_system_M03_AXI_AWVALID),
        .s_axi_CTRL_bready(Zynq_system_M03_AXI_BREADY),
        .s_axi_CTRL_bresp(Zynq_system_M03_AXI_BRESP),
        .s_axi_CTRL_bvalid(Zynq_system_M03_AXI_BVALID),
        .s_axi_CTRL_rdata(Zynq_system_M03_AXI_RDATA),
        .s_axi_CTRL_rready(Zynq_system_M03_AXI_RREADY),
        .s_axi_CTRL_rresp(Zynq_system_M03_AXI_RRESP),
        .s_axi_CTRL_rvalid(Zynq_system_M03_AXI_RVALID),
        .s_axi_CTRL_wdata(Zynq_system_M03_AXI_WDATA),
        .s_axi_CTRL_wready(Zynq_system_M03_AXI_WREADY),
        .s_axi_CTRL_wstrb(Zynq_system_M03_AXI_WSTRB),
        .s_axi_CTRL_wvalid(Zynq_system_M03_AXI_WVALID));
  Zynq_system_imp_CEU7LT Zynq_system
       (.DDR_addr(DDR_addr[14:0]),
        .DDR_ba(DDR_ba[2:0]),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm[3:0]),
        .DDR_dq(DDR_dq[31:0]),
        .DDR_dqs_n(DDR_dqs_n[3:0]),
        .DDR_dqs_p(DDR_dqs_p[3:0]),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio[53:0]),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .HP_Interconnect_ACLK(Zynq_system_FCLK_CLK2),
        .HP_interconnect_aresetn(ARESETN_1),
        .HP_peripheral_aresetn(M00_ARESETN_1),
        .M00_AXI_arready(1'b0),
        .M00_AXI_awready(1'b0),
        .M00_AXI_bresp({1'b0,1'b0}),
        .M00_AXI_bvalid(1'b0),
        .M00_AXI_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M00_AXI_rresp({1'b0,1'b0}),
        .M00_AXI_rvalid(1'b0),
        .M00_AXI_wready(1'b0),
        .M01_AXI_araddr(S_AXI_LITE_1_ARADDR),
        .M01_AXI_arready(S_AXI_LITE_1_ARREADY),
        .M01_AXI_arvalid(S_AXI_LITE_1_ARVALID),
        .M01_AXI_awaddr(S_AXI_LITE_1_AWADDR),
        .M01_AXI_awready(S_AXI_LITE_1_AWREADY),
        .M01_AXI_awvalid(S_AXI_LITE_1_AWVALID),
        .M01_AXI_bready(S_AXI_LITE_1_BREADY),
        .M01_AXI_bresp(S_AXI_LITE_1_BRESP),
        .M01_AXI_bvalid(S_AXI_LITE_1_BVALID),
        .M01_AXI_rdata(S_AXI_LITE_1_RDATA),
        .M01_AXI_rready(S_AXI_LITE_1_RREADY),
        .M01_AXI_rresp(S_AXI_LITE_1_RRESP),
        .M01_AXI_rvalid(S_AXI_LITE_1_RVALID),
        .M01_AXI_wdata(S_AXI_LITE_1_WDATA),
        .M01_AXI_wready(S_AXI_LITE_1_WREADY),
        .M01_AXI_wvalid(S_AXI_LITE_1_WVALID),
        .M02_AXI_araddr(Zynq_system_M02_AXI_ARADDR),
        .M02_AXI_arready(Zynq_system_M02_AXI_ARREADY),
        .M02_AXI_arvalid(Zynq_system_M02_AXI_ARVALID),
        .M02_AXI_awaddr(Zynq_system_M02_AXI_AWADDR),
        .M02_AXI_awready(Zynq_system_M02_AXI_AWREADY),
        .M02_AXI_awvalid(Zynq_system_M02_AXI_AWVALID),
        .M02_AXI_bready(Zynq_system_M02_AXI_BREADY),
        .M02_AXI_bresp(Zynq_system_M02_AXI_BRESP),
        .M02_AXI_bvalid(Zynq_system_M02_AXI_BVALID),
        .M02_AXI_rdata(Zynq_system_M02_AXI_RDATA),
        .M02_AXI_rready(Zynq_system_M02_AXI_RREADY),
        .M02_AXI_rresp(Zynq_system_M02_AXI_RRESP),
        .M02_AXI_rvalid(Zynq_system_M02_AXI_RVALID),
        .M02_AXI_wdata(Zynq_system_M02_AXI_WDATA),
        .M02_AXI_wready(Zynq_system_M02_AXI_WREADY),
        .M02_AXI_wvalid(Zynq_system_M02_AXI_WVALID),
        .M03_AXI_araddr(Zynq_system_M03_AXI_ARADDR),
        .M03_AXI_arready(Zynq_system_M03_AXI_ARREADY),
        .M03_AXI_arvalid(Zynq_system_M03_AXI_ARVALID),
        .M03_AXI_awaddr(Zynq_system_M03_AXI_AWADDR),
        .M03_AXI_awready(Zynq_system_M03_AXI_AWREADY),
        .M03_AXI_awvalid(Zynq_system_M03_AXI_AWVALID),
        .M03_AXI_bready(Zynq_system_M03_AXI_BREADY),
        .M03_AXI_bresp(Zynq_system_M03_AXI_BRESP),
        .M03_AXI_bvalid(Zynq_system_M03_AXI_BVALID),
        .M03_AXI_rdata(Zynq_system_M03_AXI_RDATA),
        .M03_AXI_rready(Zynq_system_M03_AXI_RREADY),
        .M03_AXI_rresp(Zynq_system_M03_AXI_RRESP),
        .M03_AXI_rvalid(Zynq_system_M03_AXI_RVALID),
        .M03_AXI_wdata(Zynq_system_M03_AXI_WDATA),
        .M03_AXI_wready(Zynq_system_M03_AXI_WREADY),
        .M03_AXI_wstrb(Zynq_system_M03_AXI_WSTRB),
        .M03_AXI_wvalid(Zynq_system_M03_AXI_WVALID),
        .M04_AXI_arready(1'b0),
        .M04_AXI_awready(1'b0),
        .M04_AXI_bresp({1'b0,1'b0}),
        .M04_AXI_bvalid(1'b0),
        .M04_AXI_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M04_AXI_rresp({1'b0,1'b0}),
        .M04_AXI_rvalid(1'b0),
        .M04_AXI_wready(1'b0),
        .M05_AXI_araddr(S_AXI_LITE_3_ARADDR),
        .M05_AXI_arready(S_AXI_LITE_3_ARREADY),
        .M05_AXI_arvalid(S_AXI_LITE_3_ARVALID),
        .M05_AXI_awaddr(S_AXI_LITE_3_AWADDR),
        .M05_AXI_awready(S_AXI_LITE_3_AWREADY),
        .M05_AXI_awvalid(S_AXI_LITE_3_AWVALID),
        .M05_AXI_bready(S_AXI_LITE_3_BREADY),
        .M05_AXI_bresp(S_AXI_LITE_3_BRESP),
        .M05_AXI_bvalid(S_AXI_LITE_3_BVALID),
        .M05_AXI_rdata(S_AXI_LITE_3_RDATA),
        .M05_AXI_rready(S_AXI_LITE_3_RREADY),
        .M05_AXI_rresp(S_AXI_LITE_3_RRESP),
        .M05_AXI_rvalid(S_AXI_LITE_3_RVALID),
        .M05_AXI_wdata(S_AXI_LITE_3_WDATA),
        .M05_AXI_wready(S_AXI_LITE_3_WREADY),
        .M05_AXI_wvalid(S_AXI_LITE_3_WVALID),
        .M06_AXI_arready(1'b0),
        .M06_AXI_awready(1'b0),
        .M06_AXI_bresp({1'b0,1'b0}),
        .M06_AXI_bvalid(1'b0),
        .M06_AXI_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M06_AXI_rresp({1'b0,1'b0}),
        .M06_AXI_rvalid(1'b0),
        .M06_AXI_wready(1'b0),
        .S_AXI_HP0_awaddr(vdma_in_s2mm_M00_AXI_AWADDR),
        .S_AXI_HP0_awburst(vdma_in_s2mm_M00_AXI_AWBURST),
        .S_AXI_HP0_awcache(vdma_in_s2mm_M00_AXI_AWCACHE),
        .S_AXI_HP0_awlen(vdma_in_s2mm_M00_AXI_AWLEN),
        .S_AXI_HP0_awlock(vdma_in_s2mm_M00_AXI_AWLOCK),
        .S_AXI_HP0_awprot(vdma_in_s2mm_M00_AXI_AWPROT),
        .S_AXI_HP0_awqos(vdma_in_s2mm_M00_AXI_AWQOS),
        .S_AXI_HP0_awready(vdma_in_s2mm_M00_AXI_AWREADY),
        .S_AXI_HP0_awsize(vdma_in_s2mm_M00_AXI_AWSIZE),
        .S_AXI_HP0_awvalid(vdma_in_s2mm_M00_AXI_AWVALID),
        .S_AXI_HP0_bready(vdma_in_s2mm_M00_AXI_BREADY),
        .S_AXI_HP0_bresp(vdma_in_s2mm_M00_AXI_BRESP),
        .S_AXI_HP0_bvalid(vdma_in_s2mm_M00_AXI_BVALID),
        .S_AXI_HP0_wdata(vdma_in_s2mm_M00_AXI_WDATA),
        .S_AXI_HP0_wlast(vdma_in_s2mm_M00_AXI_WLAST),
        .S_AXI_HP0_wready(vdma_in_s2mm_M00_AXI_WREADY),
        .S_AXI_HP0_wstrb(vdma_in_s2mm_M00_AXI_WSTRB),
        .S_AXI_HP0_wvalid(vdma_in_s2mm_M00_AXI_WVALID),
        .S_AXI_HP1_araddr(vdma_out_mm2s_M00_AXI_ARADDR),
        .S_AXI_HP1_arburst(vdma_out_mm2s_M00_AXI_ARBURST),
        .S_AXI_HP1_arcache(vdma_out_mm2s_M00_AXI_ARCACHE),
        .S_AXI_HP1_arlen(vdma_out_mm2s_M00_AXI_ARLEN),
        .S_AXI_HP1_arlock(vdma_out_mm2s_M00_AXI_ARLOCK),
        .S_AXI_HP1_arprot(vdma_out_mm2s_M00_AXI_ARPROT),
        .S_AXI_HP1_arqos(vdma_out_mm2s_M00_AXI_ARQOS),
        .S_AXI_HP1_arready(vdma_out_mm2s_M00_AXI_ARREADY),
        .S_AXI_HP1_arsize(vdma_out_mm2s_M00_AXI_ARSIZE),
        .S_AXI_HP1_arvalid(vdma_out_mm2s_M00_AXI_ARVALID),
        .S_AXI_HP1_rdata(vdma_out_mm2s_M00_AXI_RDATA),
        .S_AXI_HP1_rlast(vdma_out_mm2s_M00_AXI_RLAST),
        .S_AXI_HP1_rready(vdma_out_mm2s_M00_AXI_RREADY),
        .S_AXI_HP1_rresp(vdma_out_mm2s_M00_AXI_RRESP),
        .S_AXI_HP1_rvalid(vdma_out_mm2s_M00_AXI_RVALID),
        .S_AXI_HP2_araddr(S_AXI_HP2_1_ARADDR),
        .S_AXI_HP2_arburst(S_AXI_HP2_1_ARBURST),
        .S_AXI_HP2_arcache(S_AXI_HP2_1_ARCACHE),
        .S_AXI_HP2_arlen(S_AXI_HP2_1_ARLEN),
        .S_AXI_HP2_arlock(S_AXI_HP2_1_ARLOCK),
        .S_AXI_HP2_arprot(S_AXI_HP2_1_ARPROT),
        .S_AXI_HP2_arqos(S_AXI_HP2_1_ARQOS),
        .S_AXI_HP2_arready(S_AXI_HP2_1_ARREADY),
        .S_AXI_HP2_arsize(S_AXI_HP2_1_ARSIZE),
        .S_AXI_HP2_arvalid(S_AXI_HP2_1_ARVALID),
        .S_AXI_HP2_rdata(S_AXI_HP2_1_RDATA),
        .S_AXI_HP2_rlast(S_AXI_HP2_1_RLAST),
        .S_AXI_HP2_rready(S_AXI_HP2_1_RREADY),
        .S_AXI_HP2_rresp(S_AXI_HP2_1_RRESP),
        .S_AXI_HP2_rvalid(S_AXI_HP2_1_RVALID),
        .axi_lite_ARESETN(rst_ps7_0_50M_peripheral_aresetn),
        .axi_lite_CLK(processing_system7_0_FCLK_CLK0),
        .intr_0(1'b0),
        .intr_1(vdma_in_s2mm_s2mm_introut),
        .intr_2(1'b0),
        .per_pix_aresetn150(Zynq_system_peripheral_aresetn),
        .pix_clk150(pix_clk));
  vdma_in_s2mm_imp_19UPKVH vdma_in_s2mm
       (.Interconnect_ACLK(Zynq_system_FCLK_CLK2),
        .Interconnect_ARESETN(ARESETN_1),
        .M00_AXI_awaddr(vdma_in_s2mm_M00_AXI_AWADDR),
        .M00_AXI_awburst(vdma_in_s2mm_M00_AXI_AWBURST),
        .M00_AXI_awcache(vdma_in_s2mm_M00_AXI_AWCACHE),
        .M00_AXI_awlen(vdma_in_s2mm_M00_AXI_AWLEN),
        .M00_AXI_awlock(vdma_in_s2mm_M00_AXI_AWLOCK),
        .M00_AXI_awprot(vdma_in_s2mm_M00_AXI_AWPROT),
        .M00_AXI_awqos(vdma_in_s2mm_M00_AXI_AWQOS),
        .M00_AXI_awready(vdma_in_s2mm_M00_AXI_AWREADY),
        .M00_AXI_awsize(vdma_in_s2mm_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(vdma_in_s2mm_M00_AXI_AWVALID),
        .M00_AXI_bready(vdma_in_s2mm_M00_AXI_BREADY),
        .M00_AXI_bresp(vdma_in_s2mm_M00_AXI_BRESP),
        .M00_AXI_bvalid(vdma_in_s2mm_M00_AXI_BVALID),
        .M00_AXI_wdata(vdma_in_s2mm_M00_AXI_WDATA),
        .M00_AXI_wlast(vdma_in_s2mm_M00_AXI_WLAST),
        .M00_AXI_wready(vdma_in_s2mm_M00_AXI_WREADY),
        .M00_AXI_wstrb(vdma_in_s2mm_M00_AXI_WSTRB),
        .M00_AXI_wvalid(vdma_in_s2mm_M00_AXI_WVALID),
        .S_AXIS_S2MM_tdata(S_AXIS_S2MM_1_TDATA),
        .S_AXIS_S2MM_tkeep(S_AXIS_S2MM_1_TKEEP),
        .S_AXIS_S2MM_tlast(S_AXIS_S2MM_1_TLAST),
        .S_AXIS_S2MM_tready(S_AXIS_S2MM_1_TREADY),
        .S_AXIS_S2MM_tuser(S_AXIS_S2MM_1_TUSER),
        .S_AXIS_S2MM_tvalid(S_AXIS_S2MM_1_TVALID),
        .S_AXI_LITE_araddr(S_AXI_LITE_1_ARADDR),
        .S_AXI_LITE_arready(S_AXI_LITE_1_ARREADY),
        .S_AXI_LITE_arvalid(S_AXI_LITE_1_ARVALID),
        .S_AXI_LITE_awaddr(S_AXI_LITE_1_AWADDR),
        .S_AXI_LITE_awready(S_AXI_LITE_1_AWREADY),
        .S_AXI_LITE_awvalid(S_AXI_LITE_1_AWVALID),
        .S_AXI_LITE_bready(S_AXI_LITE_1_BREADY),
        .S_AXI_LITE_bresp(S_AXI_LITE_1_BRESP),
        .S_AXI_LITE_bvalid(S_AXI_LITE_1_BVALID),
        .S_AXI_LITE_rdata(S_AXI_LITE_1_RDATA),
        .S_AXI_LITE_rready(S_AXI_LITE_1_RREADY),
        .S_AXI_LITE_rresp(S_AXI_LITE_1_RRESP),
        .S_AXI_LITE_rvalid(S_AXI_LITE_1_RVALID),
        .S_AXI_LITE_wdata(S_AXI_LITE_1_WDATA),
        .S_AXI_LITE_wready(S_AXI_LITE_1_WREADY),
        .S_AXI_LITE_wvalid(S_AXI_LITE_1_WVALID),
        .axi_resetn(rst_ps7_0_50M_peripheral_aresetn),
        .periphera_ARESETN(M00_ARESETN_1),
        .pix_clk(pix_clk),
        .s2mm_frame_ptr_out(mm2s_frame_ptr_in_1),
        .s2mm_interrupt(vdma_in_s2mm_s2mm_introut),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0));
  vdma_out_mm2s_imp_6D1WXP vdma_out_mm2s
       (.Interconnect_ACLK(Zynq_system_FCLK_CLK2),
        .Interconnect_ARESETN(ARESETN_1),
        .M00_AXI_araddr(vdma_out_mm2s_M00_AXI_ARADDR),
        .M00_AXI_arburst(vdma_out_mm2s_M00_AXI_ARBURST),
        .M00_AXI_arcache(vdma_out_mm2s_M00_AXI_ARCACHE),
        .M00_AXI_arlen(vdma_out_mm2s_M00_AXI_ARLEN),
        .M00_AXI_arlock(vdma_out_mm2s_M00_AXI_ARLOCK),
        .M00_AXI_arprot(vdma_out_mm2s_M00_AXI_ARPROT),
        .M00_AXI_arqos(vdma_out_mm2s_M00_AXI_ARQOS),
        .M00_AXI_arready(vdma_out_mm2s_M00_AXI_ARREADY),
        .M00_AXI_arsize(vdma_out_mm2s_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(vdma_out_mm2s_M00_AXI_ARVALID),
        .M00_AXI_rdata(vdma_out_mm2s_M00_AXI_RDATA),
        .M00_AXI_rlast(vdma_out_mm2s_M00_AXI_RLAST),
        .M00_AXI_rready(vdma_out_mm2s_M00_AXI_RREADY),
        .M00_AXI_rresp(vdma_out_mm2s_M00_AXI_RRESP),
        .M00_AXI_rvalid(vdma_out_mm2s_M00_AXI_RVALID),
        .M_AXIS_MM2S_tdata(S_AXIS_1_TDATA),
        .M_AXIS_MM2S_tkeep(S_AXIS_1_TKEEP),
        .M_AXIS_MM2S_tlast(S_AXIS_1_TLAST),
        .M_AXIS_MM2S_tready(S_AXIS_1_TREADY),
        .M_AXIS_MM2S_tuser(S_AXIS_1_TUSER),
        .M_AXIS_MM2S_tvalid(S_AXIS_1_TVALID),
        .S_AXI_LITE_araddr(Zynq_system_M02_AXI_ARADDR),
        .S_AXI_LITE_arready(Zynq_system_M02_AXI_ARREADY),
        .S_AXI_LITE_arvalid(Zynq_system_M02_AXI_ARVALID),
        .S_AXI_LITE_awaddr(Zynq_system_M02_AXI_AWADDR),
        .S_AXI_LITE_awready(Zynq_system_M02_AXI_AWREADY),
        .S_AXI_LITE_awvalid(Zynq_system_M02_AXI_AWVALID),
        .S_AXI_LITE_bready(Zynq_system_M02_AXI_BREADY),
        .S_AXI_LITE_bresp(Zynq_system_M02_AXI_BRESP),
        .S_AXI_LITE_bvalid(Zynq_system_M02_AXI_BVALID),
        .S_AXI_LITE_rdata(Zynq_system_M02_AXI_RDATA),
        .S_AXI_LITE_rready(Zynq_system_M02_AXI_RREADY),
        .S_AXI_LITE_rresp(Zynq_system_M02_AXI_RRESP),
        .S_AXI_LITE_rvalid(Zynq_system_M02_AXI_RVALID),
        .S_AXI_LITE_wdata(Zynq_system_M02_AXI_WDATA),
        .S_AXI_LITE_wready(Zynq_system_M02_AXI_WREADY),
        .S_AXI_LITE_wvalid(Zynq_system_M02_AXI_WVALID),
        .axi_resetn(rst_ps7_0_50M_peripheral_aresetn),
        .mm2s_frame_ptr_in(mm2s_frame_ptr_in_1),
        .periphera_ARESETN(M00_ARESETN_1),
        .pix_clk(pix_clk),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0));
  vdma_out_mm2s_user_imp_S2M99 vdma_out_mm2s_user
       (.Interconnect_ACLK(Zynq_system_FCLK_CLK2),
        .Interconnect_ARESETN(ARESETN_1),
        .M00_AXI_araddr(S_AXI_HP2_1_ARADDR),
        .M00_AXI_arburst(S_AXI_HP2_1_ARBURST),
        .M00_AXI_arcache(S_AXI_HP2_1_ARCACHE),
        .M00_AXI_arlen(S_AXI_HP2_1_ARLEN),
        .M00_AXI_arlock(S_AXI_HP2_1_ARLOCK),
        .M00_AXI_arprot(S_AXI_HP2_1_ARPROT),
        .M00_AXI_arqos(S_AXI_HP2_1_ARQOS),
        .M00_AXI_arready(S_AXI_HP2_1_ARREADY),
        .M00_AXI_arsize(S_AXI_HP2_1_ARSIZE),
        .M00_AXI_arvalid(S_AXI_HP2_1_ARVALID),
        .M00_AXI_rdata(S_AXI_HP2_1_RDATA),
        .M00_AXI_rlast(S_AXI_HP2_1_RLAST),
        .M00_AXI_rready(S_AXI_HP2_1_RREADY),
        .M00_AXI_rresp(S_AXI_HP2_1_RRESP),
        .M00_AXI_rvalid(S_AXI_HP2_1_RVALID),
        .M_AXIS_MM2S_tdata(S_AXIS_2_TDATA),
        .M_AXIS_MM2S_tkeep(S_AXIS_2_TKEEP),
        .M_AXIS_MM2S_tlast(S_AXIS_2_TLAST),
        .M_AXIS_MM2S_tready(S_AXIS_2_TREADY),
        .M_AXIS_MM2S_tuser(S_AXIS_2_TUSER),
        .M_AXIS_MM2S_tvalid(S_AXIS_2_TVALID),
        .S_AXI_LITE_araddr(S_AXI_LITE_3_ARADDR),
        .S_AXI_LITE_arready(S_AXI_LITE_3_ARREADY),
        .S_AXI_LITE_arvalid(S_AXI_LITE_3_ARVALID),
        .S_AXI_LITE_awaddr(S_AXI_LITE_3_AWADDR),
        .S_AXI_LITE_awready(S_AXI_LITE_3_AWREADY),
        .S_AXI_LITE_awvalid(S_AXI_LITE_3_AWVALID),
        .S_AXI_LITE_bready(S_AXI_LITE_3_BREADY),
        .S_AXI_LITE_bresp(S_AXI_LITE_3_BRESP),
        .S_AXI_LITE_bvalid(S_AXI_LITE_3_BVALID),
        .S_AXI_LITE_rdata(S_AXI_LITE_3_RDATA),
        .S_AXI_LITE_rready(S_AXI_LITE_3_RREADY),
        .S_AXI_LITE_rresp(S_AXI_LITE_3_RRESP),
        .S_AXI_LITE_rvalid(S_AXI_LITE_3_RVALID),
        .S_AXI_LITE_wdata(S_AXI_LITE_3_WDATA),
        .S_AXI_LITE_wready(S_AXI_LITE_3_WREADY),
        .S_AXI_LITE_wvalid(S_AXI_LITE_3_WVALID),
        .axi_resetn(rst_ps7_0_50M_peripheral_aresetn),
        .mm2s_frame_ptr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .periphera_ARESETN(M00_ARESETN_1),
        .pix_clk(pix_clk),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0));
endmodule

module system_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output [63:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input [63:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_s2mm_interconnect_ACLK_net;
  wire axi_s2mm_interconnect_ARESETN_net;
  wire [31:0]axi_s2mm_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_s2mm_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_s2mm_interconnect_to_s00_couplers_AWCACHE;
  wire [7:0]axi_s2mm_interconnect_to_s00_couplers_AWLEN;
  wire [2:0]axi_s2mm_interconnect_to_s00_couplers_AWPROT;
  wire axi_s2mm_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]axi_s2mm_interconnect_to_s00_couplers_AWSIZE;
  wire axi_s2mm_interconnect_to_s00_couplers_AWVALID;
  wire axi_s2mm_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_s2mm_interconnect_to_s00_couplers_BRESP;
  wire axi_s2mm_interconnect_to_s00_couplers_BVALID;
  wire [63:0]axi_s2mm_interconnect_to_s00_couplers_WDATA;
  wire axi_s2mm_interconnect_to_s00_couplers_WLAST;
  wire axi_s2mm_interconnect_to_s00_couplers_WREADY;
  wire [7:0]axi_s2mm_interconnect_to_s00_couplers_WSTRB;
  wire axi_s2mm_interconnect_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_axi_s2mm_interconnect_AWADDR;
  wire [1:0]s00_couplers_to_axi_s2mm_interconnect_AWBURST;
  wire [3:0]s00_couplers_to_axi_s2mm_interconnect_AWCACHE;
  wire [3:0]s00_couplers_to_axi_s2mm_interconnect_AWLEN;
  wire [1:0]s00_couplers_to_axi_s2mm_interconnect_AWLOCK;
  wire [2:0]s00_couplers_to_axi_s2mm_interconnect_AWPROT;
  wire [3:0]s00_couplers_to_axi_s2mm_interconnect_AWQOS;
  wire s00_couplers_to_axi_s2mm_interconnect_AWREADY;
  wire [2:0]s00_couplers_to_axi_s2mm_interconnect_AWSIZE;
  wire s00_couplers_to_axi_s2mm_interconnect_AWVALID;
  wire s00_couplers_to_axi_s2mm_interconnect_BREADY;
  wire [1:0]s00_couplers_to_axi_s2mm_interconnect_BRESP;
  wire s00_couplers_to_axi_s2mm_interconnect_BVALID;
  wire [63:0]s00_couplers_to_axi_s2mm_interconnect_WDATA;
  wire s00_couplers_to_axi_s2mm_interconnect_WLAST;
  wire s00_couplers_to_axi_s2mm_interconnect_WREADY;
  wire [7:0]s00_couplers_to_axi_s2mm_interconnect_WSTRB;
  wire s00_couplers_to_axi_s2mm_interconnect_WVALID;

  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_s2mm_interconnect_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_s2mm_interconnect_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_s2mm_interconnect_AWCACHE;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_s2mm_interconnect_AWLEN;
  assign M00_AXI_awlock[1:0] = s00_couplers_to_axi_s2mm_interconnect_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_s2mm_interconnect_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_axi_s2mm_interconnect_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_s2mm_interconnect_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_s2mm_interconnect_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_s2mm_interconnect_BREADY;
  assign M00_AXI_wdata[63:0] = s00_couplers_to_axi_s2mm_interconnect_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_axi_s2mm_interconnect_WLAST;
  assign M00_AXI_wstrb[7:0] = s00_couplers_to_axi_s2mm_interconnect_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_s2mm_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_awready = axi_s2mm_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_s2mm_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_s2mm_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_wready = axi_s2mm_interconnect_to_s00_couplers_WREADY;
  assign axi_s2mm_interconnect_ACLK_net = M00_ACLK;
  assign axi_s2mm_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_s2mm_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_s2mm_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_s2mm_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_s2mm_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[63:0];
  assign axi_s2mm_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_s2mm_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[7:0];
  assign axi_s2mm_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_s2mm_interconnect_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_s2mm_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_s2mm_interconnect_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_s2mm_interconnect_WREADY = M00_AXI_wready;
  s00_couplers_imp_YI60WO s00_couplers
       (.M_ACLK(axi_s2mm_interconnect_ACLK_net),
        .M_ARESETN(axi_s2mm_interconnect_ARESETN_net),
        .M_AXI_awaddr(s00_couplers_to_axi_s2mm_interconnect_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_s2mm_interconnect_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_s2mm_interconnect_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_axi_s2mm_interconnect_AWLEN),
        .M_AXI_awlock(s00_couplers_to_axi_s2mm_interconnect_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_axi_s2mm_interconnect_AWPROT),
        .M_AXI_awqos(s00_couplers_to_axi_s2mm_interconnect_AWQOS),
        .M_AXI_awready(s00_couplers_to_axi_s2mm_interconnect_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_s2mm_interconnect_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_s2mm_interconnect_AWVALID),
        .M_AXI_bready(s00_couplers_to_axi_s2mm_interconnect_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_s2mm_interconnect_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_s2mm_interconnect_BVALID),
        .M_AXI_wdata(s00_couplers_to_axi_s2mm_interconnect_WDATA),
        .M_AXI_wlast(s00_couplers_to_axi_s2mm_interconnect_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_s2mm_interconnect_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_s2mm_interconnect_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_s2mm_interconnect_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_awaddr(axi_s2mm_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_s2mm_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_s2mm_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awlen(axi_s2mm_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awprot(axi_s2mm_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_s2mm_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_s2mm_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_s2mm_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_s2mm_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_s2mm_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_s2mm_interconnect_to_s00_couplers_BVALID),
        .S_AXI_wdata(axi_s2mm_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_s2mm_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_s2mm_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_s2mm_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_s2mm_interconnect_to_s00_couplers_WVALID));
endmodule

module system_axi_interconnect_0_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [63:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_mm2s_interconnect_ACLK_net;
  wire axi_mm2s_interconnect_ARESETN_net;
  wire [31:0]axi_mm2s_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_mm2s_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_mm2s_interconnect_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mm2s_interconnect_to_s00_couplers_ARLEN;
  wire [2:0]axi_mm2s_interconnect_to_s00_couplers_ARPROT;
  wire axi_mm2s_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_mm2s_interconnect_to_s00_couplers_ARSIZE;
  wire axi_mm2s_interconnect_to_s00_couplers_ARVALID;
  wire [63:0]axi_mm2s_interconnect_to_s00_couplers_RDATA;
  wire axi_mm2s_interconnect_to_s00_couplers_RLAST;
  wire axi_mm2s_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_mm2s_interconnect_to_s00_couplers_RRESP;
  wire axi_mm2s_interconnect_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_axi_mm2s_interconnect_ARADDR;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_ARBURST;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARCACHE;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARLEN;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_ARLOCK;
  wire [2:0]s00_couplers_to_axi_mm2s_interconnect_ARPROT;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARQOS;
  wire s00_couplers_to_axi_mm2s_interconnect_ARREADY;
  wire [2:0]s00_couplers_to_axi_mm2s_interconnect_ARSIZE;
  wire s00_couplers_to_axi_mm2s_interconnect_ARVALID;
  wire [63:0]s00_couplers_to_axi_mm2s_interconnect_RDATA;
  wire s00_couplers_to_axi_mm2s_interconnect_RLAST;
  wire s00_couplers_to_axi_mm2s_interconnect_RREADY;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_RRESP;
  wire s00_couplers_to_axi_mm2s_interconnect_RVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_mm2s_interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_mm2s_interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARCACHE;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARLEN;
  assign M00_AXI_arlock[1:0] = s00_couplers_to_axi_mm2s_interconnect_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_mm2s_interconnect_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_mm2s_interconnect_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_mm2s_interconnect_ARVALID;
  assign M00_AXI_rready = s00_couplers_to_axi_mm2s_interconnect_RREADY;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_mm2s_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[63:0] = axi_mm2s_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_mm2s_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mm2s_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_mm2s_interconnect_to_s00_couplers_RVALID;
  assign axi_mm2s_interconnect_ACLK_net = M00_ACLK;
  assign axi_mm2s_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_mm2s_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_mm2s_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign s00_couplers_to_axi_mm2s_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_mm2s_interconnect_RDATA = M00_AXI_rdata[63:0];
  assign s00_couplers_to_axi_mm2s_interconnect_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_mm2s_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_mm2s_interconnect_RVALID = M00_AXI_rvalid;
  s00_couplers_imp_U5IPAH s00_couplers
       (.M_ACLK(axi_mm2s_interconnect_ACLK_net),
        .M_ARESETN(axi_mm2s_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_mm2s_interconnect_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_mm2s_interconnect_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_mm2s_interconnect_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_axi_mm2s_interconnect_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_mm2s_interconnect_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_mm2s_interconnect_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_mm2s_interconnect_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_mm2s_interconnect_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_mm2s_interconnect_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_mm2s_interconnect_ARVALID),
        .M_AXI_rdata(s00_couplers_to_axi_mm2s_interconnect_RDATA),
        .M_AXI_rlast(s00_couplers_to_axi_mm2s_interconnect_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_mm2s_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_mm2s_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_mm2s_interconnect_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mm2s_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mm2s_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mm2s_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mm2s_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mm2s_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mm2s_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mm2s_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mm2s_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mm2s_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mm2s_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mm2s_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mm2s_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mm2s_interconnect_to_s00_couplers_RVALID));
endmodule

module system_axi_mm2s_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [63:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_mm2s_interconnect_ACLK_net;
  wire axi_mm2s_interconnect_ARESETN_net;
  wire [31:0]axi_mm2s_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_mm2s_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_mm2s_interconnect_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mm2s_interconnect_to_s00_couplers_ARLEN;
  wire [2:0]axi_mm2s_interconnect_to_s00_couplers_ARPROT;
  wire axi_mm2s_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_mm2s_interconnect_to_s00_couplers_ARSIZE;
  wire axi_mm2s_interconnect_to_s00_couplers_ARVALID;
  wire [63:0]axi_mm2s_interconnect_to_s00_couplers_RDATA;
  wire axi_mm2s_interconnect_to_s00_couplers_RLAST;
  wire axi_mm2s_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_mm2s_interconnect_to_s00_couplers_RRESP;
  wire axi_mm2s_interconnect_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_axi_mm2s_interconnect_ARADDR;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_ARBURST;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARCACHE;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARLEN;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_ARLOCK;
  wire [2:0]s00_couplers_to_axi_mm2s_interconnect_ARPROT;
  wire [3:0]s00_couplers_to_axi_mm2s_interconnect_ARQOS;
  wire s00_couplers_to_axi_mm2s_interconnect_ARREADY;
  wire [2:0]s00_couplers_to_axi_mm2s_interconnect_ARSIZE;
  wire s00_couplers_to_axi_mm2s_interconnect_ARVALID;
  wire [63:0]s00_couplers_to_axi_mm2s_interconnect_RDATA;
  wire s00_couplers_to_axi_mm2s_interconnect_RLAST;
  wire s00_couplers_to_axi_mm2s_interconnect_RREADY;
  wire [1:0]s00_couplers_to_axi_mm2s_interconnect_RRESP;
  wire s00_couplers_to_axi_mm2s_interconnect_RVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_mm2s_interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_mm2s_interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARCACHE;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARLEN;
  assign M00_AXI_arlock[1:0] = s00_couplers_to_axi_mm2s_interconnect_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_mm2s_interconnect_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_mm2s_interconnect_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_mm2s_interconnect_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_mm2s_interconnect_ARVALID;
  assign M00_AXI_rready = s00_couplers_to_axi_mm2s_interconnect_RREADY;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_mm2s_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[63:0] = axi_mm2s_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_mm2s_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mm2s_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_mm2s_interconnect_to_s00_couplers_RVALID;
  assign axi_mm2s_interconnect_ACLK_net = M00_ACLK;
  assign axi_mm2s_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_mm2s_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mm2s_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_mm2s_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign s00_couplers_to_axi_mm2s_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_mm2s_interconnect_RDATA = M00_AXI_rdata[63:0];
  assign s00_couplers_to_axi_mm2s_interconnect_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_mm2s_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_mm2s_interconnect_RVALID = M00_AXI_rvalid;
  s00_couplers_imp_H3F9MB s00_couplers
       (.M_ACLK(axi_mm2s_interconnect_ACLK_net),
        .M_ARESETN(axi_mm2s_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_mm2s_interconnect_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_mm2s_interconnect_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_mm2s_interconnect_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_axi_mm2s_interconnect_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_mm2s_interconnect_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_mm2s_interconnect_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_mm2s_interconnect_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_mm2s_interconnect_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_mm2s_interconnect_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_mm2s_interconnect_ARVALID),
        .M_AXI_rdata(s00_couplers_to_axi_mm2s_interconnect_RDATA),
        .M_AXI_rlast(s00_couplers_to_axi_mm2s_interconnect_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_mm2s_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_mm2s_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_mm2s_interconnect_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mm2s_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mm2s_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mm2s_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mm2s_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mm2s_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mm2s_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mm2s_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mm2s_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mm2s_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mm2s_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mm2s_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mm2s_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mm2s_interconnect_to_s00_couplers_RVALID));
endmodule

module system_ps7_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [7:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [7:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [7:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [7:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire m00_couplers_to_ps7_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_ps7_0_axi_periph_ARREADY;
  wire m00_couplers_to_ps7_0_axi_periph_ARVALID;
  wire m00_couplers_to_ps7_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_ps7_0_axi_periph_AWREADY;
  wire m00_couplers_to_ps7_0_axi_periph_AWVALID;
  wire m00_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps7_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps7_0_axi_periph_RDATA;
  wire m00_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps7_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_ps7_0_axi_periph_RVALID;
  wire m00_couplers_to_ps7_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_ps7_0_axi_periph_WREADY;
  wire m00_couplers_to_ps7_0_axi_periph_WSTRB;
  wire m00_couplers_to_ps7_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_ps7_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_ps7_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps7_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps7_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps7_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps7_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_WREADY;
  wire [0:0]m01_couplers_to_ps7_0_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_ps7_0_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_ps7_0_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_ps7_0_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_ps7_0_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_ps7_0_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_ps7_0_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_WREADY;
  wire [0:0]m02_couplers_to_ps7_0_axi_periph_WVALID;
  wire [7:0]m03_couplers_to_ps7_0_axi_periph_ARADDR;
  wire m03_couplers_to_ps7_0_axi_periph_ARREADY;
  wire m03_couplers_to_ps7_0_axi_periph_ARVALID;
  wire [7:0]m03_couplers_to_ps7_0_axi_periph_AWADDR;
  wire m03_couplers_to_ps7_0_axi_periph_AWREADY;
  wire m03_couplers_to_ps7_0_axi_periph_AWVALID;
  wire m03_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m03_couplers_to_ps7_0_axi_periph_BRESP;
  wire m03_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m03_couplers_to_ps7_0_axi_periph_RDATA;
  wire m03_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m03_couplers_to_ps7_0_axi_periph_RRESP;
  wire m03_couplers_to_ps7_0_axi_periph_RVALID;
  wire [31:0]m03_couplers_to_ps7_0_axi_periph_WDATA;
  wire m03_couplers_to_ps7_0_axi_periph_WREADY;
  wire [3:0]m03_couplers_to_ps7_0_axi_periph_WSTRB;
  wire m03_couplers_to_ps7_0_axi_periph_WVALID;
  wire m04_couplers_to_ps7_0_axi_periph_ARADDR;
  wire m04_couplers_to_ps7_0_axi_periph_ARREADY;
  wire m04_couplers_to_ps7_0_axi_periph_ARVALID;
  wire m04_couplers_to_ps7_0_axi_periph_AWADDR;
  wire m04_couplers_to_ps7_0_axi_periph_AWREADY;
  wire m04_couplers_to_ps7_0_axi_periph_AWVALID;
  wire m04_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m04_couplers_to_ps7_0_axi_periph_BRESP;
  wire m04_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m04_couplers_to_ps7_0_axi_periph_RDATA;
  wire m04_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m04_couplers_to_ps7_0_axi_periph_RRESP;
  wire m04_couplers_to_ps7_0_axi_periph_RVALID;
  wire m04_couplers_to_ps7_0_axi_periph_WDATA;
  wire m04_couplers_to_ps7_0_axi_periph_WREADY;
  wire m04_couplers_to_ps7_0_axi_periph_WVALID;
  wire [31:0]m05_couplers_to_ps7_0_axi_periph_ARADDR;
  wire m05_couplers_to_ps7_0_axi_periph_ARREADY;
  wire m05_couplers_to_ps7_0_axi_periph_ARVALID;
  wire [31:0]m05_couplers_to_ps7_0_axi_periph_AWADDR;
  wire m05_couplers_to_ps7_0_axi_periph_AWREADY;
  wire m05_couplers_to_ps7_0_axi_periph_AWVALID;
  wire m05_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m05_couplers_to_ps7_0_axi_periph_BRESP;
  wire m05_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m05_couplers_to_ps7_0_axi_periph_RDATA;
  wire m05_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m05_couplers_to_ps7_0_axi_periph_RRESP;
  wire m05_couplers_to_ps7_0_axi_periph_RVALID;
  wire [31:0]m05_couplers_to_ps7_0_axi_periph_WDATA;
  wire m05_couplers_to_ps7_0_axi_periph_WREADY;
  wire m05_couplers_to_ps7_0_axi_periph_WVALID;
  wire m06_couplers_to_ps7_0_axi_periph_ARADDR;
  wire m06_couplers_to_ps7_0_axi_periph_ARREADY;
  wire m06_couplers_to_ps7_0_axi_periph_ARVALID;
  wire m06_couplers_to_ps7_0_axi_periph_AWADDR;
  wire m06_couplers_to_ps7_0_axi_periph_AWREADY;
  wire m06_couplers_to_ps7_0_axi_periph_AWVALID;
  wire m06_couplers_to_ps7_0_axi_periph_BREADY;
  wire [1:0]m06_couplers_to_ps7_0_axi_periph_BRESP;
  wire m06_couplers_to_ps7_0_axi_periph_BVALID;
  wire [31:0]m06_couplers_to_ps7_0_axi_periph_RDATA;
  wire m06_couplers_to_ps7_0_axi_periph_RREADY;
  wire [1:0]m06_couplers_to_ps7_0_axi_periph_RRESP;
  wire m06_couplers_to_ps7_0_axi_periph_RVALID;
  wire m06_couplers_to_ps7_0_axi_periph_WDATA;
  wire m06_couplers_to_ps7_0_axi_periph_WREADY;
  wire m06_couplers_to_ps7_0_axi_periph_WSTRB;
  wire m06_couplers_to_ps7_0_axi_periph_WVALID;
  wire ps7_0_axi_periph_ACLK_net;
  wire ps7_0_axi_periph_ARESETN_net;
  wire [31:0]ps7_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]ps7_0_axi_periph_to_s00_couplers_ARID;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps7_0_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_ARQOS;
  wire ps7_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps7_0_axi_periph_to_s00_couplers_ARSIZE;
  wire ps7_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]ps7_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]ps7_0_axi_periph_to_s00_couplers_AWID;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps7_0_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_AWQOS;
  wire ps7_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps7_0_axi_periph_to_s00_couplers_AWSIZE;
  wire ps7_0_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]ps7_0_axi_periph_to_s00_couplers_BID;
  wire ps7_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_BRESP;
  wire ps7_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]ps7_0_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]ps7_0_axi_periph_to_s00_couplers_RID;
  wire ps7_0_axi_periph_to_s00_couplers_RLAST;
  wire ps7_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps7_0_axi_periph_to_s00_couplers_RRESP;
  wire ps7_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]ps7_0_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]ps7_0_axi_periph_to_s00_couplers_WID;
  wire ps7_0_axi_periph_to_s00_couplers_WLAST;
  wire ps7_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]ps7_0_axi_periph_to_s00_couplers_WSTRB;
  wire ps7_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [11:9]xbar_to_m03_couplers_ARPROT;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [11:9]xbar_to_m03_couplers_AWPROT;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire [20:18]xbar_to_m06_couplers_ARPROT;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire [20:18]xbar_to_m06_couplers_AWPROT;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [20:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [20:0]NLW_xbar_m_axi_awprot_UNCONNECTED;
  wire [27:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[30] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[29] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[28] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[27] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[26] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[25] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[24] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[23] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[22] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[21] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[20] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[19] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[18] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[17] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[16] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[15] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[14] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[13] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[12] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[11] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[10] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[9] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[8] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[7] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[6] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[5] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[4] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[3] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[2] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[1] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_araddr[0] = m00_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[30] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[29] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[28] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[27] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[26] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[25] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[24] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[23] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[22] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[21] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[20] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[19] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[18] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[17] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[16] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[15] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[14] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[13] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[12] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[11] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[10] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[9] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[8] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[7] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[6] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[5] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[4] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[3] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[2] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[1] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awaddr[0] = m00_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_ps7_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_ps7_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[30] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[29] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[28] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[27] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[26] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[25] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[24] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[23] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[22] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[21] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[20] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[19] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[18] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[17] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[16] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[15] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[14] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[13] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[12] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[11] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[10] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[9] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[8] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[7] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[6] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[5] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[4] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[3] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[2] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[1] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wdata[0] = m00_couplers_to_ps7_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3] = m00_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M00_AXI_wstrb[2] = m00_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M00_AXI_wstrb[1] = m00_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M00_AXI_wstrb[0] = m00_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_ps7_0_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_ps7_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_ps7_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps7_0_axi_periph_WDATA;
  assign M01_AXI_wvalid[0] = m01_couplers_to_ps7_0_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_ps7_0_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_ps7_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_ps7_0_axi_periph_WDATA;
  assign M02_AXI_wvalid[0] = m02_couplers_to_ps7_0_axi_periph_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[7:0] = m03_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M03_AXI_arvalid = m03_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M03_AXI_awaddr[7:0] = m03_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M03_AXI_awvalid = m03_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_ps7_0_axi_periph_BREADY;
  assign M03_AXI_rready = m03_couplers_to_ps7_0_axi_periph_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_ps7_0_axi_periph_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_ps7_0_axi_periph_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[31] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[30] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[29] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[28] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[27] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[26] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[25] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[24] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[23] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[22] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[21] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[20] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[19] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[18] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[17] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[16] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[15] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[14] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[13] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[12] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[11] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[10] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[9] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[8] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[7] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[6] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[5] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[4] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[3] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[2] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[1] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_araddr[0] = m04_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M04_AXI_arvalid = m04_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M04_AXI_awaddr[31] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[30] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[29] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[28] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[27] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[26] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[25] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[24] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[23] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[22] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[21] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[20] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[19] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[18] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[17] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[16] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[15] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[14] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[13] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[12] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[11] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[10] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[9] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[8] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[7] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[6] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[5] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[4] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[3] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[2] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[1] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awaddr[0] = m04_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M04_AXI_awvalid = m04_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_ps7_0_axi_periph_BREADY;
  assign M04_AXI_rready = m04_couplers_to_ps7_0_axi_periph_RREADY;
  assign M04_AXI_wdata[31] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[30] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[29] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[28] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[27] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[26] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[25] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[24] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[23] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[22] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[21] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[20] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[19] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[18] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[17] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[16] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[15] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[14] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[13] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[12] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[11] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[10] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[9] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[8] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[7] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[6] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[5] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[4] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[3] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[2] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[1] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wdata[0] = m04_couplers_to_ps7_0_axi_periph_WDATA;
  assign M04_AXI_wvalid = m04_couplers_to_ps7_0_axi_periph_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[31:0] = m05_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M05_AXI_arvalid = m05_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M05_AXI_awvalid = m05_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_ps7_0_axi_periph_BREADY;
  assign M05_AXI_rready = m05_couplers_to_ps7_0_axi_periph_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_ps7_0_axi_periph_WDATA;
  assign M05_AXI_wvalid = m05_couplers_to_ps7_0_axi_periph_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[7] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[6] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[5] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[4] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[3] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[2] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[1] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_araddr[0] = m06_couplers_to_ps7_0_axi_periph_ARADDR;
  assign M06_AXI_arvalid = m06_couplers_to_ps7_0_axi_periph_ARVALID;
  assign M06_AXI_awaddr[7] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[6] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[5] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[4] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[3] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[2] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[1] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awaddr[0] = m06_couplers_to_ps7_0_axi_periph_AWADDR;
  assign M06_AXI_awvalid = m06_couplers_to_ps7_0_axi_periph_AWVALID;
  assign M06_AXI_bready = m06_couplers_to_ps7_0_axi_periph_BREADY;
  assign M06_AXI_rready = m06_couplers_to_ps7_0_axi_periph_RREADY;
  assign M06_AXI_wdata[31] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[30] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[29] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[28] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[27] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[26] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[25] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[24] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[23] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[22] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[21] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[20] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[19] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[18] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[17] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[16] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[15] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[14] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[13] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[12] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[11] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[10] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[9] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[8] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[7] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[6] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[5] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[4] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[3] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[2] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[1] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wdata[0] = m06_couplers_to_ps7_0_axi_periph_WDATA;
  assign M06_AXI_wstrb[3] = m06_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M06_AXI_wstrb[2] = m06_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M06_AXI_wstrb[1] = m06_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M06_AXI_wstrb[0] = m06_couplers_to_ps7_0_axi_periph_WSTRB;
  assign M06_AXI_wvalid = m06_couplers_to_ps7_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = ps7_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps7_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = ps7_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps7_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps7_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = ps7_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = ps7_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps7_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps7_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps7_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps7_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps7_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_ps7_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_ps7_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps7_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_ps7_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps7_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps7_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_ps7_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_ps7_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_ps7_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_ps7_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps7_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_ps7_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps7_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps7_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_ps7_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_ps7_0_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_ps7_0_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_ps7_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_ps7_0_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_ps7_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_ps7_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_ps7_0_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_ps7_0_axi_periph_WREADY = M02_AXI_wready[0];
  assign m03_couplers_to_ps7_0_axi_periph_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_ps7_0_axi_periph_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_ps7_0_axi_periph_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_ps7_0_axi_periph_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_ps7_0_axi_periph_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_ps7_0_axi_periph_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_ps7_0_axi_periph_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_ps7_0_axi_periph_WREADY = M03_AXI_wready;
  assign m04_couplers_to_ps7_0_axi_periph_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_ps7_0_axi_periph_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_ps7_0_axi_periph_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_ps7_0_axi_periph_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_ps7_0_axi_periph_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_ps7_0_axi_periph_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_ps7_0_axi_periph_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_ps7_0_axi_periph_WREADY = M04_AXI_wready;
  assign m05_couplers_to_ps7_0_axi_periph_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_ps7_0_axi_periph_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_ps7_0_axi_periph_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_ps7_0_axi_periph_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_ps7_0_axi_periph_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_ps7_0_axi_periph_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_ps7_0_axi_periph_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_ps7_0_axi_periph_WREADY = M05_AXI_wready;
  assign m06_couplers_to_ps7_0_axi_periph_ARREADY = M06_AXI_arready;
  assign m06_couplers_to_ps7_0_axi_periph_AWREADY = M06_AXI_awready;
  assign m06_couplers_to_ps7_0_axi_periph_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_ps7_0_axi_periph_BVALID = M06_AXI_bvalid;
  assign m06_couplers_to_ps7_0_axi_periph_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_ps7_0_axi_periph_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_ps7_0_axi_periph_RVALID = M06_AXI_rvalid;
  assign m06_couplers_to_ps7_0_axi_periph_WREADY = M06_AXI_wready;
  assign ps7_0_axi_periph_ACLK_net = ACLK;
  assign ps7_0_axi_periph_ARESETN_net = ARESETN;
  assign ps7_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps7_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps7_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps7_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps7_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps7_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps7_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign ps7_0_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign ps7_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps7_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign ps7_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_HIM33Y m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps7_0_axi_periph_BRESP[0]),
        .M_AXI_bvalid(m00_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps7_0_axi_periph_RDATA[0]),
        .M_AXI_rready(m00_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps7_0_axi_periph_RRESP[0]),
        .M_AXI_rvalid(m00_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_ps7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR[0]),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT[0]),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR[0]),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT[0]),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA[0]),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB[0]),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_14B8CZ3 m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps7_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1F6ZLNH m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_ps7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_ps7_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_ps7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m02_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_6CUUVG m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m03_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m03_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m03_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m03_couplers_to_ps7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m03_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m03_couplers_to_ps7_0_axi_periph_RDATA),
        .M_AXI_rready(m03_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m03_couplers_to_ps7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m03_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m03_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m03_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m03_couplers_to_ps7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m03_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m03_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_1T7ZYD5 m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m04_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m04_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m04_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m04_couplers_to_ps7_0_axi_periph_BRESP[0]),
        .M_AXI_bvalid(m04_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m04_couplers_to_ps7_0_axi_periph_RDATA[0]),
        .M_AXI_rready(m04_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m04_couplers_to_ps7_0_axi_periph_RRESP[0]),
        .M_AXI_rvalid(m04_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m04_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m04_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m04_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR[128]),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT[12]),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR[128]),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT[12]),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA[128]),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB[16]),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_J9WTGO m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m05_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m05_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m05_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m05_couplers_to_ps7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m05_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m05_couplers_to_ps7_0_axi_periph_RDATA),
        .M_AXI_rready(m05_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m05_couplers_to_ps7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m05_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m05_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m05_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m05_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_U5O3X6 m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_ps7_0_axi_periph_ARADDR),
        .M_AXI_arready(m06_couplers_to_ps7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_ps7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_ps7_0_axi_periph_AWADDR),
        .M_AXI_awready(m06_couplers_to_ps7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_ps7_0_axi_periph_AWVALID),
        .M_AXI_bready(m06_couplers_to_ps7_0_axi_periph_BREADY),
        .M_AXI_bresp(m06_couplers_to_ps7_0_axi_periph_BRESP[0]),
        .M_AXI_bvalid(m06_couplers_to_ps7_0_axi_periph_BVALID),
        .M_AXI_rdata(m06_couplers_to_ps7_0_axi_periph_RDATA[0]),
        .M_AXI_rready(m06_couplers_to_ps7_0_axi_periph_RREADY),
        .M_AXI_rresp(m06_couplers_to_ps7_0_axi_periph_RRESP[0]),
        .M_AXI_rvalid(m06_couplers_to_ps7_0_axi_periph_RVALID),
        .M_AXI_wdata(m06_couplers_to_ps7_0_axi_periph_WDATA),
        .M_AXI_wready(m06_couplers_to_ps7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m06_couplers_to_ps7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_ps7_0_axi_periph_WVALID),
        .S_ACLK(ps7_0_axi_periph_ACLK_net),
        .S_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR[192]),
        .S_AXI_arprot(xbar_to_m06_couplers_ARPROT[18]),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR[192]),
        .S_AXI_awprot(xbar_to_m06_couplers_AWPROT[18]),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA[192]),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB[24]),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_2ERGDR s00_couplers
       (.M_ACLK(ps7_0_axi_periph_ACLK_net),
        .M_ARESETN(ps7_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(ps7_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps7_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps7_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps7_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps7_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps7_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps7_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps7_0_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps7_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps7_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps7_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps7_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps7_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps7_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps7_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps7_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps7_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps7_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps7_0_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps7_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps7_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps7_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps7_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps7_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps7_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps7_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps7_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps7_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps7_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps7_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps7_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps7_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps7_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(ps7_0_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(ps7_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps7_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps7_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps7_0_axi_periph_to_s00_couplers_WVALID));
  system_xbar_0 xbar
       (.aclk(ps7_0_axi_periph_ACLK_net),
        .aresetn(ps7_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m06_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[17:15],xbar_to_m04_couplers_ARPROT,xbar_to_m03_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[8:3],xbar_to_m00_couplers_ARPROT}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m06_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[17:15],xbar_to_m04_couplers_AWPROT,xbar_to_m03_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[8:3],xbar_to_m00_couplers_AWPROT}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m06_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[23:20],xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[11:4],xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module vdma_in_s2mm_imp_19UPKVH
   (Interconnect_ACLK,
    Interconnect_ARESETN,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S_AXIS_S2MM_tdata,
    S_AXIS_S2MM_tkeep,
    S_AXIS_S2MM_tlast,
    S_AXIS_S2MM_tready,
    S_AXIS_S2MM_tuser,
    S_AXIS_S2MM_tvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    axi_resetn,
    periphera_ARESETN,
    pix_clk,
    s2mm_frame_ptr_out,
    s2mm_interrupt,
    s_axi_lite_aclk);
  input Interconnect_ACLK;
  input Interconnect_ARESETN;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output [63:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input [31:0]S_AXIS_S2MM_tdata;
  input [3:0]S_AXIS_S2MM_tkeep;
  input S_AXIS_S2MM_tlast;
  output S_AXIS_S2MM_tready;
  input [0:0]S_AXIS_S2MM_tuser;
  input S_AXIS_S2MM_tvalid;
  input [31:0]S_AXI_LITE_araddr;
  output [0:0]S_AXI_LITE_arready;
  input [0:0]S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output [0:0]S_AXI_LITE_awready;
  input [0:0]S_AXI_LITE_awvalid;
  input [0:0]S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output [0:0]S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input [0:0]S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output [0:0]S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output [0:0]S_AXI_LITE_wready;
  input [0:0]S_AXI_LITE_wvalid;
  input axi_resetn;
  input periphera_ARESETN;
  input pix_clk;
  output [5:0]s2mm_frame_ptr_out;
  output s2mm_interrupt;
  input s_axi_lite_aclk;

  wire ACLK_1;
  wire ARESETN_1;
  wire [31:0]Conn1_TDATA;
  wire [3:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire [0:0]Conn1_TUSER;
  wire Conn1_TVALID;
  wire S00_ARESETN_1;
  wire [31:0]S_AXI_LITE_1_ARADDR;
  wire S_AXI_LITE_1_ARREADY;
  wire [0:0]S_AXI_LITE_1_ARVALID;
  wire [31:0]S_AXI_LITE_1_AWADDR;
  wire S_AXI_LITE_1_AWREADY;
  wire [0:0]S_AXI_LITE_1_AWVALID;
  wire [0:0]S_AXI_LITE_1_BREADY;
  wire [1:0]S_AXI_LITE_1_BRESP;
  wire S_AXI_LITE_1_BVALID;
  wire [31:0]S_AXI_LITE_1_RDATA;
  wire [0:0]S_AXI_LITE_1_RREADY;
  wire [1:0]S_AXI_LITE_1_RRESP;
  wire S_AXI_LITE_1_RVALID;
  wire [31:0]S_AXI_LITE_1_WDATA;
  wire S_AXI_LITE_1_WREADY;
  wire [0:0]S_AXI_LITE_1_WVALID;
  wire axi_resetn_1;
  wire [31:0]axi_s2mm_interconnect_M00_AXI_AWADDR;
  wire [1:0]axi_s2mm_interconnect_M00_AXI_AWBURST;
  wire [3:0]axi_s2mm_interconnect_M00_AXI_AWCACHE;
  wire [3:0]axi_s2mm_interconnect_M00_AXI_AWLEN;
  wire [1:0]axi_s2mm_interconnect_M00_AXI_AWLOCK;
  wire [2:0]axi_s2mm_interconnect_M00_AXI_AWPROT;
  wire [3:0]axi_s2mm_interconnect_M00_AXI_AWQOS;
  wire axi_s2mm_interconnect_M00_AXI_AWREADY;
  wire [2:0]axi_s2mm_interconnect_M00_AXI_AWSIZE;
  wire axi_s2mm_interconnect_M00_AXI_AWVALID;
  wire axi_s2mm_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_s2mm_interconnect_M00_AXI_BRESP;
  wire axi_s2mm_interconnect_M00_AXI_BVALID;
  wire [63:0]axi_s2mm_interconnect_M00_AXI_WDATA;
  wire axi_s2mm_interconnect_M00_AXI_WLAST;
  wire axi_s2mm_interconnect_M00_AXI_WREADY;
  wire [7:0]axi_s2mm_interconnect_M00_AXI_WSTRB;
  wire axi_s2mm_interconnect_M00_AXI_WVALID;
  wire [31:0]axi_vdma_s2mm_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_vdma_s2mm_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_vdma_s2mm_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_vdma_s2mm_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_vdma_s2mm_M_AXI_S2MM_AWPROT;
  wire axi_vdma_s2mm_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_vdma_s2mm_M_AXI_S2MM_AWSIZE;
  wire axi_vdma_s2mm_M_AXI_S2MM_AWVALID;
  wire axi_vdma_s2mm_M_AXI_S2MM_BREADY;
  wire [1:0]axi_vdma_s2mm_M_AXI_S2MM_BRESP;
  wire axi_vdma_s2mm_M_AXI_S2MM_BVALID;
  wire [63:0]axi_vdma_s2mm_M_AXI_S2MM_WDATA;
  wire axi_vdma_s2mm_M_AXI_S2MM_WLAST;
  wire axi_vdma_s2mm_M_AXI_S2MM_WREADY;
  wire [7:0]axi_vdma_s2mm_M_AXI_S2MM_WSTRB;
  wire axi_vdma_s2mm_M_AXI_S2MM_WVALID;
  wire [5:0]axi_vdma_s2mm_s2mm_frame_ptr_out;
  wire axi_vdma_s2mm_s2mm_introut;
  wire s_axi_lite_aclk_1;
  wire s_axis_s2mm_aclk_1;

  assign ACLK_1 = Interconnect_ACLK;
  assign ARESETN_1 = Interconnect_ARESETN;
  assign Conn1_TDATA = S_AXIS_S2MM_tdata[31:0];
  assign Conn1_TKEEP = S_AXIS_S2MM_tkeep[3:0];
  assign Conn1_TLAST = S_AXIS_S2MM_tlast;
  assign Conn1_TUSER = S_AXIS_S2MM_tuser[0];
  assign Conn1_TVALID = S_AXIS_S2MM_tvalid;
  assign M00_AXI_awaddr[31:0] = axi_s2mm_interconnect_M00_AXI_AWADDR;
  assign M00_AXI_awburst[1:0] = axi_s2mm_interconnect_M00_AXI_AWBURST;
  assign M00_AXI_awcache[3:0] = axi_s2mm_interconnect_M00_AXI_AWCACHE;
  assign M00_AXI_awlen[3:0] = axi_s2mm_interconnect_M00_AXI_AWLEN;
  assign M00_AXI_awlock[1:0] = axi_s2mm_interconnect_M00_AXI_AWLOCK;
  assign M00_AXI_awprot[2:0] = axi_s2mm_interconnect_M00_AXI_AWPROT;
  assign M00_AXI_awqos[3:0] = axi_s2mm_interconnect_M00_AXI_AWQOS;
  assign M00_AXI_awsize[2:0] = axi_s2mm_interconnect_M00_AXI_AWSIZE;
  assign M00_AXI_awvalid = axi_s2mm_interconnect_M00_AXI_AWVALID;
  assign M00_AXI_bready = axi_s2mm_interconnect_M00_AXI_BREADY;
  assign M00_AXI_wdata[63:0] = axi_s2mm_interconnect_M00_AXI_WDATA;
  assign M00_AXI_wlast = axi_s2mm_interconnect_M00_AXI_WLAST;
  assign M00_AXI_wstrb[7:0] = axi_s2mm_interconnect_M00_AXI_WSTRB;
  assign M00_AXI_wvalid = axi_s2mm_interconnect_M00_AXI_WVALID;
  assign S00_ARESETN_1 = periphera_ARESETN;
  assign S_AXIS_S2MM_tready = Conn1_TREADY;
  assign S_AXI_LITE_1_ARADDR = S_AXI_LITE_araddr[31:0];
  assign S_AXI_LITE_1_ARVALID = S_AXI_LITE_arvalid[0];
  assign S_AXI_LITE_1_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign S_AXI_LITE_1_AWVALID = S_AXI_LITE_awvalid[0];
  assign S_AXI_LITE_1_BREADY = S_AXI_LITE_bready[0];
  assign S_AXI_LITE_1_RREADY = S_AXI_LITE_rready[0];
  assign S_AXI_LITE_1_WDATA = S_AXI_LITE_wdata[31:0];
  assign S_AXI_LITE_1_WVALID = S_AXI_LITE_wvalid[0];
  assign S_AXI_LITE_arready[0] = S_AXI_LITE_1_ARREADY;
  assign S_AXI_LITE_awready[0] = S_AXI_LITE_1_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = S_AXI_LITE_1_BRESP;
  assign S_AXI_LITE_bvalid[0] = S_AXI_LITE_1_BVALID;
  assign S_AXI_LITE_rdata[31:0] = S_AXI_LITE_1_RDATA;
  assign S_AXI_LITE_rresp[1:0] = S_AXI_LITE_1_RRESP;
  assign S_AXI_LITE_rvalid[0] = S_AXI_LITE_1_RVALID;
  assign S_AXI_LITE_wready[0] = S_AXI_LITE_1_WREADY;
  assign axi_resetn_1 = axi_resetn;
  assign axi_s2mm_interconnect_M00_AXI_AWREADY = M00_AXI_awready;
  assign axi_s2mm_interconnect_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign axi_s2mm_interconnect_M00_AXI_BVALID = M00_AXI_bvalid;
  assign axi_s2mm_interconnect_M00_AXI_WREADY = M00_AXI_wready;
  assign s2mm_frame_ptr_out[5:0] = axi_vdma_s2mm_s2mm_frame_ptr_out;
  assign s2mm_interrupt = axi_vdma_s2mm_s2mm_introut;
  assign s_axi_lite_aclk_1 = s_axi_lite_aclk;
  assign s_axis_s2mm_aclk_1 = pix_clk;
  system_axi_interconnect_0_0 axi_s2mm_interconnect
       (.ACLK(ACLK_1),
        .ARESETN(ARESETN_1),
        .M00_ACLK(ACLK_1),
        .M00_ARESETN(S00_ARESETN_1),
        .M00_AXI_awaddr(axi_s2mm_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_s2mm_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_s2mm_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_s2mm_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_s2mm_interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_s2mm_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_s2mm_interconnect_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_s2mm_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_s2mm_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_s2mm_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_s2mm_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_s2mm_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_s2mm_interconnect_M00_AXI_BVALID),
        .M00_AXI_wdata(axi_s2mm_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_s2mm_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(axi_s2mm_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_s2mm_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_s2mm_interconnect_M00_AXI_WVALID),
        .S00_ACLK(ACLK_1),
        .S00_ARESETN(S00_ARESETN_1),
        .S00_AXI_awaddr(axi_vdma_s2mm_M_AXI_S2MM_AWADDR),
        .S00_AXI_awburst(axi_vdma_s2mm_M_AXI_S2MM_AWBURST),
        .S00_AXI_awcache(axi_vdma_s2mm_M_AXI_S2MM_AWCACHE),
        .S00_AXI_awlen(axi_vdma_s2mm_M_AXI_S2MM_AWLEN),
        .S00_AXI_awprot(axi_vdma_s2mm_M_AXI_S2MM_AWPROT),
        .S00_AXI_awready(axi_vdma_s2mm_M_AXI_S2MM_AWREADY),
        .S00_AXI_awsize(axi_vdma_s2mm_M_AXI_S2MM_AWSIZE),
        .S00_AXI_awvalid(axi_vdma_s2mm_M_AXI_S2MM_AWVALID),
        .S00_AXI_bready(axi_vdma_s2mm_M_AXI_S2MM_BREADY),
        .S00_AXI_bresp(axi_vdma_s2mm_M_AXI_S2MM_BRESP),
        .S00_AXI_bvalid(axi_vdma_s2mm_M_AXI_S2MM_BVALID),
        .S00_AXI_wdata(axi_vdma_s2mm_M_AXI_S2MM_WDATA),
        .S00_AXI_wlast(axi_vdma_s2mm_M_AXI_S2MM_WLAST),
        .S00_AXI_wready(axi_vdma_s2mm_M_AXI_S2MM_WREADY),
        .S00_AXI_wstrb(axi_vdma_s2mm_M_AXI_S2MM_WSTRB),
        .S00_AXI_wvalid(axi_vdma_s2mm_M_AXI_S2MM_WVALID));
  system_axi_vdma_0_0 axi_vdma_s2mm
       (.axi_resetn(axi_resetn_1),
        .m_axi_s2mm_aclk(ACLK_1),
        .m_axi_s2mm_awaddr(axi_vdma_s2mm_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_vdma_s2mm_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_vdma_s2mm_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_vdma_s2mm_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_vdma_s2mm_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_vdma_s2mm_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_vdma_s2mm_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_vdma_s2mm_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_vdma_s2mm_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_vdma_s2mm_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_vdma_s2mm_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_vdma_s2mm_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_vdma_s2mm_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_vdma_s2mm_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_vdma_s2mm_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_vdma_s2mm_M_AXI_S2MM_WVALID),
        .s2mm_frame_ptr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s2mm_frame_ptr_out(axi_vdma_s2mm_s2mm_frame_ptr_out),
        .s2mm_introut(axi_vdma_s2mm_s2mm_introut),
        .s_axi_lite_aclk(s_axi_lite_aclk_1),
        .s_axi_lite_araddr(S_AXI_LITE_1_ARADDR[8:0]),
        .s_axi_lite_arready(S_AXI_LITE_1_ARREADY),
        .s_axi_lite_arvalid(S_AXI_LITE_1_ARVALID),
        .s_axi_lite_awaddr(S_AXI_LITE_1_AWADDR[8:0]),
        .s_axi_lite_awready(S_AXI_LITE_1_AWREADY),
        .s_axi_lite_awvalid(S_AXI_LITE_1_AWVALID),
        .s_axi_lite_bready(S_AXI_LITE_1_BREADY),
        .s_axi_lite_bresp(S_AXI_LITE_1_BRESP),
        .s_axi_lite_bvalid(S_AXI_LITE_1_BVALID),
        .s_axi_lite_rdata(S_AXI_LITE_1_RDATA),
        .s_axi_lite_rready(S_AXI_LITE_1_RREADY),
        .s_axi_lite_rresp(S_AXI_LITE_1_RRESP),
        .s_axi_lite_rvalid(S_AXI_LITE_1_RVALID),
        .s_axi_lite_wdata(S_AXI_LITE_1_WDATA),
        .s_axi_lite_wready(S_AXI_LITE_1_WREADY),
        .s_axi_lite_wvalid(S_AXI_LITE_1_WVALID),
        .s_axis_s2mm_aclk(s_axis_s2mm_aclk_1),
        .s_axis_s2mm_tdata(Conn1_TDATA),
        .s_axis_s2mm_tkeep(Conn1_TKEEP),
        .s_axis_s2mm_tlast(Conn1_TLAST),
        .s_axis_s2mm_tready(Conn1_TREADY),
        .s_axis_s2mm_tuser(Conn1_TUSER),
        .s_axis_s2mm_tvalid(Conn1_TVALID));
  system_ila_0_1 s2mm_ila
       (.clk(s_axis_s2mm_aclk_1),
        .probe0(axi_vdma_s2mm_s2mm_introut),
        .probe1(axi_vdma_s2mm_s2mm_frame_ptr_out));
endmodule

module vdma_out_mm2s_imp_6D1WXP
   (Interconnect_ACLK,
    Interconnect_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M_AXIS_MM2S_tdata,
    M_AXIS_MM2S_tkeep,
    M_AXIS_MM2S_tlast,
    M_AXIS_MM2S_tready,
    M_AXIS_MM2S_tuser,
    M_AXIS_MM2S_tvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    axi_resetn,
    mm2s_frame_ptr_in,
    periphera_ARESETN,
    pix_clk,
    s_axi_lite_aclk);
  input Interconnect_ACLK;
  input Interconnect_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M_AXIS_MM2S_tdata;
  output [3:0]M_AXIS_MM2S_tkeep;
  output M_AXIS_MM2S_tlast;
  input M_AXIS_MM2S_tready;
  output [0:0]M_AXIS_MM2S_tuser;
  output M_AXIS_MM2S_tvalid;
  input [31:0]S_AXI_LITE_araddr;
  output [0:0]S_AXI_LITE_arready;
  input [0:0]S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output [0:0]S_AXI_LITE_awready;
  input [0:0]S_AXI_LITE_awvalid;
  input [0:0]S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output [0:0]S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input [0:0]S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output [0:0]S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output [0:0]S_AXI_LITE_wready;
  input [0:0]S_AXI_LITE_wvalid;
  input axi_resetn;
  input [5:0]mm2s_frame_ptr_in;
  input periphera_ARESETN;
  input pix_clk;
  input s_axi_lite_aclk;

  wire ACLK_1;
  wire ARESETN_1;
  wire M00_ARESETN_1;
  wire [31:0]S_AXI_LITE_1_ARADDR;
  wire S_AXI_LITE_1_ARREADY;
  wire [0:0]S_AXI_LITE_1_ARVALID;
  wire [31:0]S_AXI_LITE_1_AWADDR;
  wire S_AXI_LITE_1_AWREADY;
  wire [0:0]S_AXI_LITE_1_AWVALID;
  wire [0:0]S_AXI_LITE_1_BREADY;
  wire [1:0]S_AXI_LITE_1_BRESP;
  wire S_AXI_LITE_1_BVALID;
  wire [31:0]S_AXI_LITE_1_RDATA;
  wire [0:0]S_AXI_LITE_1_RREADY;
  wire [1:0]S_AXI_LITE_1_RRESP;
  wire S_AXI_LITE_1_RVALID;
  wire [31:0]S_AXI_LITE_1_WDATA;
  wire S_AXI_LITE_1_WREADY;
  wire [0:0]S_AXI_LITE_1_WVALID;
  wire [31:0]axi_mm2s_interconnect_M00_AXI_ARADDR;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_ARBURST;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARCACHE;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARLEN;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_ARLOCK;
  wire [2:0]axi_mm2s_interconnect_M00_AXI_ARPROT;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARQOS;
  wire axi_mm2s_interconnect_M00_AXI_ARREADY;
  wire [2:0]axi_mm2s_interconnect_M00_AXI_ARSIZE;
  wire axi_mm2s_interconnect_M00_AXI_ARVALID;
  wire [63:0]axi_mm2s_interconnect_M00_AXI_RDATA;
  wire axi_mm2s_interconnect_M00_AXI_RLAST;
  wire axi_mm2s_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_RRESP;
  wire axi_mm2s_interconnect_M00_AXI_RVALID;
  wire axi_resetn_1;
  wire [31:0]axi_vdma_mm2s_M_AXIS_MM2S_TDATA;
  wire [3:0]axi_vdma_mm2s_M_AXIS_MM2S_TKEEP;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TLAST;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TREADY;
  wire [0:0]axi_vdma_mm2s_M_AXIS_MM2S_TUSER;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_vdma_mm2s_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_vdma_mm2s_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_vdma_mm2s_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_vdma_mm2s_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_vdma_mm2s_M_AXI_MM2S_ARPROT;
  wire axi_vdma_mm2s_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_vdma_mm2s_M_AXI_MM2S_ARSIZE;
  wire axi_vdma_mm2s_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_vdma_mm2s_M_AXI_MM2S_RDATA;
  wire axi_vdma_mm2s_M_AXI_MM2S_RLAST;
  wire axi_vdma_mm2s_M_AXI_MM2S_RREADY;
  wire [1:0]axi_vdma_mm2s_M_AXI_MM2S_RRESP;
  wire axi_vdma_mm2s_M_AXI_MM2S_RVALID;
  wire [5:0]axi_vdma_mm2s_mm2s_frame_ptr_out;
  wire axi_vdma_mm2s_mm2s_introut;
  wire m_axis_mm2s_aclk_1;
  wire [5:0]mm2s_frame_ptr_in_1;
  wire s_axi_lite_aclk_1;

  assign ACLK_1 = Interconnect_ACLK;
  assign ARESETN_1 = Interconnect_ARESETN;
  assign M00_ARESETN_1 = periphera_ARESETN;
  assign M00_AXI_araddr[31:0] = axi_mm2s_interconnect_M00_AXI_ARADDR;
  assign M00_AXI_arburst[1:0] = axi_mm2s_interconnect_M00_AXI_ARBURST;
  assign M00_AXI_arcache[3:0] = axi_mm2s_interconnect_M00_AXI_ARCACHE;
  assign M00_AXI_arlen[3:0] = axi_mm2s_interconnect_M00_AXI_ARLEN;
  assign M00_AXI_arlock[1:0] = axi_mm2s_interconnect_M00_AXI_ARLOCK;
  assign M00_AXI_arprot[2:0] = axi_mm2s_interconnect_M00_AXI_ARPROT;
  assign M00_AXI_arqos[3:0] = axi_mm2s_interconnect_M00_AXI_ARQOS;
  assign M00_AXI_arsize[2:0] = axi_mm2s_interconnect_M00_AXI_ARSIZE;
  assign M00_AXI_arvalid = axi_mm2s_interconnect_M00_AXI_ARVALID;
  assign M00_AXI_rready = axi_mm2s_interconnect_M00_AXI_RREADY;
  assign M_AXIS_MM2S_tdata[31:0] = axi_vdma_mm2s_M_AXIS_MM2S_TDATA;
  assign M_AXIS_MM2S_tkeep[3:0] = axi_vdma_mm2s_M_AXIS_MM2S_TKEEP;
  assign M_AXIS_MM2S_tlast = axi_vdma_mm2s_M_AXIS_MM2S_TLAST;
  assign M_AXIS_MM2S_tuser[0] = axi_vdma_mm2s_M_AXIS_MM2S_TUSER;
  assign M_AXIS_MM2S_tvalid = axi_vdma_mm2s_M_AXIS_MM2S_TVALID;
  assign S_AXI_LITE_1_ARADDR = S_AXI_LITE_araddr[31:0];
  assign S_AXI_LITE_1_ARVALID = S_AXI_LITE_arvalid[0];
  assign S_AXI_LITE_1_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign S_AXI_LITE_1_AWVALID = S_AXI_LITE_awvalid[0];
  assign S_AXI_LITE_1_BREADY = S_AXI_LITE_bready[0];
  assign S_AXI_LITE_1_RREADY = S_AXI_LITE_rready[0];
  assign S_AXI_LITE_1_WDATA = S_AXI_LITE_wdata[31:0];
  assign S_AXI_LITE_1_WVALID = S_AXI_LITE_wvalid[0];
  assign S_AXI_LITE_arready[0] = S_AXI_LITE_1_ARREADY;
  assign S_AXI_LITE_awready[0] = S_AXI_LITE_1_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = S_AXI_LITE_1_BRESP;
  assign S_AXI_LITE_bvalid[0] = S_AXI_LITE_1_BVALID;
  assign S_AXI_LITE_rdata[31:0] = S_AXI_LITE_1_RDATA;
  assign S_AXI_LITE_rresp[1:0] = S_AXI_LITE_1_RRESP;
  assign S_AXI_LITE_rvalid[0] = S_AXI_LITE_1_RVALID;
  assign S_AXI_LITE_wready[0] = S_AXI_LITE_1_WREADY;
  assign axi_mm2s_interconnect_M00_AXI_ARREADY = M00_AXI_arready;
  assign axi_mm2s_interconnect_M00_AXI_RDATA = M00_AXI_rdata[63:0];
  assign axi_mm2s_interconnect_M00_AXI_RLAST = M00_AXI_rlast;
  assign axi_mm2s_interconnect_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign axi_mm2s_interconnect_M00_AXI_RVALID = M00_AXI_rvalid;
  assign axi_resetn_1 = axi_resetn;
  assign axi_vdma_mm2s_M_AXIS_MM2S_TREADY = M_AXIS_MM2S_tready;
  assign m_axis_mm2s_aclk_1 = pix_clk;
  assign mm2s_frame_ptr_in_1 = mm2s_frame_ptr_in[5:0];
  assign s_axi_lite_aclk_1 = s_axi_lite_aclk;
  system_axi_interconnect_0_1 axi_mm2s_interconnect
       (.ACLK(ACLK_1),
        .ARESETN(ARESETN_1),
        .M00_ACLK(ACLK_1),
        .M00_ARESETN(M00_ARESETN_1),
        .M00_AXI_araddr(axi_mm2s_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mm2s_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mm2s_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_mm2s_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mm2s_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mm2s_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mm2s_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mm2s_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mm2s_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mm2s_interconnect_M00_AXI_ARVALID),
        .M00_AXI_rdata(axi_mm2s_interconnect_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_mm2s_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mm2s_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mm2s_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mm2s_interconnect_M00_AXI_RVALID),
        .S00_ACLK(ACLK_1),
        .S00_ARESETN(M00_ARESETN_1),
        .S00_AXI_araddr(axi_vdma_mm2s_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_vdma_mm2s_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_vdma_mm2s_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_vdma_mm2s_M_AXI_MM2S_ARLEN),
        .S00_AXI_arprot(axi_vdma_mm2s_M_AXI_MM2S_ARPROT),
        .S00_AXI_arready(axi_vdma_mm2s_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_vdma_mm2s_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_vdma_mm2s_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_vdma_mm2s_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_vdma_mm2s_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_vdma_mm2s_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_vdma_mm2s_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_vdma_mm2s_M_AXI_MM2S_RVALID));
  system_axi_vdma_0_1 axi_vdma_mm2s
       (.axi_resetn(axi_resetn_1),
        .m_axi_mm2s_aclk(ACLK_1),
        .m_axi_mm2s_araddr(axi_vdma_mm2s_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_vdma_mm2s_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_vdma_mm2s_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_vdma_mm2s_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_vdma_mm2s_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_vdma_mm2s_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_vdma_mm2s_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_vdma_mm2s_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_vdma_mm2s_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_vdma_mm2s_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_vdma_mm2s_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_vdma_mm2s_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_vdma_mm2s_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_aclk(m_axis_mm2s_aclk_1),
        .m_axis_mm2s_tdata(axi_vdma_mm2s_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tkeep(axi_vdma_mm2s_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_vdma_mm2s_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_vdma_mm2s_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tuser(axi_vdma_mm2s_M_AXIS_MM2S_TUSER),
        .m_axis_mm2s_tvalid(axi_vdma_mm2s_M_AXIS_MM2S_TVALID),
        .mm2s_frame_ptr_in(mm2s_frame_ptr_in_1),
        .mm2s_frame_ptr_out(axi_vdma_mm2s_mm2s_frame_ptr_out),
        .mm2s_introut(axi_vdma_mm2s_mm2s_introut),
        .s_axi_lite_aclk(s_axi_lite_aclk_1),
        .s_axi_lite_araddr(S_AXI_LITE_1_ARADDR[8:0]),
        .s_axi_lite_arready(S_AXI_LITE_1_ARREADY),
        .s_axi_lite_arvalid(S_AXI_LITE_1_ARVALID),
        .s_axi_lite_awaddr(S_AXI_LITE_1_AWADDR[8:0]),
        .s_axi_lite_awready(S_AXI_LITE_1_AWREADY),
        .s_axi_lite_awvalid(S_AXI_LITE_1_AWVALID),
        .s_axi_lite_bready(S_AXI_LITE_1_BREADY),
        .s_axi_lite_bresp(S_AXI_LITE_1_BRESP),
        .s_axi_lite_bvalid(S_AXI_LITE_1_BVALID),
        .s_axi_lite_rdata(S_AXI_LITE_1_RDATA),
        .s_axi_lite_rready(S_AXI_LITE_1_RREADY),
        .s_axi_lite_rresp(S_AXI_LITE_1_RRESP),
        .s_axi_lite_rvalid(S_AXI_LITE_1_RVALID),
        .s_axi_lite_wdata(S_AXI_LITE_1_WDATA),
        .s_axi_lite_wready(S_AXI_LITE_1_WREADY),
        .s_axi_lite_wvalid(S_AXI_LITE_1_WVALID));
  system_ila_0_0 mm2s_ila
       (.clk(m_axis_mm2s_aclk_1),
        .probe0(axi_vdma_mm2s_mm2s_introut),
        .probe1(axi_vdma_mm2s_mm2s_frame_ptr_out));
endmodule

module vdma_out_mm2s_user_imp_S2M99
   (Interconnect_ACLK,
    Interconnect_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M_AXIS_MM2S_tdata,
    M_AXIS_MM2S_tkeep,
    M_AXIS_MM2S_tlast,
    M_AXIS_MM2S_tready,
    M_AXIS_MM2S_tuser,
    M_AXIS_MM2S_tvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    axi_resetn,
    mm2s_frame_ptr_in,
    periphera_ARESETN,
    pix_clk,
    s_axi_lite_aclk);
  input Interconnect_ACLK;
  input Interconnect_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M_AXIS_MM2S_tdata;
  output [3:0]M_AXIS_MM2S_tkeep;
  output M_AXIS_MM2S_tlast;
  input M_AXIS_MM2S_tready;
  output [0:0]M_AXIS_MM2S_tuser;
  output M_AXIS_MM2S_tvalid;
  input [31:0]S_AXI_LITE_araddr;
  output S_AXI_LITE_arready;
  input S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output S_AXI_LITE_awready;
  input S_AXI_LITE_awvalid;
  input S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output S_AXI_LITE_wready;
  input S_AXI_LITE_wvalid;
  input axi_resetn;
  input [5:0]mm2s_frame_ptr_in;
  input periphera_ARESETN;
  input pix_clk;
  input s_axi_lite_aclk;

  wire ACLK_1;
  wire ARESETN_1;
  wire M00_ARESETN_1;
  wire [31:0]S_AXI_LITE_1_ARADDR;
  wire S_AXI_LITE_1_ARREADY;
  wire S_AXI_LITE_1_ARVALID;
  wire [31:0]S_AXI_LITE_1_AWADDR;
  wire S_AXI_LITE_1_AWREADY;
  wire S_AXI_LITE_1_AWVALID;
  wire S_AXI_LITE_1_BREADY;
  wire [1:0]S_AXI_LITE_1_BRESP;
  wire S_AXI_LITE_1_BVALID;
  wire [31:0]S_AXI_LITE_1_RDATA;
  wire S_AXI_LITE_1_RREADY;
  wire [1:0]S_AXI_LITE_1_RRESP;
  wire S_AXI_LITE_1_RVALID;
  wire [31:0]S_AXI_LITE_1_WDATA;
  wire S_AXI_LITE_1_WREADY;
  wire S_AXI_LITE_1_WVALID;
  wire [31:0]axi_mm2s_interconnect_M00_AXI_ARADDR;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_ARBURST;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARCACHE;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARLEN;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_ARLOCK;
  wire [2:0]axi_mm2s_interconnect_M00_AXI_ARPROT;
  wire [3:0]axi_mm2s_interconnect_M00_AXI_ARQOS;
  wire axi_mm2s_interconnect_M00_AXI_ARREADY;
  wire [2:0]axi_mm2s_interconnect_M00_AXI_ARSIZE;
  wire axi_mm2s_interconnect_M00_AXI_ARVALID;
  wire [63:0]axi_mm2s_interconnect_M00_AXI_RDATA;
  wire axi_mm2s_interconnect_M00_AXI_RLAST;
  wire axi_mm2s_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_mm2s_interconnect_M00_AXI_RRESP;
  wire axi_mm2s_interconnect_M00_AXI_RVALID;
  wire axi_resetn_1;
  wire [31:0]axi_vdma_mm2s_M_AXIS_MM2S_TDATA;
  wire [3:0]axi_vdma_mm2s_M_AXIS_MM2S_TKEEP;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TLAST;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TREADY;
  wire [0:0]axi_vdma_mm2s_M_AXIS_MM2S_TUSER;
  wire axi_vdma_mm2s_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_vdma_mm2s_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_vdma_mm2s_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_vdma_mm2s_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_vdma_mm2s_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_vdma_mm2s_M_AXI_MM2S_ARPROT;
  wire axi_vdma_mm2s_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_vdma_mm2s_M_AXI_MM2S_ARSIZE;
  wire axi_vdma_mm2s_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_vdma_mm2s_M_AXI_MM2S_RDATA;
  wire axi_vdma_mm2s_M_AXI_MM2S_RLAST;
  wire axi_vdma_mm2s_M_AXI_MM2S_RREADY;
  wire [1:0]axi_vdma_mm2s_M_AXI_MM2S_RRESP;
  wire axi_vdma_mm2s_M_AXI_MM2S_RVALID;
  wire [5:0]axi_vdma_mm2s_mm2s_frame_ptr_out;
  wire axi_vdma_mm2s_mm2s_introut;
  wire m_axis_mm2s_aclk_1;
  wire [5:0]mm2s_frame_ptr_in_1;
  wire s_axi_lite_aclk_1;

  assign ACLK_1 = Interconnect_ACLK;
  assign ARESETN_1 = Interconnect_ARESETN;
  assign M00_ARESETN_1 = periphera_ARESETN;
  assign M00_AXI_araddr[31:0] = axi_mm2s_interconnect_M00_AXI_ARADDR;
  assign M00_AXI_arburst[1:0] = axi_mm2s_interconnect_M00_AXI_ARBURST;
  assign M00_AXI_arcache[3:0] = axi_mm2s_interconnect_M00_AXI_ARCACHE;
  assign M00_AXI_arlen[3:0] = axi_mm2s_interconnect_M00_AXI_ARLEN;
  assign M00_AXI_arlock[1:0] = axi_mm2s_interconnect_M00_AXI_ARLOCK;
  assign M00_AXI_arprot[2:0] = axi_mm2s_interconnect_M00_AXI_ARPROT;
  assign M00_AXI_arqos[3:0] = axi_mm2s_interconnect_M00_AXI_ARQOS;
  assign M00_AXI_arsize[2:0] = axi_mm2s_interconnect_M00_AXI_ARSIZE;
  assign M00_AXI_arvalid = axi_mm2s_interconnect_M00_AXI_ARVALID;
  assign M00_AXI_rready = axi_mm2s_interconnect_M00_AXI_RREADY;
  assign M_AXIS_MM2S_tdata[31:0] = axi_vdma_mm2s_M_AXIS_MM2S_TDATA;
  assign M_AXIS_MM2S_tkeep[3:0] = axi_vdma_mm2s_M_AXIS_MM2S_TKEEP;
  assign M_AXIS_MM2S_tlast = axi_vdma_mm2s_M_AXIS_MM2S_TLAST;
  assign M_AXIS_MM2S_tuser[0] = axi_vdma_mm2s_M_AXIS_MM2S_TUSER;
  assign M_AXIS_MM2S_tvalid = axi_vdma_mm2s_M_AXIS_MM2S_TVALID;
  assign S_AXI_LITE_1_ARADDR = S_AXI_LITE_araddr[31:0];
  assign S_AXI_LITE_1_ARVALID = S_AXI_LITE_arvalid;
  assign S_AXI_LITE_1_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign S_AXI_LITE_1_AWVALID = S_AXI_LITE_awvalid;
  assign S_AXI_LITE_1_BREADY = S_AXI_LITE_bready;
  assign S_AXI_LITE_1_RREADY = S_AXI_LITE_rready;
  assign S_AXI_LITE_1_WDATA = S_AXI_LITE_wdata[31:0];
  assign S_AXI_LITE_1_WVALID = S_AXI_LITE_wvalid;
  assign S_AXI_LITE_arready = S_AXI_LITE_1_ARREADY;
  assign S_AXI_LITE_awready = S_AXI_LITE_1_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = S_AXI_LITE_1_BRESP;
  assign S_AXI_LITE_bvalid = S_AXI_LITE_1_BVALID;
  assign S_AXI_LITE_rdata[31:0] = S_AXI_LITE_1_RDATA;
  assign S_AXI_LITE_rresp[1:0] = S_AXI_LITE_1_RRESP;
  assign S_AXI_LITE_rvalid = S_AXI_LITE_1_RVALID;
  assign S_AXI_LITE_wready = S_AXI_LITE_1_WREADY;
  assign axi_mm2s_interconnect_M00_AXI_ARREADY = M00_AXI_arready;
  assign axi_mm2s_interconnect_M00_AXI_RDATA = M00_AXI_rdata[63:0];
  assign axi_mm2s_interconnect_M00_AXI_RLAST = M00_AXI_rlast;
  assign axi_mm2s_interconnect_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign axi_mm2s_interconnect_M00_AXI_RVALID = M00_AXI_rvalid;
  assign axi_resetn_1 = axi_resetn;
  assign axi_vdma_mm2s_M_AXIS_MM2S_TREADY = M_AXIS_MM2S_tready;
  assign m_axis_mm2s_aclk_1 = pix_clk;
  assign mm2s_frame_ptr_in_1 = mm2s_frame_ptr_in[5:0];
  assign s_axi_lite_aclk_1 = s_axi_lite_aclk;
  system_axi_mm2s_interconnect_0 axi_mm2s_interconnect
       (.ACLK(ACLK_1),
        .ARESETN(ARESETN_1),
        .M00_ACLK(ACLK_1),
        .M00_ARESETN(M00_ARESETN_1),
        .M00_AXI_araddr(axi_mm2s_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mm2s_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mm2s_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_mm2s_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mm2s_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mm2s_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mm2s_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mm2s_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mm2s_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mm2s_interconnect_M00_AXI_ARVALID),
        .M00_AXI_rdata(axi_mm2s_interconnect_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_mm2s_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mm2s_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mm2s_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mm2s_interconnect_M00_AXI_RVALID),
        .S00_ACLK(ACLK_1),
        .S00_ARESETN(M00_ARESETN_1),
        .S00_AXI_araddr(axi_vdma_mm2s_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_vdma_mm2s_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_vdma_mm2s_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_vdma_mm2s_M_AXI_MM2S_ARLEN),
        .S00_AXI_arprot(axi_vdma_mm2s_M_AXI_MM2S_ARPROT),
        .S00_AXI_arready(axi_vdma_mm2s_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_vdma_mm2s_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_vdma_mm2s_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_vdma_mm2s_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_vdma_mm2s_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_vdma_mm2s_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_vdma_mm2s_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_vdma_mm2s_M_AXI_MM2S_RVALID));
  system_axi_vdma_mm2s_0 axi_vdma_mm2s
       (.axi_resetn(axi_resetn_1),
        .m_axi_mm2s_aclk(ACLK_1),
        .m_axi_mm2s_araddr(axi_vdma_mm2s_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_vdma_mm2s_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_vdma_mm2s_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_vdma_mm2s_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_vdma_mm2s_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_vdma_mm2s_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_vdma_mm2s_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_vdma_mm2s_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_vdma_mm2s_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_vdma_mm2s_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_vdma_mm2s_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_vdma_mm2s_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_vdma_mm2s_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_aclk(m_axis_mm2s_aclk_1),
        .m_axis_mm2s_tdata(axi_vdma_mm2s_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tkeep(axi_vdma_mm2s_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_vdma_mm2s_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_vdma_mm2s_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tuser(axi_vdma_mm2s_M_AXIS_MM2S_TUSER),
        .m_axis_mm2s_tvalid(axi_vdma_mm2s_M_AXIS_MM2S_TVALID),
        .mm2s_frame_ptr_in(mm2s_frame_ptr_in_1),
        .mm2s_frame_ptr_out(axi_vdma_mm2s_mm2s_frame_ptr_out),
        .mm2s_introut(axi_vdma_mm2s_mm2s_introut),
        .s_axi_lite_aclk(s_axi_lite_aclk_1),
        .s_axi_lite_araddr(S_AXI_LITE_1_ARADDR[8:0]),
        .s_axi_lite_arready(S_AXI_LITE_1_ARREADY),
        .s_axi_lite_arvalid(S_AXI_LITE_1_ARVALID),
        .s_axi_lite_awaddr(S_AXI_LITE_1_AWADDR[8:0]),
        .s_axi_lite_awready(S_AXI_LITE_1_AWREADY),
        .s_axi_lite_awvalid(S_AXI_LITE_1_AWVALID),
        .s_axi_lite_bready(S_AXI_LITE_1_BREADY),
        .s_axi_lite_bresp(S_AXI_LITE_1_BRESP),
        .s_axi_lite_bvalid(S_AXI_LITE_1_BVALID),
        .s_axi_lite_rdata(S_AXI_LITE_1_RDATA),
        .s_axi_lite_rready(S_AXI_LITE_1_RREADY),
        .s_axi_lite_rresp(S_AXI_LITE_1_RRESP),
        .s_axi_lite_rvalid(S_AXI_LITE_1_RVALID),
        .s_axi_lite_wdata(S_AXI_LITE_1_WDATA),
        .s_axi_lite_wready(S_AXI_LITE_1_WREADY),
        .s_axi_lite_wvalid(S_AXI_LITE_1_WVALID));
  system_mm2s_ila_0 mm2s_ila
       (.clk(m_axis_mm2s_aclk_1),
        .probe0(axi_vdma_mm2s_mm2s_introut),
        .probe1(axi_vdma_mm2s_mm2s_frame_ptr_out));
endmodule
