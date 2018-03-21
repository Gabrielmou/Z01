-- Elementos de Sistemas
-- by Luciano Soares
-- HalfAdder.vhd

-- Implementa Half Adder

Library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	port(
		a,b:         in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of HalfAdder is

begin
--Para entender a lógica ver a seguinte imagem:
-- https://commons.wikimedia.org/wiki/File:Half_Adder.svg
	soma <= a xor b;
	vaium <= a and b;

end architecture;
