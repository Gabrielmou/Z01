-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram4k is
	component Ram512 is
		port(
			clock   in  STD_LOGIC;
			input   in  STD_LOGIC_VECTOR(15 downto 0);
			load    in  STD_LOGIC;
			address in  STD_LOGIC_VECTOR( 8 downto 0);
			output  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is --Importando Mux8Way16
	port(
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

	component DMux8Way is --Importando Dmux8Way
	port(
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

signal t1,t2,t3,t4,t5,t6,t7,t8    STD_LOGIC_VECTOR(15 downto 0);
signal i1,i2,i3,i4,i5,i6,i7,i8 STD_LOGIC;

begin 
	R0 Dmux8Way port map(load, address(11 downto 9),i1,i2,i3,i4,i5,i6,i7,i8);
	R1 Ram512 port map (clock,input,load,address( 8 downto 0 ),t1);
	R2 Ram512 port map (clock,input,load,address( 8 downto 0 ),t2);
	R3 Ram512 port map (clock,input,load,address( 8 downto 0 ),t3);
	R4 Ram512 port map (clock,input,load,address( 8 downto 0 ),t4);
	R5 Ram512 port map (clock,input,load,address( 8 downto 0 ),t5);
	R6 Ram512 port map (clock,input,load,address( 8 downto 0 ),t6);
	R7 Ram512 port map (clock,input,load,address( 8 downto 0 ),t7);
	R8 Ram512 port map (clock,input,load,address( 8 downto 0 ),t8);
	R9 Mux8Way16 port map(t1,t2,t3,t4,t5,t6,t7,t8,address(11 downto 9),output);

end rtl;
 
