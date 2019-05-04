library ieee;
use ieee.std_logic_1164.all;

--library work;
--use work.dma_fifo;

entity axi_streaming_dma_tx_fifo is
	generic (
		AXIS_DWIDTH : integer := 8 
	);
	port (
		clk		        : in std_logic;
		resetn		    : in std_logic;

		-- Enable DMA interface
		enable		    : in std_logic;

		-- Write axis port
		S_AXIS_TDATA	: in std_logic_vector(AXIS_DWIDTH-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic;
		S_AXIS_TREADY	: out std_logic;

		-- Write fifo port
		tfifo_wren		: out std_logic;
		tfifo_tfnf      : in std_logic;   -- tfifo not full(tfnf)
		tfifo_wdata	    : out std_logic_vector(AXIS_DWIDTH-1 downto 0)
	);
end;

architecture imp of axi_streaming_dma_tx_fifo is
	signal drain_dma		: Boolean;
begin

	drain_process: process (clk) is
		variable enable_d1 : std_logic;
	begin
		if rising_edge(clk) then
			if resetn = '0' then
				drain_dma <= False;
			else
				if S_AXIS_TVALID = '1' and S_AXIS_TLAST = '1' then
					drain_dma <= False;
				elsif enable_d1 = '1' and enable = '1' then
					drain_dma <= True;
				end if;
				enable_d1 := enable;
			end if;
		end if;
	end process;

    tfifo_wren  <= S_AXIS_TVALID;
    tfifo_wdata <= S_AXIS_TDATA;
    
	S_AXIS_TREADY <= '1' when tfifo_tfnf = '1' or drain_dma else '0';
end;
