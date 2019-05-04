`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/07/01 17:01:51
// Design Name: 
// Module Name: v_in_crop_scale_axis
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


  module v_in_crop_scale_axis #(
    parameter integer DATA_WIDTH    = 16
  ) 
  (
    input  wire                     vclk,               // video clock
    input  wire                     aclk,               // axis clock
    input  wire                     resetn,             // video input resetn
    input  wire						 c_s_sel,			 // c_s_sel: 0=cropping, 1=scaling
    
    input  wire                     vid_vblank,         // video vertical blank
    input  wire                     vid_vsync,          // video vertical sync
    input  wire                     vid_hblank,         // video horizontal blank
    input  wire                     vid_hsync,          // video horizontal sync
    input  wire                     vid_active_video,   // video data enable
    input  wire [DATA_WIDTH-1:0]    vid_data,           // video data
    input  wire                     field_id_in,        // field_id in
    
    output wire [DATA_WIDTH-1:0]    m_axis_tdata,       // axis M data
    output wire [DATA_WIDTH/8-1:0]  m_axis_tkeep,       // axis M keep
    output wire                     m_axis_tlast,       // axis M end of line
    input  wire                     m_axis_tready,      // axis M ready 
    output wire                     m_axis_tuser,       // axis M user(sof) 
    output wire                     m_axis_tvalid,      // axis M valid 
    
    output wire                     vtd_vblank,         // vtiming vblank
    output wire                     vtd_vsync,          // vtiming vsync
    output wire                     vtd_hblank,         // vtiming hblank
    output wire                     vtd_hsync,          // vtiming hsync
    output wire                     vtd_active_video,   // vtiming active_video
    output wire                     field_id_out,       // field_id out   
    output wire                     axis_enable,        // axi stream enable
    output wire                     c_s_sel_f,          // 0: crop, 1: scale per frame unit  
    
    output wire [15:0]              i_HSIZE,            // input H_SIZE, Debugging for Test 
    output wire [15:0]              o_HSIZE             // output H_SIZE, Debugging for Test       
  );

  reg                       vrst = 1'b0;
  reg                       arst = 1'b0;
  reg  [15:0]               d_vrst = 16'h0000;
  reg  [15:0]               d_arst = 16'h0000;
  wire                      vreset;
  wire                      areset;
  wire                      reset;
  
  reg                       d_video_vsync = 1'b0;          
  reg                       d_active_video = 1'b0;          
  reg [DATA_WIDTH-1:0]      d_video_data = {DATA_WIDTH{1'b0}};
  reg [15:0]                d_empty = 16'hffff;
  reg                       c_vert_bp = 1'b0;   // cropping vertical back porch
  reg                       s_vert_bp = 1'b0;   // scaling vertical back porch
  reg                       s_enable = 1'b0;    // exis_enable
  reg                       d_rd_sof = 1'b0;      
  reg                       d_rd_eol = 1'b0;
  reg                       d_wr_sof = 1'b0;
  reg [DATA_WIDTH/8-1:0]    d_rd_keep = {DATA_WIDTH/8{1'b0}};

  wire                      det_vsync;          // video sync timing detect
  wire                      vsync_falling;      // vsync falling
  wire                      c_de_rising;        // de_rising for cropping
  wire                      s_de_rising;        // de_rising for scaling
  wire                      c_v_de;             // de for cropping
  wire                      s_v_de;             // de for scaling
  wire                      s_eol_de;           // de for scaling eol

  reg                       r_c_s_sel = 1'b0;
  reg                       r_c_s_sel_sync;
  reg  [15:0]               c_pcnt = 16'd0;     // cropping pixel count
  reg  [2:0]                s_pcnt =  3'd0;     // scaling pixel count
  
  reg  [3:0]                d_c_v_de;
  reg  [3:0]                d_c_v_sof;
  reg  [3:0]                d_c_v_eol;
  reg  [DATA_WIDTH-1:0]     d_c_v_data_0;
  reg  [DATA_WIDTH-1:0]     d_c_v_data_1;
  reg  [DATA_WIDTH-1:0]     d_c_v_data_2;
  reg  [DATA_WIDTH-1:0]     d_c_v_data_3;
  
  reg  [3:0]                d_s_v_de; 
  reg  [3:0]                d_s_eol_de;    
  reg  [3:0]                d_s_v_sof;
  reg  [3:0]                d_s_v_eol;
  reg  [DATA_WIDTH-1:0]     d_s_v_data_0;
  reg  [DATA_WIDTH-1:0]     d_s_v_data_1;
  reg  [DATA_WIDTH-1:0]     d_s_v_data_2;
  reg  [DATA_WIDTH-1:0]     d_s_v_data_3;

  wire                      c_wr_sof;           // cropping sof
  wire                      c_wr_eol;           // cropping eol
  wire                      s_wr_sof;           // scaling sof
  wire                      s_wr_eol;           // scaling eol

  wire                      v_de;
  wire                      v_sof;
  wire                      v_eol;
  wire [DATA_WIDTH-1:0]     v_data;
    
  wire                      wr_en;
  wire [33:0]               wr_data;            // {sof, eol, data}
  reg  [15:0]               wr_cnt = 16'h0000;
  
  wire                      rd_en;
  wire [33:0]               rd_data;            // (sof, eol, data}
  wire                      rd_sof;
  wire                      rd_eol;
  wire                      rd_en_t0;
  wire                      rd_en_t1;
  wire                      valid_t0;
  wire                      valid_t1;
  reg  [3:0]                d_rd_en_t0 = 4'b0000;
  reg  [3:0]                d_valid_t0 = 4'b0000;
  reg  [15:0]               rd_cnt = 16'h0000;

  wire                      empty;
  wire                      full;
  
  reg                       r_vtd_vblank       = 1'b0;
  reg                       r_vtd_vsync        = 1'b0;
  reg                       r_vtd_hblank       = 1'b0;
  reg                       r_vtd_hsync        = 1'b0;
  reg                       r_vtd_active_video = 1'b0;
  reg                       r_field_id_out     = 1'b0;
  
  assign c_s_sel_f = r_c_s_sel_sync;
  assign i_HSIZE = wr_cnt;
  assign o_HSIZE = rd_cnt;

  always @ (posedge aclk) begin
     r_c_s_sel_sync <= r_c_s_sel;
  end

  always @ (posedge vclk) begin
     if (vreset)
        wr_cnt <= 16'd0;
     else
        if (vid_active_video)
            wr_cnt <= wr_cnt + 1;
        else
            wr_cnt <= 16'd0;
  end

  always @ (posedge aclk) begin
     if (areset)
        rd_cnt <= 16'd0;
     else
        if (m_axis_tvalid && m_axis_tready)
            rd_cnt <= rd_cnt + 1;
        else
            rd_cnt <= rd_cnt;
  end

  always @( posedge vclk ) begin
     vrst  <= ~resetn;
     d_vrst <= {d_vrst[14:0], vrst};
  end
    
  always @( posedge aclk ) begin
     arst  <= ~resetn;
     d_arst <= {d_arst[14:0], arst};     
  end
  
  assign vreset = vrst | (vrst & ~d_vrst[7]);
  assign areset = arst | (arst & ~d_arst[7]);
  
  assign reset = vreset | areset;

  // detect vsync
  assign det_vsync = vid_vsync | vid_vblank;

  // c_s_sel
  always @( posedge vclk ) begin
     if (vreset)
        r_c_s_sel <= 1'b0;
     else if (vsync_falling)
        r_c_s_sel <= c_s_sel;     
  end

  always @ (posedge vclk) begin
     if (vreset || det_vsync) begin
         c_pcnt <= 16'd0;
         s_pcnt <=  3'd0;    
     end
     else begin
        if (vid_active_video) begin
            if (c_pcnt == 16'd0)
                c_pcnt <= c_pcnt + 1;                
            else if (c_pcnt >= 16'd1279)
                c_pcnt <= 16'd0;
            else
                c_pcnt <= c_pcnt + 1;
    
            if (s_pcnt == 3'd0)
                s_pcnt <= s_pcnt + 1;            
            else if (s_pcnt >= 3'd4)
                s_pcnt <= 3'd0;
            else
                s_pcnt <= s_pcnt + 1;            
        end
        else begin
            c_pcnt <= 16'd0;
            s_pcnt <=  3'd0;   
        end
     end
  end

  assign c_v_de   = (vid_active_video == 1'b1 && c_pcnt >= 16'd128 && c_pcnt <= 16'd1151) ? 1'b1 : 1'b0;
  assign s_v_de   = (vid_active_video == 1'b1 && s_pcnt >= 3'd0 && s_pcnt <= 3'd3) ? 1'b1 : 1'b0;
  assign s_eol_de = (s_v_de == 1'b1 && c_pcnt >= 16'd1275 && c_pcnt <= 16'd1279) ? 1'b1 : 1'b0;

  always @ ( posedge vclk ) begin 
    if (vreset) begin
        d_video_vsync <= 1'b0;

        d_c_v_de      <= 4'b0;
        d_c_v_sof     <= 4'b0;
        d_c_v_eol     <= 4'b0;
        d_c_v_data_0  <= {DATA_WIDTH{1'b0}};
        d_c_v_data_1  <= {DATA_WIDTH{1'b0}};
        d_c_v_data_2  <= {DATA_WIDTH{1'b0}};
        d_c_v_data_3  <= {DATA_WIDTH{1'b0}};
        
        d_s_v_de      <= 4'b0;
        d_s_eol_de    <= 4'b0;
        d_s_v_sof     <= 4'b0;
        d_s_v_eol     <= 4'b0;
        d_s_v_data_0  <= {DATA_WIDTH{1'b0}};
        d_s_v_data_1  <= {DATA_WIDTH{1'b0}};
        d_s_v_data_2  <= {DATA_WIDTH{1'b0}};
        d_s_v_data_3  <= {DATA_WIDTH{1'b0}};        
    end else begin
        d_video_vsync <= det_vsync;
        
        d_c_v_de      <= {d_c_v_de[2:0], c_v_de};
        d_c_v_sof     <= {d_c_v_sof[2:0], c_wr_sof};
        d_c_v_eol     <= {d_c_v_eol[2:0], c_wr_eol};
        d_c_v_data_0  <= vid_data;
        d_c_v_data_1  <= d_c_v_data_0;
        d_c_v_data_2  <= d_c_v_data_1;
        d_c_v_data_3  <= d_c_v_data_2;
        
        d_s_v_de      <= {d_s_v_de[2:0], s_v_de};
        d_s_eol_de    <= {d_s_eol_de[2:0], s_eol_de};
        d_s_v_sof     <= {d_s_v_sof[2:0], s_wr_sof};
        d_s_v_eol     <= {d_s_v_eol[2:0], s_wr_eol};
        d_s_v_data_0  <= vid_data;
        d_s_v_data_1  <= d_s_v_data_0;
        d_s_v_data_2  <= d_s_v_data_1;
        d_s_v_data_3  <= d_s_v_data_2;
    end 
  end 

  assign vsync_falling = ~det_vsync & d_video_vsync;
  assign c_de_rising   = c_v_de & ~d_c_v_de[0];
  assign s_de_rising   = s_v_de & ~d_s_v_de[0];

  // Vertical sync back porch
  always @ (posedge vclk) begin
     if (vreset) begin
         c_vert_bp <= 1'b0;
         s_vert_bp <= 1'b0;
     end
     else begin
        if (vsync_falling) begin    // falling edge of vsync
            c_vert_bp <= 1'b1;
            s_vert_bp <= 1'b1;
        end
        else begin
            if (c_de_rising)        // cropping rising edge of data enable
                c_vert_bp <= 1'b0;
            if (s_de_rising)        // scaling rising edge of data enable
                s_vert_bp <= 1'b0;
        end
     end   
  end

  assign c_wr_sof = c_de_rising & c_vert_bp;  // cropping start of Frame(first pixel data start of each frame(vsync))
  assign s_wr_sof = s_de_rising & s_vert_bp;  // scaling start of Frame(first pixel data start of each frame(vsync))
  assign c_wr_eol = ~c_v_de & d_c_v_de[0];
  assign s_wr_eol = ~s_eol_de & d_s_eol_de[0]; 

  // gen. axi stream enable
  always @ (posedge vclk) begin
     if (vreset)
         s_enable <= 1'b0;
     else if (vsync_falling)        // falling edge of vsync
         s_enable <= 1'b1;
  end

  assign axis_enable = s_enable;    // added 2016. 08. 05

  assign v_de   = (r_c_s_sel == 1'b0) ?  d_c_v_de[0]  : d_s_v_de[0];
  assign v_sof  = (r_c_s_sel == 1'b0) ?  d_c_v_sof[0] : d_s_v_sof[0];
  assign v_data = (r_c_s_sel == 1'b0) ?  d_c_v_data_0 : d_s_v_data_0;
  assign v_eol  = (r_c_s_sel == 1'b0) ?  c_wr_eol     : s_wr_eol;
  
  assign wr_en = v_de;

  generate begin: gen_fifo_wr_data
    if (DATA_WIDTH == 8) begin 
        assign wr_data = {v_sof, v_eol, {24'h000000, v_data[DATA_WIDTH-1:0]}};    
    end  
    else if (DATA_WIDTH == 16) begin 
        assign wr_data = {v_sof, v_eol, {16'h0000, v_data[DATA_WIDTH-1:0]}};    
    end
    else if (DATA_WIDTH == 24) begin 
        assign wr_data = {v_sof, v_eol, {8'h00, v_data[DATA_WIDTH-1:0]}};    
    end
    else if (DATA_WIDTH == 32) begin
        assign wr_data = {v_sof, v_eol, v_data[DATA_WIDTH-1:0]};    
    end
  end
  endgenerate

  // vtiming out
  always @ ( posedge vclk ) begin
     if (vreset) begin
         r_vtd_vblank       <= 1'b1;
         r_vtd_vsync        <= 1'b1;
         r_vtd_hblank       <= 1'b0;
         r_vtd_hsync        <= 1'b0;
         r_vtd_active_video <= 1'b0;
         r_field_id_out     <= 1'b0;     
     end else begin
         r_vtd_vblank       <= vid_vblank;
         r_vtd_vsync        <= vid_vsync;
         r_vtd_hblank       <= vid_hblank;
         r_vtd_hsync        <= vid_hsync;
         r_vtd_active_video <= vid_active_video;
         r_field_id_out     <= field_id_in;
     end        
  end 

  assign vtd_vblank       = r_vtd_vblank;
  assign vtd_vsync        = r_vtd_vsync;
  assign vtd_hblank       = r_vtd_hblank;
  assign vtd_hsync        = r_vtd_hsync;
  assign vtd_active_video = r_vtd_active_video;
  assign field_id_out     = r_field_id_out;

  /*
   *  AXI Stream Clock (aclk)
   */
  always @ ( posedge aclk ) begin 
     if (areset) begin
         d_empty        <= 16'hffff;
         d_rd_en_t0     <= 4'b0000;
         d_valid_t0     <= 4'b0000;        
         d_rd_sof       <= 1'b0;
         d_rd_eol       <= 1'b0;
         d_rd_keep      <= {DATA_WIDTH/8{1'b0}};
     end else begin
         d_empty        <= {d_empty[14:0], empty};
         d_rd_en_t0     <= {d_rd_en_t0[2:0], rd_en_t0};    
         d_valid_t0     <= {d_valid_t0[2:0], valid_t0};        
         d_rd_sof       <= rd_data[33];  // rd_sof
         d_rd_eol       <= rd_data[32];  // rd_eol
         d_rd_keep      <= {DATA_WIDTH/8{1'b1}};
     end 
   end 

  assign rd_sof = rd_data[33] & ~d_rd_sof;    // sof - one pixel clock
  assign rd_eol = rd_data[32] & ~d_rd_eol;    // eol - one pixel clock

  assign rd_en_t0 = (!empty && !d_empty[0] &&  !d_empty[2] &&  !d_empty[4] &&  !d_empty[6] &&
                               !d_empty[8] && !d_empty[10] && !d_empty[12] && !d_empty[14]) ? 1'b1 : 1'b0;
//  assign rd_en_t0 = (!empty && !d_empty[0] && !d_empty[2] && !d_empty[4] && !d_empty[6] && !d_empty[8]) ? 1'b1 : 1'b0;

  assign rd_en_t1 = (m_axis_tready && rd_en_t0) ? 1'b1 : 1'b0;   
  assign rd_en = ((rd_en_t0 && !d_rd_en_t0[0]) || (d_rd_en_t0[0] && !d_rd_en_t0[1]) || rd_en_t1) ? 1'b1 : 1'b0;

  assign valid_t0 = (!d_empty[0] && !d_empty[1] &&  !d_empty[3] &&  !d_empty[5] &&  !d_empty[7] &&
                                    !d_empty[9] && !d_empty[11] && !d_empty[13] && !d_empty[15]) ? 1'b1 : 1'b0;
//  assign valid_t0 = (!d_empty[0] && !d_empty[1] && !d_empty[3] && !d_empty[5] && !d_empty[7] && !d_empty[9]) ? 1'b1 : 1'b0;
  
  assign valid_t1 = (m_axis_tready && valid_t0) ? 1'b1 : 1'b0; 
  assign m_axis_tvalid = ((valid_t0 && !d_valid_t0[0]) || (d_valid_t0[0] && !d_valid_t0[1]) || valid_t1) ? 1'b1 : 1'b0;   
  assign m_axis_tdata   = rd_data[DATA_WIDTH-1:0];  
  assign m_axis_tlast   = rd_data[32];  // eol(End of Line)
  assign m_axis_tuser   = rd_data[33];  // sof(Start of Frame(first pixel data start of each frame(vsync)))
  assign m_axis_tkeep   = d_rd_keep;

// Instance Standard FIFO
  axis_bridge_fifo axis_bridge_fifo_i (
    .rst              (reset),          // input wire rst
  
    .wr_clk           (vclk),           // input wire wr_clk
    .wr_en            (wr_en),          // input wire wr_en
    .din              (wr_data),        // input wire [33 : 0] din
    .full             (full),           // output wire full
      
    .rd_clk           (aclk),           // input wire rd_clk
    .rd_en            (rd_en),          // input wire rd_en
    .dout             (rd_data),        // output wire [33 : 0] dout
    .empty            (empty)           // output wire empty
  );
    
endmodule
