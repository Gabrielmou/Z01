library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter8 is
  	port (
		rst_a       : in  std_logic;                     -- reset input
		shift_lt : in  bit ;                             -- shift left
		shift_rt     : in  bit ;                         -- shift right
		d_in        : in  bit_vector(7 downto 0);        -- parallel data input
		clk         : in  bit;                           -- clock input
		d_out       : out bit_vector(7 downto 0);        -- barrel shifted output
		shift_by    : in  bit_vector(2 downto 0));       -- how much it should be shifted
end entity;

architecture beh of BarrelShifter8 is

--left shifting function 
  function shift_lft (constant d :bit_vector(7 downto 0); signal shift1 :bit_vector(2 downto 0))
    return bit_vector is
    begin
       case shift1 is
       when "000" => return d;        --without shifting
       when "001" => return d rol 1;  --shift left by 1
       when "010" => return d rol 2;  --shift left by 2
       when "011" => return d rol 3;  --shift left by 3
       when "100" => return d rol 4;  --shift left by 4
       when "101" => return d rol 5;  --shift left by 5
       when "110" => return d rol 6;  --shift left by 6
       when "111" => return d rol 7;  --shift left by 7
       end case;
    return d;
   end shift_lft;

--right shifting function
   function shift_rgt (constant d :bit_vector(7 downto 0); signal shift1 :bit_vector(2 downto 0))
    return bit_vector is
    begin
       case shift1 is
       when "000" => return d;        --without shifting
       when "001" => return d ror 1;  --shift right by 1
       when "010" => return d ror 2;  --shift right by 2
       when "011" => return d ror 3;  --shift right by 3
       when "100" => return d ror 4;  --shift right by 4
       when "101" => return d ror 5;  --shift right by 5
       when "110" => return d ror 6;  --shift right by 6
       when "111" => return d ror 7;  --shift right by 7
       end case;
    return d;
   end shift_rgt;

                                  
begin  -- beh

shifter: process (clk,rst_a,shift_by,d_in,shift_lt,shift_rt)
variable tmp : bit_vector(7 downto 0);
begin  -- process shifter
 if rst_a = '1' then
    d_out<= "00000000";
    tmp:=d_in;
  elsif clk'event and clk='1' then
  if shift_lt=shift_rt then      -- parallel load 
    assert(false) report "parallel load" severity warning;
      tmp:=d_in;
  elsif shift_lt>shift_rt then   -- shift left
    assert(false) report "left operation" severity warning;
      tmp:=shift_lft(tmp,shift_by);
   elsif shift_lt<shift_rt then  -- shift right
    assert(false) report "right operation" severity warning;
      tmp:=shift_rgt(tmp,shift_by);
   end if;  
d_out<=tmp;
end if;
end process shifter;
end beh;
