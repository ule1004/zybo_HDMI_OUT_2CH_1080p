-------------------------------------------------------------------------------
-- Copyright (c) 2005 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   
-- \   \   \/    Vendor: Xilinx
--  \   \        Filename: convert444to422.vhd
--  /   /        Date Created: Sept 26 2005
-- /___/   /\    
-- \   \  /  \
--  \___\/\___\
-- 
--Device: Any Xilinx family.
--Purpose: VHDL module for converting chroma video in 4:2:2 format to 4:4:4. 
--Reference:
--    XAPP932
--Revision History:
-------------------------------------------------------------------------------
--
-- $RCSfile: convert444to422.vhd,v $ $Revision: 1.13 $ $Date: 2006/04/18 04:39:11 $
--
-- ************************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all; 
--use work.imagexlib_utils.all;

entity convert444to422 is
   generic
   (
      num_taps       :  integer  := 3;              -- coefs must be an array of at least this length. Extra values in array are ignored.
      data_width     :  integer  := 8;
      coef_width     :  integer  := 3;              -- All integer coefficients must add up to 2^(coef_width - 1)
      pad_val        :  integer  := 0;              -- Value used to fill pipeline at image edges - currently same for u and v
      pixel_drop     :  integer  := 1               -- default:0 -- If 1, then filter should be optimised out
--    coefs	         :  INTEGER_ARRAY := (1, 2, 1)   -- Parameterised, but not dynamic.          
   );
   port
	(
      clk               :  in    std_logic;
      ce                :  in    std_logic;
      in_vs             :  in    std_logic;
      in_vb             :  in    std_logic;
      in_hs             :  in    std_logic;
      in_hb             :  in    std_logic;
      din_valid         :  in    std_logic;
      luma_in           :  in    std_logic_vector((data_width-1) downto 0);   -- Brought in for latency equalisation
      cr_in             :  in    std_logic_vector((data_width-1) downto 0);  
      cb_in             :  in    std_logic_vector((data_width-1) downto 0);  
      out_vs            :  out   std_logic;
      out_vb            :  out   std_logic;
      out_hs            :  out   std_logic;
      out_hb            :  out   std_logic;      
      dout_valid        :  out   std_logic;                                    -- Depends upon latency through system
      chroma_out        :  out   std_logic_vector((data_width-1) downto 0);   -- Multiplexed Cr, Cb
      luma_out          :  out   std_logic_vector((data_width-1) downto 0);   -- Latency equalised luma output
      saturate          :  out   std_logic;
      sat_type          :  out   std_logic
   );
end convert444to422;

architecture rtl of convert444to422 is

   component convert444to422_ngc
    generic (
       num_taps       :  integer  := 3;              -- coefs must be an array of at least this length. Extra values in array are ignored.
       data_width     :  integer  := 8;
       coef_width     :  integer  := 3;              -- All integer coefficients must add up to 2^(coef_width - 1)
       pad_val        :  integer  := 0;              -- Value used to fill pipeline at image edges - currently same for u and v
       pixel_drop     :  integer  := 1               -- default:0 -- If 1, then filter should be optimised out
    );
    port (
       clk            :  in    std_logic;
       ce             :  in    std_logic;
       in_vs          :  in    std_logic;
       in_vb          :  in    std_logic;
       in_hs          :  in    std_logic;
       in_hb          :  in    std_logic;
       din_valid      :  in    std_logic;
       luma_in        :  in    std_logic_vector((data_width-1) downto 0);   -- Brought in for latency equalisation
       cr_in          :  in    std_logic_vector((data_width-1) downto 0);  
       cb_in          :  in    std_logic_vector((data_width-1) downto 0);  
       out_vs         :  out   std_logic;
       out_vb         :  out   std_logic;
       out_hs         :  out   std_logic;
       out_hb         :  out   std_logic;      
       dout_valid     :  out   std_logic;                                    -- Depends upon latency through system
       chroma_out     :  out   std_logic_vector((data_width-1) downto 0);   -- Multiplexed Cr, Cb
       luma_out       :  out   std_logic_vector((data_width-1) downto 0);   -- Latency equalised luma output
       saturate       :  out   std_logic;
       sat_type       :  out   std_logic
    );
end component;

begin

 convert444to422_ngc_i : convert444to422_ngc
    generic map (
       num_taps     => num_taps,
       data_width   => data_width,
       coef_width   => coef_width,
       pad_val      => pad_val,
       pixel_drop   => pixel_drop
    )
    port map (
       clk          => clk,
       ce           => ce,
       in_vs        => in_vs,
       in_vb        => in_vb,
       in_hs        => in_hs,
       in_hb        => in_hb,
       din_valid    => din_valid,
       luma_in      => luma_in,
       cr_in        => cr_in,  
       cb_in        => cb_in,  
       out_vs       => out_vs,
       out_vb       => out_vb,
       out_hs       => out_hs,
       out_hb       => out_hb,      
       dout_valid   => dout_valid,
       chroma_out   => chroma_out,
       luma_out     => luma_out,
       saturate     => saturate,
       sat_type     => sat_type
    );

end rtl;