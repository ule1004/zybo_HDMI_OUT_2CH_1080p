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
--   use work.utility.all;

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
            DEPTH                : INTEGER            := 12
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
            tdn                  : out STD_LOGIC;   -- Transmit done interrupt
            rx_done_intr         : out STD_LOGIC;   -- Recive done or error interrupt
                        
            -- Interrupt priorities
            ptv                  : out STD_LOGIC;   -- Transmit valid priority
            pre                  : out STD_LOGIC;   -- Receive error priority
            prv                  : out STD_LOGIC;   -- Receive valid priority
            
            -- Receive data length(bytes) output
            rx_len               : out STD_LOGIC_VECTOR(31 downto 0);
            
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

    component axis_sdlc_ngc
      generic(
            -- Bus protocol parameters, do not add to or delete
            C_S_AXI_DATA_WIDTH   : integer           := 32;
            C_S_AXI_ADDR_WIDTH   : integer           := 16;
            C_S_AXI_MIN_SIZE     : std_logic_vector := X"000001FF";
            C_BASEADDR           : std_logic_vector := X"FFFFFFFF";
            C_HIGHADDR           : std_logic_vector := X"00000000";
            -- Axi Stream Data width
            AXIS_DWIDTH          : INTEGER            := 8;
            -- DPRAM Depth
            DEPTH                : INTEGER            := 12
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
            tdn                  : out STD_LOGIC;   -- Transmit done interrupt
            rx_done_intr         : out STD_LOGIC;   -- Recive done or error interrupt
                        
            -- Interrupt priorities
            ptv                  : out STD_LOGIC;   -- Transmit valid priority
            pre                  : out STD_LOGIC;   -- Receive error priority
            prv                  : out STD_LOGIC;   -- Receive valid priority
            
            -- Receive data length(bytes) output
            rx_len               : out STD_LOGIC_VECTOR(31 downto 0);
            
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
    end component;

    begin
        
    axis_sdlc_ngc_i : axis_sdlc_ngc
        generic map (
            C_S_AXI_DATA_WIDTH => C_S_AXI_DATA_WIDTH,
            C_S_AXI_ADDR_WIDTH => C_S_AXI_ADDR_WIDTH,
            C_S_AXI_MIN_SIZE   => C_S_AXI_MIN_SIZE,
            C_BASEADDR         => C_BASEADDR,
            C_HIGHADDR         => C_HIGHADDR,
            AXIS_DWIDTH        => AXIS_DWIDTH,
            DEPTH              => DEPTH			
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
    
            -- Serial interface
            rxd           => rxd,
            txc           => txc,
            rxc           => rxc,
            txd           => txd,  
            den           => den,
            
            -- Interrupts
            tv            => tv,
            re            => re,
            rv            => rv,
            rdn           => rdn,
            tdn           => tdn,
            rx_done_intr  => rx_done_intr,
                      
            -- Interrupt priorities
            ptv           => ptv,
            pre           => pre,
            prv           => prv,
            
            -- Receive data length(bytes) output
            rx_len        => rx_len,
            
            -- AXI Streaming DMA TX interface
            S_AXIS_TDATA  => S_AXIS_TDATA,
            S_AXIS_TLAST  => S_AXIS_TLAST,
            S_AXIS_TVALID => S_AXIS_TVALID,
            S_AXIS_TREADY => S_AXIS_TREADY,
            
            -- AXI Streaming DMA RX interface
            M_AXIS_TDATA  => M_AXIS_TDATA,
            M_AXIS_TKEEP  => M_AXIS_TKEEP,
            M_AXIS_TLAST  => M_AXIS_TLAST,
            M_AXIS_TVALID => M_AXIS_TVALID,
            M_AXIS_TREADY => M_AXIS_TREADY                             
        );
                    
   end STR;
--*******************************************************************--
