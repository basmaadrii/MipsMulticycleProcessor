library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmulti is
	port(clk, reset: in STD_LOGIC; 
		  WriteData, Adr: inout STD_LOGIC_VECTOR(31 downto 0); 
		  MemWrite: inout STD_LOGIC;
		  FSM: inout STD_LOGIC_VECTOR(15 downto 0);
			---------------------------------------------
			pc, instr, data, aluout, srca, srcb, aluresult, writedata3: inout STD_LOGIC_VECTOR(31 downto 0);
			writereg: inout STD_LOGIC_VECTOR(4 downto 0);
			op, funct: inout STD_LOGIC_VECTOR(5 downto 0));
end topmulti;

architecture Behavioral of topmulti is
	component mipsmulti
		port( clk, reset: in STD_LOGIC;
			ReadData: in STD_LOGIC_VECTOR(31 downto 0);
			MemWrite: out STD_LOGIC;
			Adr, WriteData: out STD_LOGIC_VECTOR(31 downto 0);
			FSM: inout STD_LOGIC_VECTOR(15 downto 0);
			---------------------------------------------
			pc, instr, data, aluout, srca, srcb, aluresult, writedata3: inout STD_LOGIC_VECTOR(31 downto 0);
			op, funct: inout STD_LOGIC_VECTOR(5 downto 0);
			writereg: inout STD_LOGIC_VECTOR(4 downto 0));
end component;
	component idmem
		port(clk, MemWrite: in STD_LOGIC;
			Adr, WriteData: in STD_LOGIC_VECTOR(31 downto 0);
			ReadData: out STD_LOGIC_VECTOR(31 downto 0));
	end component;
	signal ReadData: STD_LOGIC_VECTOR(31 downto 0);
begin
	mips: mipsmulti port map(clk, reset, ReadData, MemWrite, Adr, WriteData, FSM,
										--------------------------------------------------
										pc, instr, data, aluout, srca, srcb, aluresult, writedata3, op, funct, writereg);
	memory: idmem port map(clk, MemWrite, Adr, WriteData, ReadData);
end Behavioral;

