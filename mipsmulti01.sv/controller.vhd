library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
	port( clk, reset, zero: in STD_LOGIC;
			op, funct: in STD_LOGIC_VECTOR(5 downto 0);
			IorD, MemWrite, IRWrite, RegDst,
			MemtoReg, RegWrite,ALUSrcA, PCEn: out STD_LOGIC;
			ALUSrcB, PCSrc: out STD_LOGIC_VECTOR(1 downto 0);
			ALUControl: out STD_LOGIC_VECTOR(2 downto 0);
			FSM: inout STD_LOGIC_VECTOR(15 downto 0));
end controller;

architecture Behavioral of controller is
	component maindec
	port(clk, Reset: in STD_LOGIC;
		  op: in STD_LOGIC_VECTOR(5 downto 0);
		  IorD, MemWrite, IRWrite, PCWrite, Branch, AluSrcA, RegWrite, MemtoReg, RegDst: out STD_LOGIC;
		  AluOp, AluSrcB, PcSrc: out STD_LOGIC_VECTOR(1 downto 0);
		  FSM: inout STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component aludec
	port(Funct: in STD_LOGIC_VECTOR(5 downto 0);
		  AluOp: in STD_LOGIC_VECTOR(1 downto 0);
		  AluControl: out STD_LOGIC_VECTOR(2 downto 0));
	end component;
	signal AluOp: STD_LOGIC_VECTOR(1 downto 0);
	signal PCWrite, Branch: STD_LOGIC;
begin
md: maindec port map(clk, Reset, Op,IorD, MemWrite, IRWrite, PcWrite, Branch, 
							AluSrcA, RegWrite, MemtoReg, RegDst,AluOp, AluSrcB, PcSrc, FSM);
ad: aludec port map(Funct, AluOp, AluControl);
PcEn <= PCWrite OR (Branch AND zero);
end Behavioral;

