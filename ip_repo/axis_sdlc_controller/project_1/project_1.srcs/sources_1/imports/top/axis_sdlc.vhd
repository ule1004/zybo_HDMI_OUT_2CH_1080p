--*******************************************************************--
-- Copyright (c) 2001-2007  Evatronix SA                             --
--*******************************************************************--
-- Please review the terms of the license agreement before using     --
-- this file. If you are not an authorized user, please destroy this --
-- source code file and notify Evatronix SA immediately that you     --
-- inadvertently received an unauthorized copy.                      --
--*******************************************************************--

-----------------------------------------------------------------------
-- Project name         : SDLC
-- Project description  : AXILite SDLC controller
--
-- File name            : CHIPSDLC.VHD
-- File contents        : Entity CHIPSDLC
--                        Architecture STR of CHIPSDLC
-- Purpose              : Top-level structure of CHIPSDLC
--                        Semi-Synthesisable HDL Core
--
-- Destination library  : SDLC_LIB
-- Dependencies         : SDLC_LIB.UTILITY
--                        IEEE.STD_LOGIC_1164
--
-- Design Engineer      : T.K.
-- Quality Engineer     : M.B.
-- Version              : 1h01n00s00
-- Last modification    : 2006-12-05
-----------------------------------------------------------------------

--*******************************************************************--
-- Modifications with respect to Version 1.01.E00:
--*******************************************************************--

library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use ieee.numeric_std.all;

--library ieee;
--    use ieee.std_logic_1164.all;
--    use ieee.std_logic_arith.all;    
--    use ieee.std_logic_unsigned.all;
       
--library SDLC_LIB;
--   use SDLC_LIB.UTILITY.all;
    use work.utility.all;

   entity AXIS_SDLC is
      generic(
            -- Bus protocol parameters, do not add to or delete
            C_S_AXI_DATA_WIDTH   : integer            := 32;
            C_S_AXI_ADDR_WIDTH   : integer            := 16;
            C_S_AXI_MIN_SIZE     : std_logic_vector := X"000001FF";
            C_BASEADDR           : std_logic_vector := X"FFFFFFFF";
            C_HIGHADDR           : std_logic_vector := X"00000000";
            -- Axi Stream Data width
            AXIS_DWIDTH          : INTEGER            := 8;
            -- DPRAM Depth
            DEPTH                : INTEGER            := 6
      );
      port (
            -- AXI Lite bus interface
            S_AXI_ACLK           : in  STD_LOGIC;    -- Global clock input
            S_AXI_ARESETN        : in  STD_LOGIC;    -- Global reset input
            S_AXI_AWADDR		 : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWVALID		 : in  std_logic;
            S_AXI_WDATA		     : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB		     : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID		 : in  std_logic;
            S_AXI_BREADY		 : in  std_logic;
            S_AXI_ARADDR		 : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARVALID		 : in  std_logic;
            S_AXI_RREADY		 : in  std_logic;
            S_AXI_ARREADY		 : out std_logic;
            S_AXI_RDATA		     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP		     : out std_logic_vector(1 downto 0);
            S_AXI_RVALID		 : out std_logic;
            S_AXI_WREADY		 : out std_logic;
            S_AXI_BRESP		     : out std_logic_vector(1 downto 0);
            S_AXI_BVALID		 : out std_logic;
            S_AXI_AWREADY		 : out std_logic;
            
            -- Serial interface
            rxd                  : in  STD_LOGIC;   -- Receive Data
            txc                  : in  STD_LOGIC;   -- Transmit Clock
            rxc                  : in  STD_LOGIC;   -- Receive Clock
            txd                  : out STD_LOGIC;   -- Transmit data  
            den                  : out STD_LOGIC;   -- External driver enable
            
            -- Interrupts
            tv                   : out STD_LOGIC;   -- Transmit valid interrupt
            re                   : out STD_LOGIC;   -- Receive error interrupt
            rv                   : out STD_LOGIC;   -- Receive valid interrupt
            rdn                  : out STD_LOGIC;   -- Recive done interrupt
            
            -- Interrupt priorities
            ptv                  : out STD_LOGIC;   -- Transmit valid priority
            pre                  : out STD_LOGIC;   -- Receive error priority
            prv                  : out STD_LOGIC;   -- Receive valid priority

		    -- AXI Streaming DMA TX interface
            S_AXIS_TDATA         : in  std_logic_vector(AXIS_DWIDTH-1 downto 0);
            S_AXIS_TLAST         : in  std_logic;
            S_AXIS_TVALID        : in  std_logic;
            S_AXIS_TREADY        : out std_logic;
    
            -- AXI Streaming DMA RX interface
            M_AXIS_TDATA         : out std_logic_vector(AXIS_DWIDTH-1 downto 0);
            M_AXIS_TKEEP         : out std_logic_vector(AXIS_DWIDTH/8-1 downto 0);
            M_AXIS_TLAST         : out std_logic;
            M_AXIS_TVALID        : out std_logic;
            M_AXIS_TREADY        : in  std_logic
        );
   end AXIS_SDLC;

   architecture STR of AXIS_SDLC is

     component axi_ctrlif
        generic
        (
            C_S_AXI_DATA_WIDTH	: integer			:= 32;
            C_S_AXI_ADDR_WIDTH	: integer			:= 16
        );
        port
        (
            -- AXI bus interface
            S_AXI_ACLK		: in  std_logic;
            S_AXI_ARESETN	: in  std_logic;
            S_AXI_AWADDR	: in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWVALID	: in  std_logic;
            S_AXI_WDATA		: in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB		: in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID	: in  std_logic;
            S_AXI_BREADY	: in  std_logic;
            S_AXI_ARADDR	: in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARVALID	: in  std_logic;
            S_AXI_RREADY	: in  std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RDATA		: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP		: out std_logic_vector(1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BRESP		: out std_logic_vector(1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_AWREADY	: out std_logic;
                
            -- User function register interface
            ui_clk          : out STD_LOGIC;
            ui_rst          : out STD_LOGIC;
            ui_rstn         : out STD_LOGIC;
            
            ui_addr         : out STD_LOGIC_VECTOR(6 downto 0);
            ui_wr           : out STD_LOGIC;
            ui_rd           : out STD_LOGIC;
            ui_datai        : out STD_LOGIC_VECTOR(7 downto 0);
            ui_datao        : in  STD_LOGIC_VECTOR(7 downto 0);
            ui_ack          : in  STD_LOGIC                                    
        );
     end component;

     component SDLC
        generic(
            -- DPRAM Depth
            DEPTH             : INTEGER := 6
        );
        port (
             -- Control signals
             clk              : in  STD_LOGIC;   -- Global clock input
             reset            : in  STD_LOGIC;   -- Global reset input
                                              
             -- Serial interface
             rxd              : in  STD_LOGIC;   -- Receive Data
             txc              : in  STD_LOGIC;   -- Transmit Clock
             rxc              : in  STD_LOGIC;   -- Receive Clock
             txd              : out STD_LOGIC;   -- Transmit data	
             den              : out STD_LOGIC;   -- External driver enable
             
             -- Interrupts
             tv               : out STD_LOGIC;   -- Transmit valid interrupt
             re               : out STD_LOGIC;   -- Receive error interrupt
             rv               : out STD_LOGIC;   -- Receive valid interrupt
             rdn              : out STD_LOGIC;   -- Receive done interrupt
             ptv              : out STD_LOGIC;   -- Transmit valid priority
             pre              : out STD_LOGIC;   -- Receive error priority
             prv              : out STD_LOGIC;   -- Receive valid priority

             -- Tx/Rx enable and clear
             ten_o            : out STD_LOGIC;   -- Transmit enable
             tenset_o         : out STD_LOGIC;   -- Transmit enable set(clear)
             gren_o           : out STD_LOGIC;   -- Receive enable
             grenset_o        : out STD_LOGIC;   -- Receive enable set(clear)
             
             -- Special function register interface
             sfraddr          : in  STD_LOGIC_VECTOR(6 downto 0);
             sfrwe            : in  STD_LOGIC;
             sfrra            : in  STD_LOGIC;
             sfrdatai         : in  STD_LOGIC_VECTOR(7 downto 0);
             sfrdatao         : out STD_LOGIC_VECTOR(7 downto 0);

             -- External tx fifo write
             tfifo_wren       : in  STD_LOGIC;
             tfifo_wdata      : in  STD_LOGIC_VECTOR(7 downto 0);
             tfifo_tfnf       : out STD_LOGIC;   -- Transmit fifo not full
            
             -- External rx fifo read         
             rfifo_rden       : in  STD_LOGIC;
             rfifo_rdata      : out STD_LOGIC_VECTOR(7 downto 0);
             rfifo_rfne       : out STD_LOGIC;   -- Receive fifo not empty

             -- Transmit dual port ram interface
             tdib             : in  STD_LOGIC_VECTOR(7 downto 0);
             taddra           : out STD_LOGIC_VECTOR(DEPTH-1 downto 0);
             taddrb           : out STD_LOGIC_VECTOR(DEPTH-1 downto 0);
             twea             : out STD_LOGIC;
             tenb             : out STD_LOGIC;
             tdoa             : out STD_LOGIC_VECTOR(7 downto 0);
             
             -- Receieve dual port ram interface
             rdib             : in  STD_LOGIC_VECTOR(7 downto 0);
             raddra           : out STD_LOGIC_VECTOR(DEPTH-1 downto 0);
             raddrb           : out STD_LOGIC_VECTOR(DEPTH-1 downto 0);
             rwea             : out STD_LOGIC;
             renb             : out STD_LOGIC;
             rdoa             : out STD_LOGIC_VECTOR(7 downto 0)
        );
     end component;

     component axi_streaming_dma_tx_fifo
        generic (
            AXIS_DWIDTH : integer := 8
        );
        port (
            clk		          : in std_logic;
            resetn		      : in std_logic;
    
            -- Enable DMA interface
            enable		      : in std_logic;
    
            -- Write port
            S_AXIS_TDATA	  : in std_logic_vector(AXIS_DWIDTH-1 downto 0);
            S_AXIS_TLAST	  : in std_logic;
            S_AXIS_TVALID	  : in std_logic;
            S_AXIS_TREADY	  : out std_logic;
    
            -- Read port
            tfifo_wren        : out std_logic;
            tfifo_tfnf	      : in std_logic;    -- tfifo not full
            tfifo_wdata	      : out std_logic_vector(AXIS_DWIDTH-1 downto 0)
        );
     end component;

     component axi_streaming_dma_rx_fifo
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
     end component;

     component pl330_dma_gen
        generic (
            FIFO_DIRECTION : integer := 0 -- 0 = TFIFO, 1 = RFIFO
        );
        port (
            clk		    : in  std_logic;
            resetn		: in  std_logic;
            clear		: in  std_logic;
            
            -- Enable DMA interface
            enable      : in  std_logic;
    
            -- Request/enable DMA interface
            tv			: in  std_logic;
            rv			: in  std_logic;
    
            -- PL330 DMA interface
            dclk		: in  std_logic;
            dresetn		: in  std_logic;
            davalid		: in  std_logic;
            daready		: out std_logic;
            datype		: in  std_logic_vector(1 downto 0);
            drvalid		: out std_logic;
            drready		: in  std_logic;
            drtype		: out std_logic_vector(1 downto 0);
            drlast		: out std_logic;
    
            DBG			: out std_logic_vector(7 downto 0)
        );
     end component;
     
     component DUALRAM
        generic (
            DRAMDEPTH : INTEGER := 6;
            DRAMWIDTH : INTEGER := 8
        );
        port (
            clk       : in  STD_LOGIC;
            we        : in  STD_LOGIC;
            re        : in  STD_LOGIC;
            wdata     : in  STD_LOGIC_VECTOR(DRAMWIDTH-1 downto 0);
            waddr     : in  STD_LOGIC_VECTOR(DRAMDEPTH-1 downto 0);
            raddr     : in  STD_LOGIC_VECTOR(DRAMDEPTH-1 downto 0);
            rdata     : out STD_LOGIC_VECTOR(DRAMWIDTH-1 downto 0)
        );
     end component;
        
     -- Transmit dual port ram interface
     signal tdib        : STD_LOGIC_VECTOR(7 downto 0);
     signal taddra      : STD_LOGIC_VECTOR(DEPTH-1 downto 0);
     signal taddrb      : STD_LOGIC_VECTOR(DEPTH-1 downto 0);
     signal twea        : STD_LOGIC;
     signal tenb        : STD_LOGIC;
     signal tdoa        : STD_LOGIC_VECTOR(7 downto 0);
     
     -- Receieve dual port ram interface
     signal rdib        : STD_LOGIC_VECTOR(7 downto 0);
     signal raddra      : STD_LOGIC_VECTOR(DEPTH-1 downto 0);
     signal raddrb      : STD_LOGIC_VECTOR(DEPTH-1 downto 0);
     signal rwea        : STD_LOGIC;
     signal renb        : STD_LOGIC;
     signal rdoa        : STD_LOGIC_VECTOR(7 downto 0);

     -- pl330 DMA interface
     signal i_tv        : STD_LOGIC;    -- internal tx valid interrupt
     signal i_ptv       : STD_LOGIC;    -- internal tx valid interrupt priority

     signal i_rv        : STD_LOGIC;    -- internal rx valid interrupt
     signal i_prv       : STD_LOGIC;    -- internal rx valid interrupt priority

     signal i_ten       : STD_LOGIC;    -- internal Transmit enable
     signal i_tenset    : STD_LOGIC;    -- internal Transmit enable set(clear)
     signal i_gren      : STD_LOGIC;    -- internal Receive enable
     signal i_grenset   : STD_LOGIC;    -- internal Receive enable set(clear)

     -- Special function Register interface 
     signal clk         : STD_LOGIC;
     signal reset       : STD_LOGIC;
     signal resetn      : STD_LOGIC;

     signal sfraddr     : STD_LOGIC_VECTOR(6 downto 0);
     signal sfrwe       : STD_LOGIC;
     signal sfrra       : STD_LOGIC;
     signal sfrdatai    : STD_LOGIC_VECTOR(7 downto 0);
     signal sfrdatao    : STD_LOGIC_VECTOR(7 downto 0);
     signal ui_datao    : STD_LOGIC_VECTOR(7 downto 0);
     signal const_1     : STD_LOGIC;

     -- External tx fifo write
     signal tfifo_wren  : STD_LOGIC;
     signal tfifo_wdata : STD_LOGIC_VECTOR(7 downto 0);
     signal tfifo_tfnf  : STD_LOGIC;   -- Transmit fifo not full
    
     -- External rx fifo read         
     signal rfifo_rden  : STD_LOGIC;
     signal rfifo_rdata : STD_LOGIC_VECTOR(7 downto 0);
     signal rfifo_rfne  : STD_LOGIC;   -- Receive fifo not empty
     signal period_len	: integer range 0 to (2**DEPTH -1);
     signal RX_LEN_REG	: std_logic_vector(31 downto 0);
    
   begin
  
     const_1 <= '1';

     tv  <= i_tv;
     ptv <= i_ptv;
     rv  <= i_rv;
     prv <= i_prv;

     -----------------------------------------------------------------------
     -- Up Interface unit
     -----------------------------------------------------------------------
	 UP_IF : axi_ctrlif
     -----------------------------------------------------------------------
		generic map (
			C_S_AXI_DATA_WIDTH => C_S_AXI_DATA_WIDTH,
			C_S_AXI_ADDR_WIDTH => C_S_AXI_ADDR_WIDTH
		)
		port map(
			S_AXI_ACLK		=> S_AXI_ACLK,
			S_AXI_ARESETN	=> S_AXI_ARESETN,
			S_AXI_AWADDR	=> S_AXI_AWADDR,
			S_AXI_AWVALID	=> S_AXI_AWVALID,
			S_AXI_WDATA		=> S_AXI_WDATA,
			S_AXI_WSTRB		=> S_AXI_WSTRB,
			S_AXI_WVALID	=> S_AXI_WVALID,
			S_AXI_BREADY	=> S_AXI_BREADY,
			S_AXI_ARADDR	=> S_AXI_ARADDR,
			S_AXI_ARVALID	=> S_AXI_ARVALID,
			S_AXI_RREADY	=> S_AXI_RREADY,
			S_AXI_ARREADY	=> S_AXI_ARREADY,
			S_AXI_RDATA		=> S_AXI_RDATA,
			S_AXI_RRESP		=> S_AXI_RRESP,
			S_AXI_RVALID	=> S_AXI_RVALID,
			S_AXI_WREADY	=> S_AXI_WREADY,
			S_AXI_BRESP		=> S_AXI_BRESP,
			S_AXI_BVALID	=> S_AXI_BVALID,
			S_AXI_AWREADY	=> S_AXI_AWREADY,
			
            ui_clk          => clk,
            ui_rst          => reset,
            ui_rstn         => resetn,
            
            ui_addr         => sfraddr,
            ui_wr           => sfrwe,
            ui_rd           => sfrra,
            ui_datai        => sfrdatai,
            ui_datao        => ui_datao,
            ui_ack          => const_1                                   
		    );
        
     -----------------------------------------------------------------------
     -- SDLC unit
     -----------------------------------------------------------------------
     U_SDLC : SDLC
     -----------------------------------------------------------------------
        generic map (
                 DEPTH      => DEPTH
                 )
        port map (
                 clk       => clk,
                 reset     => reset,
                 
              -- sdlc serial interface
                 rxd       => rxd,
                 txc       => txc,
                 rxc       => rxc,
                 txd       => txd,
                 den       => den,
              
              -- interrupt   
                 tv        => i_tv,
                 re        => re,
                 rv        => i_rv,
                 rdn       => rdn,
                 ptv       => i_ptv,
                 pre       => pre,
                 prv       => i_prv,
                 
              -- Tx/Rx enable and clear
                 ten_o     => i_ten,    -- Transmit enable
                 tenset_o  => i_tenset, -- Transmit enable set(clear)
                 gren_o    => i_gren,   -- Receive enable
                 grenset_o => i_grenset,-- Receive enable set(clear)
                 
              -- uP intf.   
                 sfrdatai  => sfrdatai,
                 sfraddr   => sfraddr,
                 sfrwe     => sfrwe,
                 sfrra     => sfrra,
                 sfrdatao  => sfrdatao,

              -- External tx fifo write
                 tfifo_wren  => tfifo_wren,
                 tfifo_wdata => tfifo_wdata,
                 tfifo_tfnf  => tfifo_tfnf,
                
              -- External rx fifo read         
                 rfifo_rden  => rfifo_rden,
                 rfifo_rdata => rfifo_rdata,
                 rfifo_rfne  => rfifo_rfne,
              
              -- Transmitter DPRAM intf.
                 tdib      => tdib,     -- in(rdata)
                 taddrb    => taddrb,   -- out(raddr)
                 tenb      => tenb,     -- out(re)                 
                 tdoa      => tdoa,     -- out(wdata)
                 taddra    => taddra,   -- out(waddr)
                 twea      => twea,     -- out(we)

              -- Receiver DPRAM intf.                 
                 rdib      => rdib,     -- in(rdata)
                 raddrb    => raddrb,   -- out(raddr)
                 renb      => renb,     -- out(re)
                 rdoa      => rdoa,     -- out(wdata)  
                 raddra    => raddra,   -- out(waddr)
                 rwea      => rwea      -- out(we)
                 );

     -----------------------------------------------------------------------
     -- Axi streaming tx Unit
     -----------------------------------------------------------------------
	 AXI_STREAMING_TX_GEN : axi_streaming_dma_tx_fifo
     -----------------------------------------------------------------------
        generic map(
                 AXIS_DWIDTH => AXIS_DWIDTH
                )
        port map(
                 clk            => clk,
                 resetn         => resetn,
                 enable         => i_ten,
 
                 S_AXIS_TDATA   => S_AXIS_TDATA,
                 S_AXIS_TLAST   => S_AXIS_TLAST,
                 S_AXIS_TVALID  => S_AXIS_TVALID,
                 S_AXIS_TREADY  => S_AXIS_TREADY,

                 tfifo_wren     => tfifo_wren,
                 tfifo_tfnf     => tfifo_tfnf,
                 tfifo_wdata    => tfifo_wdata
             );

     -----------------------------------------------------------------------
     -- Axi streaming rx Unit
     -----------------------------------------------------------------------
	 AXI_STREAMING_RX_GEN : axi_streaming_dma_rx_fifo
     -----------------------------------------------------------------------
        generic map(
                 AXIS_DWIDTH => AXIS_DWIDTH,
                 DEPTH       => DEPTH
                )
        port map(
                 clk            => clk,
                 resetn         => resetn,                
                 enable         => i_gren,

                 period_len     => period_len,
                  
                 M_AXIS_TDATA   => M_AXIS_TDATA,
                 M_AXIS_TKEEP   => M_AXIS_TKEEP,
                 M_AXIS_TLAST   => M_AXIS_TLAST,
                 M_AXIS_TVALID  => M_AXIS_TVALID,
                 M_AXIS_TREADY  => M_AXIS_TREADY,

                 rfifo_rden     => rfifo_rden,
                 rfifo_rfne     => rfifo_rfne,
                 rfifo_rdata    => rfifo_rdata
             );
      
     -----------------------------------------------------------------------
     -- Transmit dual port RAM unit
     -----------------------------------------------------------------------
     U_TRANSMITRAM : DUALRAM
     -----------------------------------------------------------------------
        generic map (
                 DRAMDEPTH  => DEPTH,
                 DRAMWIDTH  => 8
        )
        port map (
                clk       => clk,
             -- write(a port)                
                we        => twea,      -- in
                waddr     => taddra,    -- in
                wdata     => tdoa,      -- in
             -- read(b port)                
                re        => tenb,      -- in
                raddr     => taddrb,    -- in
                rdata     => tdib       -- out
        );
        
     -----------------------------------------------------------------------
     -- Receive dual port RAM unit
     -----------------------------------------------------------------------
     U_RECEIVERAM : DUALRAM
     -----------------------------------------------------------------------
        generic map (
                 DRAMDEPTH  => DEPTH,
                 DRAMWIDTH  => 8
        )
        port map (
                clk       => clk,
             -- write(a port)
                we        => rwea,      -- in
                waddr     => raddra,    -- in
                wdata     => rdoa,      -- in
             -- read(b port)
                re        => renb,      -- in
                raddr     => raddrb,    -- in
                rdata     => rdib       -- out
        );
	
	 period_len	<= to_integer(unsigned(RX_LEN_REG(7 downto 0)));

     --------------------------------------------------------------------
     -- Rx length register read
     --------------------------------------------------------------------
     rx_len_read_proc: -- 80h
     --------------------------------------------------------------------
        ui_datao <= RX_LEN_REG(7 downto 0) when sfraddr = "0100000" else sfrdatao;  -- X"20"(80h)

     --------------------------------------------------------------------
     -- Rx length register write
     --------------------------------------------------------------------
     rx_len_write_proc:
     --------------------------------------------------------------------
        process (clk)
        begin
           if clk'event and clk='1' then
              -------------------------------------
              -- Synchronous reset
              -------------------------------------
              if reset='1' then
--               RX_LEN_REG <= (others => '0');
                 RX_LEN_REG <= X"00000004";
              else
                 if (sfrwe = '1' and sfraddr = "0100000") then  -- 80h
                    RX_LEN_REG <= X"000000" & sfrdatai;
                 end if;
              end if;
           end if;
        end process;    
        
   end STR;
--*******************************************************************--
