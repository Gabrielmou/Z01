library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevel is
	port ( --Portas logicas da equacao e saida
		SW: in std_logic_vector(2 downto 0);
		LEDR: out std_logic_vector(2 downto 0)
		);
end TopLevel;

architecture rtl of TopLevel is
	component And16 is --Importando o vhdl And16
	port(
		a: in STD_LOGIC_VECTOR(15 downto 0);
		b: in STD_LOGIC_VECTOR(15 downto 0);
		q: out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component Not16 is --Importando o vhdl Not16
	port(
		a: in STD_LOGIC_VECTOR(15 downto 0);
		q: out STD_LOGIC_VECTOR(15 downto 0));
	end component;


signal s1,s2: std_logic_vector(15 downto 0);
signal aa,bb,cc: std_logic_vector(14 downto 0); --Fazendo 16 bits para cada entrada


begin
	M1: And16 port map( --Fazendo A e C => (AC)
		a => (aa & SW(0)),
		b => (cc & SW(2)),
		q => s1);
	M2: Not16 port map( --Fazendo Not B => (not B)
		a => (bb & SW(1)),
		q => s2);
	M3: And16 port map( -- Fazendo a equacao => (A e not B e C)
		a => s1,
		b => s2,
		q(0) => LEDR(0));

end rtl;
