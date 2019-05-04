--*******************************************************************--
-- Copyright (c) 2001-2007  Evatronix SA                             --
--*******************************************************************--
-- Please review the terms of the license agreement before using     --
-- this file. If you are not an authorized user, please destroy this --
-- source code file and notify Evatronix S.A. immediately that you   --
-- inadvertently received an unauthorized copy.                      --
--*******************************************************************--

-----------------------------------------------------------------------
-- Project name         : SDLC
-- Project description  : SDLC controller
--
-- File name            : UTILITY.VHD
-- File contents        : Package UTILITY
-- Purpose              : Special Function Register description
--                        Sdlc constants
--
-- Destination library  : SDLC_LIB
-- Dependencies         : SDLC_LIB.Utility
--                        IEEE.STD_LOGIC_1164
--
-- Design Engineer      : T.K.
-- Quality Engineer     : M.B.
-- Version              : 1h01n00s00
-- Last modification    : 2002-04-11
-----------------------------------------------------------------------

--*******************************************************************--
-- Modifications with respect to Version 1.00.E00:
--*******************************************************************--

library IEEE;
   use IEEE.STD_LOGIC_1164.all;

   package UTILITY IS
   
   --------------------------------------------------------------------
   -- Special Function Register description
   --------------------------------------------------------------------
   -- Register : ID  : RV  : Description
   -- gmod     : 00h : 00h : Sdlc global mode             -- 0000 000XB  
   -- tfifo    : 04h : FFh : Sdlc transmit fifo           -- ???? ????B
   -- pcon     : 08h : 00h : Power Control Register       -- 0XXX XXXXB
   -- baud     : 0Ch : 00h : Sdlc baud rate
   -- adr0     : 10h : 00h : Sdlc address 0
   -- ifs      : 14h : 00h : Sdlc interframe spacing
   -- adr1     : 18h : 00h : Sdlc address 1
   -- adr2     : 1Ch : 00h : Sdlc address 2
   -- adr3     : 20h : 00h : Sdlc address 3
   -- ien1     : 24h : C0h : Sdlc interrupt enable 1      -- XXXX 0X00B
   -- amsk0    : 28h : 00h : Sdlc address mask 0
   -- tstat    : 2Ch : 04h : Sdlc transmit status         -- 0XXX 010XB
   -- amsk1    : 30h : 00h : Sdlc address mask 1
   -- rstat    : 34h : 00h : Sdlc receive status          -- 0000 000XB
   -- rfifo    : 38h : 00h : Sdlc receive fifo
   -- ipn1     : 3Ch : C0h : Sdlc interrupt priority 1    -- XXXX 0X00B
   -------------------------------------------------------------------- 
   
   
      -----------------------------------------------------------------
      -- Special Function Register locations and reset values
      -----------------------------------------------------------------
      -- Register : ID  : RV  : Description      
      -- gmod     : 00h : 00h : Sdlc global mode          -- 0000 000XB
      constant GMOD_ID  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";	-- X"00"
      constant GMOD_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- tfifo    : 04h : FFh : Sdlc transmit fifo        -- ???? ????B
      constant TFIFO_ID : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001";	-- X"01"
      constant TFIFO_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- pcon     : 08h : 00h : Power Control Register    -- 0XX0 00XXB
      constant PCON_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0000010";	-- X"02"
      constant PCON_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- baud     : 0Ch : 00h : Sdlc baud rate
      constant BAUD_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0000011";	-- X"03"
      constant BAUD_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- tmod     : 40h : 00h : Port 1 register direction
      constant TMOD_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0010000";	-- X"10"	
      constant TMOD_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- adr0     : 10h : 00h : Sdlc address 0
      constant ADR0_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0000100";	-- X"04"
      constant ADR0_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- ifs      : 14h : 00h : Sdlc interframe spacing                
      constant IFS_ID   : STD_LOGIC_VECTOR(6 downto 0) := "0000101";	-- X"05"
      constant IFS_RV   : STD_LOGIC_VECTOR(7 downto 0) := "00000001"; 
   
      -- adr1     : 18h : 00h : Sdlc address 1
      constant ADR1_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0000110";	-- X"06"
      constant ADR1_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- adr2     : 1Ch : 00h : Sdlc address 2
      constant ADR2_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0000111";	-- X"07"
      constant ADR2_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- adr3     : 20h : 00h : Sdlc address 3
      constant ADR3_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0001000";	-- X"08"
      constant ADR3_RV  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- ien1     : 24h : C0h : Sdlc interrupt enable 1   -- XXXX 0X00B
      constant IEN1_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0001001";	-- X"09"
      constant IEN1_RV  : STD_LOGIC_VECTOR(7 downto 0) := "11000000";
   
      -- amsk0    : 28h : 00h : Sdlc address mask 0
      constant AMSK0_ID : STD_LOGIC_VECTOR(6 downto 0) := "0001010";	-- X"0A"
      constant AMSK0_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- tstat    : 2Ch : 04h : Sdlc transmit status      -- XX0X 0X0XB
      constant TSTAT_ID : STD_LOGIC_VECTOR(6 downto 0) := "0001011";	-- X"0B"
      constant TSTAT_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000100";
   
      -- amsk1    : 30h : 00h : Sdlc address mask 1
      constant AMSK1_ID : STD_LOGIC_VECTOR(6 downto 0) := "0001100";	-- X"0C"
      constant AMSK1_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- rstat    : 34h : 00h : Sdlc receive status       -- 0000 000XB
      constant RSTAT_ID : STD_LOGIC_VECTOR(6 downto 0) := "0001101";	-- X"0D"
      constant RSTAT_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- rfifo    : 38h : 00h : Sdlc receive fifo
      constant RFIFO_ID : STD_LOGIC_VECTOR(6 downto 0) := "0001110";	-- X"0E"
      constant RFIFO_RV : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
   
      -- ipn1     : 3Ch : C0h : Sdlc interrupt priority 1 -- XXXX 0X00B
      constant IPN1_ID  : STD_LOGIC_VECTOR(6 downto 0) := "0001111";	-- X"0F"
      constant IPN1_RV  : STD_LOGIC_VECTOR(7 downto 0) := "11000000";
   
    --------------------------------------------------------------------
    -- Sdlc modes of operation
    -------------------------------------------------------------------- 
      constant N_MODE  : STD_LOGIC_VECTOR(1 downto 0)  := "00";
      constant RT_MODE : STD_LOGIC_VECTOR(1 downto 0)  := "01";
      constant RR_MODE : STD_LOGIC_VECTOR(1 downto 0)  := "10";
   
    --------------------------------------------------------------------
    -- Sdlc preamble length
    -------------------------------------------------------------------- 
      constant L0_PRE  : STD_LOGIC_VECTOR(1 downto 0)  := "00";
      constant L8_PRE  : STD_LOGIC_VECTOR(1 downto 0)  := "01";
      constant L32_PRE : STD_LOGIC_VECTOR(1 downto 0)  := "10";
      constant L64_PRE : STD_LOGIC_VECTOR(1 downto 0)  := "11";
   
    -------------------------------------------------------------------
    -- Sdlc flags
    -------------------------------------------------------------------
      constant BOF_FL  : STD_LOGIC_VECTOR(7 downto 0)  := "01111110";
      constant PRE_FL  : STD_LOGIC_VECTOR(7 downto 0)  := "01010101";
   
   
   end Utility;

--*******************************************************************--
   -- package body UTILITY is
   -- end UTILITY;
--*******************************************************************--
