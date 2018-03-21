-- Elementos de Sistemas
-- by Luciano Soares
-- comparador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparador16 is
   port(
	     a    : in STD_LOGIC_VECTOR(15 downto 0);
       zr   : out STD_LOGIC;
       ng   : out STD_LOGIC
   );
end comparador16;

architecture rtl of comparador16 is

begin

-- Compara se um vetor de 16 bits é igual a zero se for, faz com que o sinal zr seja igual a ‘1, caso contrário ‘0’.

zr <= '1' when (a = "0000000000000000") else
'0';
--  Se o sinal for negativo faz com que ng seja igual a ‘1’, caso contrário (positivo) ‘0’. 

ng <= '1' when (a(15) = '1') else 
'0'; 

end architecture;
