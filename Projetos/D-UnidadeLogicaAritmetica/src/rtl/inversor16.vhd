-- Elementos de Sistemas
-- by Luciano Soares
-- inversor16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inversor16 is
   port(z   : in STD_LOGIC;
	     a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
   );
end entity;

architecture rtl of inversor16 is
--Cria um novo sinal b de 16bits
signal b : STD_LOGIC_VECTOR(15 downto 0);

begin
--Padroniza esse sinal se z=1
b <= (others => '1') when z = '1' else (others => '0');
--Inverte
y <= b xor a;

end architecture;
