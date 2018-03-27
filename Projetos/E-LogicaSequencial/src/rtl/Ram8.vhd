-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram8 is

	component Register16 is --Importando o register16
	port (
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
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

---------------------------------------------------------------------------------
--O signal abaixo serve para criar os registers que ainda nao existem.-----------
--Eles serao modificados com o tempo e de acordo com a necessidade do usuario.---
--Por enquanto, todos comecam com o valor 0.-------------------------------------
signal r0,r1,r2,r3,r4,r5,r6,r7: std_logic_vector(15 downto 0);-------------------
---------------------------------------------------------------------------------
--O signal abaixo serve para que a resposta dada pelo DMux8Way saia em binario.--
--Cada um dos register de 16 bits tera sua propria saida que so sera alterada----
--caso o address e o load sofram alteracoes.-------------------------------------
signal v0,v1,v2,v3,v4,v5,v6,v7: std_logic;---------------------------------------
---------------------------------------------------------------------------------

begin

	M0: DMux8Way port map(--Escolhendo para qual register o load sera designado, dependendo do address
		a => load,
		sel => address,
		q0 => v0,
		q1 => v1,
		q2 => v2,
		q3 => v3,
		q4 => v4,
		q5 => v5,
		q6 => v6,
		q7 => v7 
		
	);

--Os passos M1 ate M8 serao a descricao de qual deve ser o output de cada register
--Apenas o register que foi enderecado pelo address sera modificado.
--Os outros continuarao exatamente da mesma forma.
	M1: Register16 port map(
		clock => clock,
		input => input,
		load => v0,
		output => r0
	);

	M2: Register16 port map(
		clock => clock,
		input => input,
		load => v1,
		output => r1
	);

	M3: Register16 port map(
		clock => clock,
		input => input,
		load => v2,
		output => r2
	);

	M4: Register16 port map(
		clock => clock,
		input => input,
		load => v3,
		output => r3
	);

	M5: Register16 port map(
		clock => clock,
		input => input,
		load => v4,
		output => r4
	);

	M6: Register16 port map(
		clock => clock,
		input => input,
		load => v5,
		output => r5
	);

	M7: Register16 port map(
		clock => clock,
		input => input,
		load => v6,
		output => r6
	);

	M8: Register16 port map(
		clock => clock,
		input => input,
		load => v7,
		output => r7
	);
--Fim da modificacao dos registers.
--O passo M9 diz qual sera o register que sofrera o output, de acordo com o address
	M9: Mux8Way16 port map(
		a => r0,
		b => r1,
		c => r2,
		d => r3,
		e => r4,
		f => r5,
		g => r6,
		h => r7,
		sel => address,
		q => output
	);

end rtl;
