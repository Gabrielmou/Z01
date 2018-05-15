-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- GRUPO B

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(15 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
                                                                     -- Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

signal Sig : std_logic;
begin

Sig <= instruction(15);

-- MUX
muxALUI_A <= not Sig;
muxAM_ALU <= Sig and instruction(14);
muxSD_ALU <= Sig and not instruction(13);

-- CONTROLE
zx <= Sig and instruction(12);
nx <= Sig and instruction(11);
zy <= Sig and instruction(10);
ny <= Sig and instruction(9);
f <= Sig and instruction(8);
no <= Sig and instruction(7);

-- LOAD
loadA <= (Sig and instruction(6)) or (not instruction(15));
loadS <= Sig and instruction(5);
loadD <= Sig and instruction(4);
loadM <= Sig and instruction(3);
loadPC <= ((instruction(2) and ng) or
		(instruction(1) and zr) or
		(instruction(0) and (not zr) and (not ng))) and 
		instruction(15);

end architecture;
