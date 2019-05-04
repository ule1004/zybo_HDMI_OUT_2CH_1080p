library ieee;
use ieee.std_logic_1164.all;

--library work;
--use work.dma_fifo;

entity axi_streaming_dma_rx_fifo is
	generic (
		AXIS_DWIDTH      : integer  := 8;
        DEPTH            : integer  := 6		
	);
	port (
		clk		         : in std_logic;
		resetn		     : in std_logic;

		-- Enable DMA interface
		enable		     : in std_logic;

		period_len	     : in integer range 0 to (2**DEPTH -1);

		-- Read axis port
		M_AXIS_TDATA	 : out std_logic_vector(AXIS_DWIDTH-1 downto 0);
		M_AXIS_TKEEP	 : out std_logic_vector(AXIS_DWIDTH/8-1 downto 0);
		M_AXIS_TLAST	 : out std_logic;
		M_AXIS_TVALID	 : out std_logic;
		M_AXIS_TREADY	 : in std_logic;

		-- Read fifo port
		rfifo_rden		 : out std_logic;
		rfifo_rfne	     : in std_logic;   -- rfifo not empty(rfne)
		rfifo_rdata		 : in std_logic_vector(AXIS_DWIDTH-1 downto 0)
	);
end;

architecture imp of axi_streaming_dma_rx_fifo is

	signal period_count  : integer range 0 to (2**DEPTH -1);
    signal rd_en         : std_logic;
    signal tvalid        : std_logic;

begin

    rd_en <= '1' when (rfifo_rfne = '1' and M_AXIS_TREADY = '1') else '0';
    rfifo_rden <= rd_en;
    
	M_AXIS_TVALID <= tvalid;
	M_AXIS_TKEEP  <= (others => '1');
    M_AXIS_TDATA  <= rfifo_rdata;  
	M_AXIS_TLAST  <= '1' when period_count = 0 else '0';

	period_counter: process(clk) is
	begin
		if resetn = '0' then
			tvalid <= '0';
			period_count <= period_len;
		else
			tvalid <= rd_en;		
			if rfifo_rfne = '1' and M_AXIS_TREADY = '1' then
				if period_count = 0 then
					period_count <= period_len;
				else
					period_count <= period_count - 1;
				end if;
			end if;
		end if;
	end process;

end;
