-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture rtl of BinaryDigit is 

	component Mux2Way is
		port ( 
				a:   in  STD_LOGIC;
				b:   in  STD_LOGIC;
				sel: in  STD_LOGIC;
				q:   out STD_LOGIC
				);
	end component;

	component FlipFlopD is
		port(
			clock:  in std_logic;
			d:      in std_logic;
			clear:  in std_logic;
			preset: in std_logic;
			q:     out std_logic
		);
	end component;

	SIGNAL out_mux, out_dff : std_logic;
begin 
	
	mux: Mux2Way port map (out_dff,input,load,out_mux);

	dff: FlipFlopD port map (clock => clock,clear => '0',preset => '0',d => out_mux,q => out_dff);
	
	output <= out_dff;
end architecture;
