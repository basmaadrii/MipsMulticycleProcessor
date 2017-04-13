library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
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
end datapath;

architecture Behavioral of datapath is
	component alu 
		port(a, b: in  STD_LOGIC_VECTOR(31 downto 0);
			  alucontrol: in  STD_LOGIC_VECTOR(2 downto 0); 
			  result: inout STD_LOGIC_VECTOR(31 downto 0); 
			  zero: out STD_LOGIC); 
	end component; 
	component regfile 
		port(clk: in  STD_LOGIC; 
			  we3: in  STD_LOGIC; 
			  ra1, ra2, wa3: in  STD_LOGIC_VECTOR(4 downto 0); 
			  wd3: in  STD_LOGIC_VECTOR(31 downto 0); 
			  rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0)); 
	end component; 
	component sl2 
		port(a: in  STD_LOGIC_VECTOR(31 downto 0); 
			  y: out STD_LOGIC_VECTOR(31 downto 0)); 
	end component; 
	component signext 
		port(a: in  STD_LOGIC_VECTOR(15 downto 0); 
			  y: out STD_LOGIC_VECTOR(31 downto 0)); 
	end component; 
	component flopr 
		generic(width: integer); 
		port(clk, reset: in  STD_LOGIC; 
			  d: in  STD_LOGIC_VECTOR(width-1 downto 0); 
			  q: out STD_LOGIC_VECTOR(width-1 downto 0)); 
	end component; 
	component flopr2 
		generic(width: integer); 
		port(clk, reset: in  STD_LOGIC; 
			  d1, d2: in  STD_LOGIC_VECTOR(width-1 downto 0); 
			  q1, q2: out STD_LOGIC_VECTOR(width-1 downto 0)); 
	end component; 
	component flopren 
		generic(width: integer); 
		port(clk, reset, enable: in  STD_LOGIC; 
			  d: in  STD_LOGIC_VECTOR(width-1 downto 0); 
			  q: out STD_LOGIC_VECTOR(width-1 downto 0)); 
	end component; 
	component mux2 
		generic(width: integer); 
		port(d0, d1: in  STD_LOGIC_VECTOR(width-1 downto 0); 
			  s: in  STD_LOGIC; 
			  y: out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;
	component mux4
		generic(width: integer); 
		port(d0, d1, d2, d3: in  STD_LOGIC_VECTOR(width-1 downto 0); 
			  s: in  STD_LOGIC_VECTOR(1 downto 0); 
			  y: out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;
	
	signal pcnext, pcjump: STD_LOGIC_VECTOR(31 downto 0);
	signal readdata1, readdata2, A, b: STD_LOGIC_VECTOR(31 downto 0);
	signal signimm, signimmshift: STD_LOGIC_VECTOR(31 downto 0);
	
begin
	pcjump <= pc(31 downto 28) & instr(25 downto 0) & "00";
	pcreg: flopren generic map(32) port map(clk, reset, PCEn, pcnext, pc);
	adrmux: mux2 	generic map(32) port map(pc, aluout, IorD, Adr);
	pcmux:  mux4   generic map(32) port map(aluresult, aluout, pcjump, x"00000000", pcsrc, pcnext);
	
	instrreg: flopren generic map(32) port map(clk, reset, IRWrite, ReadData, instr);
	datareg: flopr generic map(32) port map(clk, reset, ReadData, data);
	wrmux: mux2 generic map(5) port map(instr(20 downto 16), instr(15 downto 11), RegDst, writereg);
	resmux: mux2 generic map(32) port map(aluout, data, MemtoReg, writedata3);
	rf: regfile port map(clk, RegWrite, instr(25 downto 21), instr(20 downto 16), writereg, writedata3, readdata1, readdata2);
	sext: signext port map(instr(15 downto 0), signimm);
	rdreg: flopr2 generic map(32) port map(clk, reset, readdata1, readdata2, a, b);
	WriteData <= b;
	
	immshift: sl2 port map(signimm, signimmshift);
	srcamux: mux2 generic map(32) port map(pc, a, ALUSrcA, srca);
	srcbmux: mux4 generic map(32) port map(b, x"00000004", signimm, signimmshift, ALUSrcB, srcb);
	mainalu: alu port map(srca, srcb, ALUControl, aluresult, zero);
	alureg: flopr generic map(32) port map(clk, reset, aluresult, aluout);
	
	-----------------------------------------------------------------------
	op <= instr(31 downto 26);
	funct <= instr(5 downto 0);
	
end Behavioral;

