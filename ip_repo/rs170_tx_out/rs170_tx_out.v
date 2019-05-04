`timescale 1 ns / 1 ps

	module rs170_tx_out # (
		// Width of AXIS data bus
        parameter integer AXIS_DATA_WIDTH   = 16
	)
	(
        input wire          i_pclk,
        
        // input video for rs170 tx out
        input wire        	i_vsync,
        input wire        	i_hsync,
        input wire			i_blank,
        input wire			i_field,
        input wire [AXIS_DATA_WIDTH-1:0]    i_data,
            
        // output video for rx170 tx out
        output wire         rs170_clk,
        output wire         rs170_vsync,
        output wire         rs170_hsync,
        output wire         rs170_blank,
        output wire         rs170_field,
        output wire [AXIS_DATA_WIDTH-1:0]   rs170_data,
        
        // Scope for debugging
        output reg          dbg_vsync,
        output reg          dbg_hsync,
        output reg          dbg_blank,
        output reg          dbg_field,
        output reg [AXIS_DATA_WIDTH-1:0]    dbg_data
	);

	
    reg         d_rs170_vs;
    reg         d_rs170_hs;
    reg         d_rs170_bnk;
    reg         d_rs170_fid;
    reg [AXIS_DATA_WIDTH-1:0]   d_rs170_dt;
                                        
    // Video out for rs170 tx out    
    always @( posedge i_pclk ) begin
        d_rs170_vs  <= i_vsync;
        d_rs170_hs  <= i_hsync;
        d_rs170_bnk <= i_blank;
        d_rs170_fid <= i_field;
        d_rs170_dt  <= i_data;
    end
  
    // Scope for Debugging    
    always @( posedge i_pclk ) begin
        dbg_vsync <= i_vsync;
        dbg_hsync <= i_hsync;
        dbg_blank <= i_blank;
        dbg_field <= i_field;
        dbg_data  <= i_data;
    end
    
    // rs170_clk - 1
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_rs170_clk_out (
       .Q(rs170_clk),       // 1-bit DDR output
       .C(i_pclk),          // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(1'b1),           // 1-bit data input (positive edge)
       .D2(1'b0),           // 1-bit data input (negative edge)
       .R(1'b0),            // 1-bit reset
       .S(1'b0)             // 1-bit set
    );
    
    // rs170_data[AXIS_DATA_WIDTH-1:0] - 2    
    genvar        i;
    generate
    for (i = 0; i < AXIS_DATA_WIDTH; i = i + 1)
    begin : rs170_data_gen    
        ODDR #(
           .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
           .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
           .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
        ) ODDR_rs170_dt_out (
           .Q(rs170_data[i]),   // 1-bit DDR output
           .C(i_pclk),          // 1-bit clock input
           .CE(1'b1),           // 1-bit clock enable input
           .D1(d_rs170_dt[i]),  // 1-bit data input (positive edge)
           .D2(d_rs170_dt[i]),  // 1-bit data input (negative edge)
           .R(1'b0), 			// 1-bit reset
           .S(1'b0)             // 1-bit set
        );
    end
    endgenerate

    // rs170_vsync - 4
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_rs170_vs_out (
       .Q(rs170_vsync),       // 1-bit DDR output
       .C(i_pclk),       // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_rs170_vs),      // 1-bit data input (positive edge)
       .D2(d_rs170_vs),      // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // rs170_hsync - 5
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_rs170_hs_out (
       .Q(rs170_hsync),     // 1-bit DDR output
       .C(i_pclk),          // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_rs170_hs),     // 1-bit data input (positive edge)
       .D2(d_rs170_hs),     // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // rs170_blank - 6    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_rs170_bnk_out (
       .Q(rs170_blank),     // 1-bit DDR output
       .C(i_pclk),          // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_rs170_bnk),    // 1-bit data input (positive edge)
       .D2(d_rs170_bnk),    // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );

    // rs170_field - 7    
    ODDR #(
       .DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
       .INIT(1'b0),                       // Initial value of Q: 1'b0 or 1'b1
       .SRTYPE("SYNC")                   // Set/Reset type: "SYNC" or "ASYNC" 
    ) ODDR_rs170_fid_out (
       .Q(rs170_field),     // 1-bit DDR output
       .C(i_pclk),          // 1-bit clock input
       .CE(1'b1),           // 1-bit clock enable input
       .D1(d_rs170_fid),    // 1-bit data input (positive edge)
       .D2(d_rs170_fid),    // 1-bit data input (negative edge)
       .R(1'b0),  			// 1-bit reset
       .S(1'b0)             // 1-bit set
    );
            

	endmodule
