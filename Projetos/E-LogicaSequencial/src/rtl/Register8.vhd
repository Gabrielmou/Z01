-- Elementos de Sistemas
-- by Luciano Soares
-- Register8.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Register8 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture rtl of Register8 is

	component BinaryDigit is --Importando o arquivo binary digit
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC);
	end component;

--signal s1,s2: std_logic_vector(15 downto 0); --Caso queira fazer sinais no meio, esses devem ser feitos aqui.

begin
	--Em cada um desses blocos um bit sera passado.
	--Comecara no bit menos significativo ate o mais significativo
	M0: BinaryDigit port map( --Bit mais da esquerda
		clock => clock,
		input => input(0),
		load => load,
		output => output(0)
	);

	M1: BinaryDigit port map(
		clock => clock,
		input => input(1),
		load => load,
		output => output(1)
	);

	M2: BinaryDigit port map(
		clock => clock,
		input => input(2),
		load => load,
		output => output(2)
	);

	M3: BinaryDigit port map(
		clock => clock,
		input => input(3),
		load => load,
		output => output(3)
	);

	M4: BinaryDigit port map(
		clock => clock,
		input => input(4),
		load => load,
		output => output(4)
	);

	M5: BinaryDigit port map(
		clock => clock,
		input => input(5),
		load => load,
		output => output(5)
	);

	M6: BinaryDigit port map(
		clock => clock,
		input => input(6),
		load => load,
		output => output(6)
	);

	M7: BinaryDigit port map( --Bit mais da direita
		clock => clock,
		input => input(7),
		load => load,
		output => output(7)
	);

end rtl;
