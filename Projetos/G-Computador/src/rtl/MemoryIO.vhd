library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is

   PORT(
		-- Sistema
		CLK_SLOW : IN  STD_LOGIC;
		CLK_FAST : IN  STD_LOGIC;
		RST      : IN  STD_LOGIC;

		-- RAM 16K
		ADDRESS		: IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
		INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		LOAD		: IN  STD_LOGIC ;
		OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

		-- LCD EXTERNAL I/OS
		LCD_CS_N     : OUT   STD_LOGIC;
		LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
		LCD_RD_N     : OUT   STD_LOGIC;
		LCD_RESET_N  : OUT   STD_LOGIC;
		LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
		LCD_WR_N     : OUT   STD_LOGIC;
		LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
		LCD_INIT_OK  : OUT   STD_LOGIC;

		-- Switchs
		SW  : in std_logic_vector(9 downto 0);
		LED : OUT std_logic_vector(9 downto 0)

		);
end entity;


ARCHITECTURE logic OF MemoryIO IS

	component Screen is
		PORT(
			INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
			LOAD         : IN  STD_LOGIC;
			ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);

			-- Sistema
			CLK_FAST : IN  STD_LOGIC;
			CLK_SLOW : IN  STD_LOGIC;
			RST 	   : IN  STD_LOGIC;

			-- LCD EXTERNAL I/OS
			LCD_INIT_OK  : OUT STD_LOGIC;
			LCD_CS_N     : OUT   STD_LOGIC;
			LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
			LCD_RD_N     : OUT   STD_LOGIC;
			LCD_RESET_N  : OUT   STD_LOGIC;
			LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
			LCD_WR_N     : OUT   STD_LOGIC
			);
	end component;

	component RAM16K IS
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	end component;

	component Register16 is
		port(
			clock:   in std_logic;
			input:   in STD_LOGIC_VECTOR(15 downto 0);
			load:    in std_logic;
			output: out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component DMux4Way is
		port(
			a: in std_logic;
			sel: in std_logic_vector(1 downto 0);
			q0: out std_logic;
			q1: out std_logic;
			q2: out std_logic;
			q3: out std_logic
			);
	end component;

	component Mux2Way is
		port(
			a: in std_logic;
			b: in std_logic;
			sel: in std_logic;
			q: out std_logic
			);
	end component;

signal selD: std_logic_vector(1 downto 0);
signal selM: std_logic;
signal inputReg: std_logic_vector(9 downto 0);
signal dataRam16: std_logic_vector(14 downto 0);
signal DmuxRam,DmuxReg,DmuxScr: std_logic;
signal outRam: std_logic_vector(15 downto 0);
signal outMux: std_logic_vector(15 downto 0);

BEGIN
	process (ADDRESS,selD,selM)
	begin
		if (ADDRESS < "100000000000000") then -- RAM16k que na vdd é OUTPUT
			selD <= "00";
			selM <= '1';
		elsif (ADDRESS = "101001011000000") then -- LED que na vdd é REGISTER
			selD <= "01";
		elsif (ADDRESS >= "100000000000000") and  (ADDRESS < "101001011000000") then  -- LCD que na vdd é SCREEN
			selD <= "01";
		elsif (ADDRESS = "101001011000001") then
			selM <= '0';
	end if;

	M1: Screen 
			 port map(
				INPUT,
				LOAD,
				ADDRESS(13 downto 0),
				CLK_FAST,
				CLK_SLOW,
				RST,
				LCD_INIT_OK,
				LCD_CS_N,
				LCD_D,
				LCD_RD_N,
				LCD_RESET_N,
				LCD_RS,
				LCD_WR_N
			);

	M2: RAM16K 
			port map(
			    ADDRESS(13 downto 0),
			    CLK_FAST,
			    INPUT(14 downto 0),
			    DmuxRam,
			    outRam
			);

	M3: Register16
			port map(
				CLK_SLOW,
			    INPUT(9 downto 0),
			    DmuxReg,
			    LED
			);
	M4: DMux4Way 
			port map(
				LOAD,
				selD,
				DmuxRam,
				DmuxReg,
				DmuxScr,
				'0'
			);      
	M5: Mux2Way
	        port map(
                "000000" & SW,
                outRam,
                selM,
				OUTPUT


            )
END logic;