`timescale 1 ns / 1 ps

	module hdmi_tx_out # (
		// Width of AXIS data bus
        parameter integer AXIS_DATA_WIDTH   = 16
	)
	(
        input wire          pix_clk_i,
        
        // input from vdma for hdmi tx out
        input wire        	i_hdmi_vs,
        input wire        	i_hdmi_hs,
        input wire        	i_hdmi_vb,
        input wire        	i_hdmi_hb,
        input wire        	i_hdmi_de,
        input wire [AXIS_DATA_WIDTH-1:0]    i_hdmi_dt,
            
        // video hdmi output for hdmi tx out
        output wire         o_hdmi_clk,
        output wire         o_hdmi_vs,
        output wire         o_hdmi_hs,
        output wire         o_hdmi_vb,
        output wire         o_hdmi_hb,
        output wire         o_hdmi_de,
        output wire [AXIS_DATA_WIDTH-1:0]   o_hdmi_dt,
        
        // Scope for debugging
        output reg          dbg_v_vs,
        output reg          dbg_v_hs,
        output reg          dbg_v_vb,
        output reg          dbg_v_hb,
        output reg          dbg_v_de,
        output reg [AXIS_DATA_WIDTH-1:0]    dbg_v_dt
	);

	
    reg         d_hdmi_vs;
    reg         d_hdmi_hs;
    reg         d_hdmi_vb;
    reg         d_hdmi_hb;
    reg         d_hdmi_de;
    reg [AXIS_DATA_WIDTH-1:0]   d_hdmi_dt;
                                        
    // Video out for hdmi tx out    
    always @( posedge pix_clk_i ) begin
        d_hdmi_vs  <= i_hdmi_vs;
        d_hdmi_hs  <= i_hdmi_hs;
        d_hdmi_vb  <= i_hdmi_vb;
        d_hdmi_hb  <= i_hdmi_hb;
        d_hdmi_de  <= i_hdmi_de;
        d_hdmi_dt  <= i_hdmi_dt;
    end
  
    // Scope for Debugging    
    always @( posedge pix_clk_i ) begin
        dbg_v_vs  <= i_hdmi_vs;
        dbg_v_hs  <= i_hdmi_hs;
        dbg_v_vb  <= i_hdmi_vb;
        dbg_v_hb  <= i_hdmi_hb;
        dbg_v_de  <= i_hdmi_de;
        dbg_v_dt  <= i_hdmi_dt;
    end
    
    // hdmi_clk - 1
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_clk_out (
       .Q(o_hdmi_clk),      // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(1'b1),           // 1-bit data input (positive edge)
       .D2(1'b0),           // 1-bit data input (negative edge)
       .R(1'b0),            // 1-bit reset
       .S(1'b0)             // 1-bit set
    );
    
    // hdmi_data[15:0] - 2    
    genvar        i;
    generate
    for (i = 0; i < AXIS_DATA_WIDTH; i = i + 1)
    begin : hdmi_data_gen    
        ODDR #(
           .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
           .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
           .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
        ) ODDR_hdmi_dt_out (
           .Q(o_hdmi_dt[i]),    // 1-bit DDR output
           .C(pix_clk_i),       // 1-bit clock input
           .CE(1'b1),           // 1-bit clock enable input
           .D1(d_hdmi_dt[i]),   // 1-bit data input (positive edge)
           .D2(d_hdmi_dt[i]),   // 1-bit data input (negative edge)
           .R(1'b0), 			// 1-bit reset
           .S(1'b0)             // 1-bit set
        );
    end
    endgenerate

    // hdmi_de - 3
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_de_out (
       .Q(o_hdmi_de),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_hdmi_de),      // 1-bit data input (positive edge)
       .D2(d_hdmi_de),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // hdmi_vsync - 4
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_vs_out (
       .Q(o_hdmi_vs),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_hdmi_vs),      // 1-bit data input (positive edge)
       .D2(d_hdmi_vs),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // hdmi_hsync - 5
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_hs_out (
       .Q(o_hdmi_hs),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_hdmi_hs),      // 1-bit data input (positive edge)
       .D2(d_hdmi_hs),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // hdmi_vblank - 6    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_vb_out (
       .Q(o_hdmi_vb),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_hdmi_vb),      // 1-bit data input (positive edge)
       .D2(d_hdmi_vb),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // hdmi_hblank - 7    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_hdmi_hb_out (
       .Q(o_hdmi_hb),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_hdmi_hb),      // 1-bit data input (positive edge)
       .D2(d_hdmi_hb),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );
            

	endmodule
