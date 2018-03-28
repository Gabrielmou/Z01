-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee; 
use ieee.std_logic_1164.all;

entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

--Importando Ram8 , Mux8Way16 e Dmux8Way
architecture rtl of Ram64 is
	component Ram8
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 2 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
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

	component DMux8Way 
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

--O signal abaixo serve para criar os registers ---
--Eles serao modificados com o tempo e de acordo com a necessidade do usuario.---
signal w1,w2,w3,w4,w5,w6,w7,w8: STD_LOGIC_VECTOR(15 downto 0);
--O signal abaixo serve para que a resposta dada pelo DMux8Way saia em binario.--
--Cada um dos register de 16 bits tera sua propria saida que so sera alterada caso o address e o load sofram alteracoes.-------------------------------------
signal v0,v1,v2,v3,v4,v5,v6,v7: std_logic;

begin 
	D0: Dmux8Way port map(load, address(5 downto 3),v0,v1,v2,v3,v4,v5,v6,v7); -- Escolhendo para qual register o load sera designado, dependendo do addres--
	--Os passos D1 ate D8 serao a descricao de qual deve ser o output de cada register
	D1: Ram8 port map (clock,input,load,address( 2 downto 0 ),w1);
	D2: Ram8 port map (clock,input,load,address( 2 downto 0),w2);
	D3: Ram8 port map (clock,input,load,address( 2 downto 0 ),w3);
	D4: Ram8 port map (clock,input,load,address( 2 downto 0 ),w4);
	D5: Ram8 port map (clock,input,load,address( 2 downto 0 ),w5);
	D6: Ram8 port map (clock,input,load,address( 2 downto 0 ),w6);
	D7: Ram8 port map (clock,input,load,address( 2 downto 0 ),w7);
	D8: Ram8 port map (clock,input,load,address( 2 downto 0 ),w8);
	--Fim da modificacao dos registers.
	--O passo D9 diz qual sera o register que sofrera o output, de acordo com o address
	D9: Mux8Way16 port map (w1,w2,w3,w4,w5,w6,w7,w8,address(5 downto 3),output);	
end rtl;
