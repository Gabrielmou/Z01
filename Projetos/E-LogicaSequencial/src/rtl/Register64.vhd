-- Elementos de Sistemas
-- by Luciano Soares
-- Register64.vhd

Library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity Register64 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(63 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(63 downto 0)
	);
end entity;

architecture rtl of Register64 is
--Declarando componentes a importar
	component Register32 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(31 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;

begin 


-- Primeiros bits da esquerda
	A2: Register32 port  map (
		clock => clock, 
		input => input(63 downto 32), 
		load => load, 
		output => output(63 downto 32)
		);


-- Ultimos bits da direita
	A3: Register32 port  map (
		clock => clock, 
		input => input(31 downto 0), 
		load => load, 
		output => output(31 downto 0)
		);

end rtl;