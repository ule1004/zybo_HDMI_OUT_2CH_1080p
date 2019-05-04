-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity Loop_loop_height_lbW_rom is 
    generic(
             dwidth     : integer := 8; 
             awidth     : integer := 8; 
             mem_size    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of Loop_loop_height_lbW_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00000000", 1 => "00000010", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00001100", 7 => "00001110", 
    8 => "00010000", 9 => "00010010", 10 => "00010100", 11 => "00010110", 
    12 => "00010111", 13 => "00011001", 14 => "00011011", 15 => "00011101", 
    16 => "00011111", 17 => "00100001", 18 => "00100011", 19 => "00100101", 
    20 => "00100110", 21 => "00101000", 22 => "00101010", 23 => "00101100", 
    24 => "00101110", 25 => "00110000", 26 => "00110001", 27 => "00110011", 
    28 => "00110101", 29 => "00110111", 30 => "00111000", 31 => "00111010", 
    32 => "00111100", 33 => "00111110", 34 => "00111111", 35 => "01000001", 
    36 => "01000011", 37 => "01000101", 38 => "01000110", 39 => "01001000", 
    40 => "01001010", 41 => "01001011", 42 => "01001101", 43 => "01001111", 
    44 => "01010000", 45 => "01010010", 46 => "01010100", 47 => "01010101", 
    48 => "01010111", 49 => "01011001", 50 => "01011010", 51 => "01011100", 
    52 => "01011101", 53 => "01011111", 54 => "01100001", 55 => "01100010", 
    56 => "01100100", 57 => "01100101", 58 => "01100111", 59 => "01101000", 
    60 => "01101010", 61 => "01101011", 62 => "01101101", 63 => "01101110", 
    64 => "01110000", 65 => "01110001", 66 => "01110011", 67 => "01110100", 
    68 => "01110110", 69 => "01110111", 70 => "01111001", 71 => "01111010", 
    72 => "01111100", 73 => "01111101", 74 => "01111111", 75 => "10000000", 
    76 => "10000001", 77 => "10000011", 78 => "10000100", 79 => "10000110", 
    80 => "10000111", 81 => "10001000", 82 => "10001010", 83 => "10001011", 
    84 => "10001100", 85 => "10001110", 86 => "10001111", 87 => "10010000", 
    88 => "10010010", 89 => "10010011", 90 => "10010100", 91 => "10010110", 
    92 => "10010111", 93 => "10011000", 94 => "10011001", 95 => "10011011", 
    96 => "10011100", 97 => "10011101", 98 => "10011110", 99 => "10100000", 
    100 => "10100001", 101 => "10100010", 102 => "10100011", 103 => "10100100", 
    104 => "10100110", 105 => "10100111", 106 => "10101000", 107 => "10101001", 
    108 => "10101010", 109 => "10101011", 110 => "10101101", 111 => "10101110", 
    112 => "10101111", 113 => "10110000", 114 => "10110001", 115 => "10110010", 
    116 => "10110011", 117 => "10110100", 118 => "10110101", 119 => "10110110", 
    120 => "10111000", 121 => "10111001", 122 => "10111010", 123 => "10111011", 
    124 => "10111100", 125 => "10111101", 126 => "10111110", 127 => "10111111", 
    128 => "11000000", 129 => "11000001", 130 => "11000010", 131 => "11000011", 
    132 => "11000100", 133 => "11000101", 134 => "11000110", 135 to 136=> "11000111", 
    137 => "11001000", 138 => "11001001", 139 => "11001010", 140 => "11001011", 
    141 => "11001100", 142 => "11001101", 143 => "11001110", 144 => "11001111", 
    145 to 146=> "11010000", 147 => "11010001", 148 => "11010010", 149 => "11010011", 
    150 => "11010100", 151 to 152=> "11010101", 153 => "11010110", 154 => "11010111", 
    155 => "11011000", 156 to 157=> "11011001", 158 => "11011010", 159 => "11011011", 
    160 to 161=> "11011100", 162 => "11011101", 163 => "11011110", 164 to 165=> "11011111", 
    166 => "11100000", 167 to 168=> "11100001", 169 => "11100010", 170 to 171=> "11100011", 
    172 => "11100100", 173 to 174=> "11100101", 175 => "11100110", 176 to 177=> "11100111", 
    178 to 179=> "11101000", 180 => "11101001", 181 to 182=> "11101010", 183 to 184=> "11101011", 
    185 to 186=> "11101100", 187 to 188=> "11101101", 189 to 190=> "11101110", 191 to 192=> "11101111", 
    193 to 194=> "11110000", 195 to 196=> "11110001", 197 to 198=> "11110010", 199 to 200=> "11110011", 
    201 to 203=> "11110100", 204 to 205=> "11110101", 206 to 208=> "11110110", 209 to 211=> "11110111", 
    212 to 214=> "11111000", 215 to 217=> "11111001", 218 to 221=> "11111010", 222 to 225=> "11111011", 
    226 to 229=> "11111100", 230 to 235=> "11111101", 236 to 243=> "11111110", 244 to 255=> "11111111" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity Loop_loop_height_lbW is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of Loop_loop_height_lbW is
    component Loop_loop_height_lbW_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    Loop_loop_height_lbW_rom_U :  component Loop_loop_height_lbW_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


