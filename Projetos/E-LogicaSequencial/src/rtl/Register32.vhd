-- Elementos de Sistemas
-- by Luciano Soares
-- Register32.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Register32 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(31 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture rtl of Register32 is
--Declarando componentes a importar
	component Register16 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(15 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;


begin 


-- Primeiros bits da esquerda
	A2: Register16 port  map (
		clock => clock, 
		input => input(15 downto 0), 
		load => load, 
		output => output(15 downto 0)
		);


-- Ultimos bits da direita
	A3: Register16 port  map (
		clock => clock, 
		input => input(31 downto 16), 
		load => load, 
		output => output(31 downto 16)
		);

end rtl;

