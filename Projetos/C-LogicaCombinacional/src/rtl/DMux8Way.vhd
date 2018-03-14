library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux8Way is
	port ( 
        din : in STD_LOGIC;
        sel : in STD_LOGIC_VECTOR(2 downto 0);
        dout : out STD_LOGIC_VECTOR(7 downto 0)
end entity;

architecture rtl of DMux8Way is
begin
    dout <= (din & "0000000") when (sel="000") else
            ('0' & din & "000000") when (sel="001") else
            ("00" & din & "00000") when (sel="010") else
            ("000" & din & "0000") when (sel="011") else
            ("0000" & din & "000") when (sel="100") else
            ("00000" & din & "00") when (sel="101") else
            ("000000" & din & '0') when (sel="110") else
            ("0000000" & din) ;
end rtl;