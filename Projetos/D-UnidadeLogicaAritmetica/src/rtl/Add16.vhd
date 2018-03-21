-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is

-- Usaremos Portmap do módulo FullAdder

component FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

-- Guarda o carry

signal s : STD_LOGIC_VECTOR(15 downto 0);

begin

-- Soma , para cada bit, um ao outro e guarda o resultado e o carry(para o bit seguinte).

s1 : FullAdder port map(
		a     => a(0),
		b     => b(0),
		c     => '0',
		soma  => q(0),
		vaium => s(0)
	);

s2 : FullAdder port map(
		a     => a(1),
		b     => b(1),
		c     => s(0),
		soma  => q(1),
		vaium => s(1)
	);

s3 : FullAdder port map(
		a     => a(2),
		b     => b(2),
		c     => s(1),
		soma  => q(2),
		vaium => s(2)
	);

s4 : FullAdder port map(
		a     => a(3),
		b     => b(3),
		c     => s(2),
		soma  => q(3),
		vaium => s(3)
	);
s5 : FullAdder port map(
		a     => a(4),
		b     => b(4),
		c     => s(3),
		soma  => q(4),
		vaium => s(4)
	);
s6 : FullAdder port map(
		a     => a(5),
		b     => b(5),
		c     => s(4),
		soma  => q(5),
		vaium => s(5)
	);
s7 : FullAdder port map(
		a     => a(6),
		b     => b(6),
		c     => s(5),
		soma  => q(6),
		vaium => s(6)
	);
s8 : FullAdder port map(
		a     => a(7),
		b     => b(7),
		c     => s(6),
		soma  => q(7),
		vaium => s(7)
	);
s9 : FullAdder port map(
		a     => a(8),
		b     => b(8),
		c     => s(7),
		soma  => q(8),
		vaium => s(8)
	);
s10 : FullAdder port map(
		a     => a(9),
		b     => b(9),
		c     => s(8),
		soma =>  q(9),
		vaium => s(9)
	);
s11 : FullAdder port map(
		a     => a(10),
		b     => b(10),
		c     => s(9),
		soma  => q(10),
		vaium => s(10)
	);
s12 : FullAdder port map(
		a     => a(11),
		b     => b(11),
		c     => s(10),
		soma  => q(11),
		vaium => s(11)
	);
s13 : FullAdder port map(
		a     => a(12),
		b     => b(12),
		c     => s(11),
		soma  => q(12),
		vaium => s(12)
	);
s14 : FullAdder port map(
		a     => a(13),
		b     => b(13),
		c     => s(12),
		soma  => q(13),
		vaium => s(13)
	);
s15 : FullAdder port map(
		a     => a(14),
		b     => b(14),
		c     => s(13),
		soma  => q(14),
		vaium => s(14)
	);
s16 : FullAdder port map(
		a     => a(15),
		b     => b(15),
		c     => s(14),
		soma  => q(15),
		vaium => open
);

end architecture;
