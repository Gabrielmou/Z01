-- Elementos de Sistemas
-- by Luciano Soares
-- Ram512.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram512 is
	component Ram64
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 5 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component DMux8Way
			port ( 
					a:   in  STD_LOGIC;
					sel: in  STD_LOGIC_VECTOR(2 downto 0);
					q0:  out STD_LOGIC;
					q1:  out STD_LOGIC;
					q2:  out STD_LOGIC;
					q3:  out STD_LOGIC;
					q4:  out STD_LOGIC;
					q5:  out STD_LOGIC;
					q6:  out STD_LOGIC;
					q7:  out STD_LOGIC
				);

	end component;

	component Mux8Way16
		port ( 
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR(2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;
signal w1,w2,w3,w4,w5,w6,w7,w8:   STD_LOGIC_VECTOR(15 downto 0);
signal v1, v2, v3, v4, v5, v6, v7, v8: STD_LOGIC;

begin
	e0: DMux8Way port map(load, address(8 downto 6), v1, v2, v3, v4, v5, v6, v7, v8);
	e1: Ram64 port map (clock,input,load,address( 5 downto 0 ),w1);
	e2: Ram64 port map (clock,input,load,address( 5 downto 0),w2);
	e3: Ram64 port map (clock,input,load,address( 5 downto 0 ),w3);
	e4: Ram64 port map (clock,input,load,address( 5 downto 0 ),w4);
	e5: Ram64 port map (clock,input,load,address( 5 downto 0 ),w5);
	e6: Ram64 port map (clock,input,load,address( 5 downto 0 ),w6);
	e7: Ram64 port map (clock,input,load,address( 5 downto 0 ),w7);
	e8: Ram64 port map (clock,input,load,address( 5 downto 0 ),w8);
	e9: Mux8Way16 port map (w1,w2,w3,w4,w5,w6,w7,w8,address(8 downto 6),output);
end rtl;

