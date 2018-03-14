library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux8Way is
	port ( 
<<<<<<< HEAD
        din : in STD_LOGIC;
        sel : in STD_LOGIC_VECTOR(2 downto 0);
        dout : out STD_LOGIC_VECTOR(7 downto 0)
end entity;

architecture rtl of DMux8Way is
begin
    dout <= (din & "0000000") when (sel="000") else
            ('0' & din & "000000") when (sel="001") else
            ("00" & din & "00000") when (sel="010") else
            ("000" & din & "0000") when (sel="011") else
            ("0000" & din & "000") when (sel="100") else
            ("00000" & din & "00") when (sel="101") else
            ("000000" & din & '0') when (sel="110") else
            ("0000000" & din) ;
end rtl;
=======
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
end entity;

architecture rtl of Dmux8Way is
begin
	process (a, sel)
		begin
		if (sel = "000") then
			q2 <= '0';  
			q1 <= '0';
			q0 <= a;
			q3 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';
		elsif (sel = "001") then
			q2 <= '0';  
			q0 <= '0';
			q1 <= a;
			q3 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';
		elsif (sel = "010") then
			q0 <= '0';  
			q1 <= '0';
			q2 <= a;
			q3 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';

		elsif (sel = "011") then
			q2 <= '0';  
			q1 <= '0';
			q3 <= a;
			q0 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';

		elsif (sel = "100") then
			q2 <= '0';  
			q1 <= '0';
			q4 <= a;
			q0 <= '0';
			q3 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';

		elsif (sel = "101") then
			q2 <= '0';  
			q1 <= '0';
			q5 <= a;
			q0 <= '0';
			q4 <= '0';  
			q3 <= '0';
			q6 <= '0';
			q7 <= '0';

		elsif (sel = "110") then
			q2 <= '0';  
			q1 <= '0';
			q6 <= a;
			q0 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q3 <= '0';
			q7 <= '0';

		else
			q2 <= '0';  
			q1 <= '0';
			q7 <= a;
			q0 <= '0';
			q4 <= '0';  
			q5 <= '0';
			q6 <= '0';
			q3 <= '0';
		end if;
		end process;
		end rtl;
>>>>>>> 55a70c373790fbb0f175b82536e22b26bc9c745e
