
`timescale 1 ns / 1 ps

	module frame_cnt_irq_gen_v1_0 #
	(
        // Users to add parameters here
        parameter          DATA_WIDTH   =   16,
        parameter          H_ACT        = 1280,
        parameter          V_ACT        =  720,
        // User parameters ends
        // Do not modify the parameters beyond this line


        // Parameters of Axi Slave Bus Interface S00_AXI
        parameter integer C_S00_AXI_DATA_WIDTH    = 32,
        parameter integer C_S00_AXI_ADDR_WIDTH    = 4
    )
    (
        // Users to add ports here
        input wire                      v_aclk,
        input wire                      rst,
            
        input wire                      enable,         // axis_enable
        input wire                      vsync,          // frame count
        input wire [5:0]                s2mm_frame_ptr,
        input wire [5:0]                mm2s_frame_ptr,

        input  wire [DATA_WIDTH-1:0]    s_axis_tdata,   // axis S data
        input  wire [DATA_WIDTH/8-1:0]  s_axis_tkeep,   // axis S data byte enable
        input  wire                     s_axis_tlast,   // axis S end of line
        output wire                     s_axis_tready,  // axis S ready 
        input  wire                     s_axis_tuser,   // axis S user(sof) 
        input  wire                     s_axis_tvalid,  // axis S valid
         
        output wire                     vdma_intr_out, 
        // User ports ends
        // Do not modify the ports beyond this line


        // Ports of Axi Slave Bus Interface S00_AXI
        input wire  s00_axi_aclk,
        input wire  s00_axi_aresetn,
        input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
        input wire [2 : 0] s00_axi_awprot,
        input wire  s00_axi_awvalid,
        output wire  s00_axi_awready,
        input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
        input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
        input wire  s00_axi_wvalid,
        output wire  s00_axi_wready,
        output wire [1 : 0] s00_axi_bresp,
        output wire  s00_axi_bvalid,
        input wire  s00_axi_bready,
        input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
        input wire [2 : 0] s00_axi_arprot,
        input wire  s00_axi_arvalid,
        output wire  s00_axi_arready,
        output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
        output wire [1 : 0] s00_axi_rresp,
        output wire  s00_axi_rvalid,
        input wire  s00_axi_rready
    );
// Instantiation of Axi Bus Interface S00_AXI
    frame_cnt_irq_gen_v1_0_S00_AXI # ( 
        .DATA_WIDTH         (DATA_WIDTH),
        .H_ACT              (H_ACT),  
        .V_ACT              (V_ACT),  
        .C_S_AXI_DATA_WIDTH (C_S00_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH (C_S00_AXI_ADDR_WIDTH)
    ) frame_cnt_irq_gen_v1_0_S00_AXI_inst (
        .v_aclk(v_aclk),
        .rst(rst),
        
        .enable(enable),
        .vsync(vsync),
        .s2mm_frame_ptr(s2mm_frame_ptr),
        .mm2s_frame_ptr(mm2s_frame_ptr),

        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        
        .vdma_intr_out(vdma_intr_out),
        
        .S_AXI_ACLK(s00_axi_aclk),
        .S_AXI_ARESETN(s00_axi_aresetn),
        .S_AXI_AWADDR(s00_axi_awaddr),
        .S_AXI_AWPROT(s00_axi_awprot),
        .S_AXI_AWVALID(s00_axi_awvalid),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WDATA(s00_axi_wdata),
        .S_AXI_WSTRB(s00_axi_wstrb),
        .S_AXI_WVALID(s00_axi_wvalid),
        .S_AXI_WREADY(s00_axi_wready),
        .S_AXI_BRESP(s00_axi_bresp),
        .S_AXI_BVALID(s00_axi_bvalid),
        .S_AXI_BREADY(s00_axi_bready),
        .S_AXI_ARADDR(s00_axi_araddr),
        .S_AXI_ARPROT(s00_axi_arprot),
        .S_AXI_ARVALID(s00_axi_arvalid),
        .S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_RDATA(s00_axi_rdata),
        .S_AXI_RRESP(s00_axi_rresp),
        .S_AXI_RVALID(s00_axi_rvalid),
        .S_AXI_RREADY(s00_axi_rready)
    );

    // Add user logic here

    // User logic ends

    endmodule
