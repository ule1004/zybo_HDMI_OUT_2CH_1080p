----------------------------------
-- rs170_std_out_ctrl.vhd
-- 2017/04/24
----------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library unisim;
use unisim.vcomponents.all;

entity rs170_std_out_ctrl is
    port( 
        clk_27mhz           : in  std_logic;
        reset_n             : in  std_logic;
        i_lock              : in  std_logic;
        i_vs                : in  std_logic;
        i_vb                : in  std_logic;
        i_hs                : in  std_logic;
        i_hb                : in  std_logic;
        i_fid               : in  std_logic;
        i_de                : in  std_logic;
        i_data              : in  std_logic_vector( 7 downto 0);
        
        rs170_clk           : out std_logic;
        rs170_resetn        : out std_logic;
        rs170_vsync         : out std_logic;
        rs170_hsync         : out std_logic;
        rs170_blank         : out std_logic;
        rs170_field         : out std_logic;
        rs170_data          : out std_logic_vector( 7 downto 0)
    );
end rs170_std_out_ctrl;

architecture Behavioral of rs170_std_out_ctrl is

  component rs170_std_out_ctrl_ngc
    port( 
        clk_27mhz           : in  std_logic;
        reset_n             : in  std_logic;
        i_lock              : in  std_logic;
        i_vs                : in  std_logic;
        i_vb                : in  std_logic;
        i_hs                : in  std_logic;
        i_hb                : in  std_logic;
        i_fid               : in  std_logic;
        i_de                : in  std_logic;
        i_data              : in  std_logic_vector( 7 downto 0);
        
        rs170_clk           : out std_logic;
        rs170_resetn        : out std_logic;
        rs170_vsync         : out std_logic;
        rs170_hsync         : out std_logic;
        rs170_blank         : out std_logic;
        rs170_field         : out std_logic;
        rs170_data          : out std_logic_vector( 7 downto 0)
    );
  end component;
      
begin

  rs170_std_out_ctrl_ngc_i : rs170_std_out_ctrl_ngc
    port map( 
        clk_27mhz	  => clk_27mhz,
        reset_n       => reset_n,
        i_lock        => i_lock,
        i_vs          => i_vs,
        i_vb          => i_vb,
        i_hs          => i_hs,
        i_hb          => i_hb,
        i_fid         => i_fid,
        i_de          => i_de,
        i_data        => i_data,
        
        rs170_clk     => rs170_clk,
        rs170_resetn  => rs170_resetn,
        rs170_vsync   => rs170_vsync,
        rs170_hsync   => rs170_hsync,
        rs170_blank   => rs170_blank,
        rs170_field   => rs170_field,
        rs170_data    => rs170_data
    );
    
end Behavioral;

