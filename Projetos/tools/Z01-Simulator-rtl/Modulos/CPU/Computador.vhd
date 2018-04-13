-------------------------------------------------------------------
-- Elementos de Sistemas
-------------------------------------------------------------------
-- Luciano Pereira
-------------------------------------------------------------------
-- Descricao :
-- Entidade central do desenvolvimento do computador
-------------------------------------------------------------------
-- Historico:
--  29/11/2016 : Criacao do projeto
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Computador is
  
   PORT(
        -- Sistema
        CLK_FAST   : IN    STD_LOGIC;
        CLK_SLOW   : in    STD_LOGIC;
        RESET_N      : IN    STD_LOGIC;
        LEDR         : OUT   STD_LOGIC_VECTOR(9 DOWNTO 0);
        SW           : IN    STD_LOGIC_VECTOR(9 DOWNTO 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	      -- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC;	-- liga e desliga o LCD

        -- Teclado
        key_clk      : IN    STD_LOGIC;         -- clock signal from PS/2 keyboard
        key_data     : IN    STD_LOGIC          -- data signal from PS/2 keyboard
       );
end entity;


ARCHITECTURE logic OF Computador IS

	component CPU is
		 port(
			  clock:	     in  STD_LOGIC;
			  inM:         in  STD_LOGIC_VECTOR(15 downto 0);
			  instruction: in  STD_LOGIC_VECTOR(15 downto 0);
			  reset:       in  STD_LOGIC;
			  outM:        out STD_LOGIC_VECTOR(15 downto 0);
			  writeM:      out STD_LOGIC;
			  addressM:    out STD_LOGIC_VECTOR(14 downto 0);
			  pcout:       out STD_LOGIC_VECTOR(14 downto 0)
	  );
	end component;

	component ROM32K IS
		PORT
		(
			address	 : IN STD_LOGIC_VECTOR (14 DOWNTO 0);
			clock	 : IN STD_LOGIC  := '1';
			q		 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END component;

  component RAM16K IS
    PORT
      (
        address	: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
        clock		: IN STD_LOGIC  := '1';
        data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        wren		: IN STD_LOGIC ;
        q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
  end component;

 
SIGNAL INPUT    : STD_LOGIC_VECTOR(15 downto 0) := "1111111111111111";
SIGNAL ADDRESS  : STD_LOGIC_VECTOR(14 downto 0) := (others => '0') ; -- meio 00100101101010
SIGNAL LOAD     : STD_LOGIC := '0';
SIGNAL LCD_INIT_OK : STD_LOGIC;

signal RESET : STD_LOGIC;

SIGNAL OUTPUT_RAM    : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL INSTRUCTION   : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL PC			 : STD_LOGIC_VECTOR(14 downto 0);

begin

  MAIN_CPU : CPU PORT MAP (
            clock       => CLK_SLOW,
            inM         => OUTPUT_RAM,
            instruction => INSTRUCTION,
            reset       => RESET,
            outM        => INPUT,
            writeM      => LOAD,
            addressM    => ADDRESS,
            pcout       => PC
	);

	ROM : ROM32K PORT MAP (
            address	 => PC(14 downto 0),
            clock	 => CLK_SLOW,
            q		 => INSTRUCTION
    );

  RAM: RAM16K
    PORT MAP(
      address	=> ADDRESS(14 downto 0),
      clock		=> CLK_FAST,
      data		=> INPUT,
      wren		=> LOAD,
      q		    => OUTPUT_RAM
      );


    RESET <= not RESET_N;

end logic;
