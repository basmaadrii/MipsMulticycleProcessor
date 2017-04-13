library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mipsmulti is
	port( clk, reset: in STD_LOGIC;
			ReadData: in STD_LOGIC_VECTOR(31 downto 0);
			MemWrite: out STD_LOGIC;
			Adr, WriteData: out STD_LOGIC_VECTOR(31 downto 0);
			FSM: inout STD_LOGIC_VECTOR(15 downto 0);
			---------------------------------------------
			pc, instr, data, aluout, srca, srcb, aluresult, writedata3: inout STD_LOGIC_VECTOR(31 downto 0);
			op, funct: inout STD_LOGIC_VECTOR(5 downto 0);
			writereg: inout STD_LOGIC_VECTOR(4 downto 0));
end mipsmulti;

architecture Behavioral of mipsmulti is

	component controller
	port( clk, reset, zero: in STD_LOGIC;
			op, funct: in STD_LOGIC_VECTOR(5 downto 0);
			IorD, MemWrite, IRWrite, RegDst,
			MemtoReg, RegWrite,ALUSrcA, PCEn: out STD_LOGIC;
			ALUSrcB, PCSrc: out STD_LOGIC_VECTOR(1 downto 0);
			ALUControl: out STD_LOGIC_VECTOR(2 downto 0);
			FSM: inout STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component datapath
	port( clk, reset, PCEn, IorD, IRWrite, RegDst, MemtoReg, RegWrite, ALUSrcA: in STD_LOGIC;
			ALUSrcB, PCSrc: in STD_LOGIC_VECTOR(1 downto 0);
			ALUControl: in STD_LOGIC_VECTOR(2 downto 0);
			ReadData: in STD_LOGIC_VECTOR(31 downto 0);
			op, funct: out STD_LOGIC_VECTOR(5 downto 0);
			Adr: out STD_LOGIC_VECTOR(31 downto 0);
			zero: out STD_LOGIC;
			WriteData: out STD_LOGIC_VECTOR(31 downto 0);
			---------------------------------------------
			pc, instr, data, aluout, srca, srcb, aluresult, writedata3: inout STD_LOGIC_VECTOR(31 downto 0);
			writereg: inout STD_LOGIC_VECTOR(4 downto 0));
	end component;
	
	signal IorD, IRWrite, PCEn, ALUSrcA, RegWrite, RegDst, MemtoReg, zero: STD_LOGIC;
	signal PCSrc, ALUSrcB: STD_LOGIC_VECTOR(1 downto 0);
	signal ALUControl: STD_LOGIC_VECTOR(2 downto 0);
	
begin
cont: controller port map(clk, reset, zero, op, funct, IorD, MemWrite, IRWrite, RegDst,
								  MemtoReg, RegWrite,ALUSrcA, PCEn, ALUSrcB, PCSrc, ALUControl, FSM);
dp: datapath port map(clk, reset, PCEn, IorD, IRWrite, RegDst, MemtoReg, RegWrite, ALUSrcA,
							 ALUSrcB, PCSrc, ALUControl, ReadData, op, funct, Adr, zero, WriteData,
                      ------------------------------------------------
							 pc, instr, data, aluout, srca, srcb, aluresult, writedata3, writereg); 
							 
end Behavioral;

