`timescale 1 ns / 1 ps

	module v_in_duplicate # (
		// Width of AXIS data bus
        parameter integer DATA_WIDTH   = 16
	)
	(        
        input  wire        i_v_CLK,
        output wire        o_v_CLK,

        // video input
        input  wire        	i_v_VS,
        input  wire        	i_v_HS,
        input  wire        	i_v_DE,
        input  wire [DATA_WIDTH-1:0]    i_v_DT,
            
        // video 0 output
        output wire         o_v_VS0,
        output wire         o_v_HS0,
        output wire         o_v_DE0,
        output wire [DATA_WIDTH-1:0]   o_v_DT0,

        // video 1 output
        output wire         o_v_VS1,
        output wire         o_v_HS1,
        output wire         o_v_DE1,
        output wire [DATA_WIDTH-1:0]   o_v_DT1        
	);

	wire        b_v_clk;
	
    reg         r_vs0;
    reg         r_hs0;
    reg         r_de0;
    reg [DATA_WIDTH-1:0]   r_dt0;

    reg         r_vs1;
    reg         r_hs1;
    reg         r_de1;
    reg [DATA_WIDTH-1:0]   r_dt1;

    BUFG BUFG_vclk_i (
      .O(b_v_clk),  // 1-bit output: Clock output
      .I(i_v_CLK)   // 1-bit input: Clock input
    );

    assign o_v_CLK = b_v_clk;
    
    assign o_v_VS0 = r_vs0;
    assign o_v_HS0 = r_hs0;
    assign o_v_DE0 = r_de0;
    assign o_v_DT0 = r_dt0;

    assign o_v_VS1 = r_vs1;
    assign o_v_HS1 = r_hs1;
    assign o_v_DE1 = r_de1;
    assign o_v_DT1 = r_dt1;
                                    
    // Video out    
    always @( posedge b_v_clk ) begin
        r_vs0 <= i_v_VS;
        r_hs0 <= i_v_HS;
        r_de0 <= i_v_DE;
        r_dt0 <= i_v_DT;
        
        r_vs1 <= i_v_VS;
        r_hs1 <= i_v_HS;
        r_de1 <= i_v_DE;
        r_dt1 <= i_v_DT;
    end
      
	endmodule
