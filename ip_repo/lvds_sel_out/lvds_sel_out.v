`timescale 1 ns / 1 ps

	module lvds_sel_out # (
		// Width of AXIS data bus
        parameter integer AXIS_DATA_WIDTH   = 16
	)
	(
        input wire          pix_clk_i,
        input wire          sel_dest,   // 0: lvds 0, 1: lvds 1
        
        // input 0 from vdma for lvds tx out
        input wire        	i_lvds_vs0,
        input wire        	i_lvds_hs0,
        input wire        	i_lvds_vb0,
        input wire        	i_lvds_hb0,
        input wire        	i_lvds_de0,
        input wire [AXIS_DATA_WIDTH-1:0]    i_lvds_dt0,

        // input 1 from vdma for lvds tx out
        input wire        	i_lvds_vs1,
        input wire        	i_lvds_hs1,
        input wire        	i_lvds_vb1,
        input wire        	i_lvds_hb1,
        input wire        	i_lvds_de1,
        input wire [AXIS_DATA_WIDTH-1:0]    i_lvds_dt1,
            
        // video lvds output for lvds tx out
        output wire         o_lvds_clk,
        output wire         o_lvds_vs,
        output wire         o_lvds_hs,
        output wire         o_lvds_vb,
        output wire         o_lvds_hb,
        output wire         o_lvds_de,
        output wire [AXIS_DATA_WIDTH-1:0]   o_lvds_dt,
        
        // Scope for debugging
        output reg          dbg_v_vs,
        output reg          dbg_v_hs,
        output reg          dbg_v_vb,
        output reg          dbg_v_hb,
        output reg          dbg_v_de,
        output reg [AXIS_DATA_WIDTH-1:0]    dbg_v_dt
	);

    wire        s_lvds_vs;
    wire        s_lvds_hs;
    wire        s_lvds_vb;
    wire        s_lvds_hb;
    wire        s_lvds_de;
    wire [AXIS_DATA_WIDTH-1:0]   s_lvds_dt;
	
    reg         d_lvds_vs;
    reg         d_lvds_hs;
    reg         d_lvds_vb;
    reg         d_lvds_hb;
    reg         d_lvds_de;
    reg [AXIS_DATA_WIDTH-1:0]   d_lvds_dt;
    
    assign s_lvds_vs = (sel_dest == 1'b1) ?   i_lvds_vs1 : i_lvds_vs0;
    assign s_lvds_vb = (sel_dest == 1'b1) ?   i_lvds_vb1 : i_lvds_vb0;
    assign s_lvds_hs = (sel_dest == 1'b1) ?   i_lvds_hs1 : i_lvds_hs0;
    assign s_lvds_hb = (sel_dest == 1'b1) ?   i_lvds_hb1 : i_lvds_hb0;
    assign s_lvds_de = (sel_dest == 1'b1) ?   i_lvds_de1 : i_lvds_de0;
    assign s_lvds_dt = (sel_dest == 1'b1) ?   i_lvds_dt1 : i_lvds_dt0;                    
                                        
    // Video out for lvds tx out    
    always @( posedge pix_clk_i ) begin
        d_lvds_vs  <= s_lvds_vs;
        d_lvds_hs  <= s_lvds_hs;
        d_lvds_vb  <= s_lvds_vb;
        d_lvds_hb  <= s_lvds_hb;
        d_lvds_de  <= s_lvds_de;
        d_lvds_dt  <= s_lvds_dt;
    end
  
    // Scope for Debugging    
    always @( posedge pix_clk_i ) begin
        dbg_v_vs  <= s_lvds_vs;
        dbg_v_hs  <= s_lvds_hs;
        dbg_v_vb  <= s_lvds_vb;
        dbg_v_hb  <= s_lvds_hb;
        dbg_v_de  <= s_lvds_de;
        dbg_v_dt  <= s_lvds_dt;
    end
    
    // lvds_pix_clk - 1
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_clk_out (
       .Q(o_lvds_clk),      // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(1'b1),           // 1-bit data input (positive edge)
       .D2(1'b0),           // 1-bit data input (negative edge)
       .R(1'b0),            // 1-bit reset
       .S(1'b0)             // 1-bit set
    );
    
    // lvds_data[AXIS_DATA_WIDTH-1:0] - 2    
    genvar        i;
    generate
    for (i = 0; i < AXIS_DATA_WIDTH; i = i + 1)
    begin : lvds_data_gen    
        ODDR #(
           .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
           .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
           .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
        ) ODDR_lvds_dt_out (
           .Q(o_lvds_dt[i]),    // 1-bit DDR output
           .C(pix_clk_i),       // 1-bit clock input
           .CE(1'b1),           // 1-bit clock enable input
           .D1(d_lvds_dt[i]),   // 1-bit data input (positive edge)
           .D2(d_lvds_dt[i]),   // 1-bit data input (negative edge)
           .R(1'b0), 			// 1-bit reset
           .S(1'b0)             // 1-bit set
        );
    end
    endgenerate

    // lvds_de - 3
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_de_out (
       .Q(o_lvds_de),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_lvds_de),      // 1-bit data input (positive edge)
       .D2(d_lvds_de),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // lvds_vsync - 4
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_vs_out (
       .Q(o_lvds_vs),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_lvds_vs),      // 1-bit data input (positive edge)
       .D2(d_lvds_vs),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // lvds_hsync - 5
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_hs_out (
       .Q(o_lvds_hs),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_lvds_hs),      // 1-bit data input (positive edge)
       .D2(d_lvds_hs),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // lvds_vblank - 6    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_vb_out (
       .Q(o_lvds_vb),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_lvds_vb),      // 1-bit data input (positive edge)
       .D2(d_lvds_vb),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // lvds_hblank - 7    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_lvds_hb_out (
       .Q(o_lvds_hb),       // 1-bit DDR output
       .C(pix_clk_i),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_lvds_hb),      // 1-bit data input (positive edge)
       .D2(d_lvds_hb),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );
            

	endmodule
