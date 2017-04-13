library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 

entity testbench is 
end;

architecture test of testbench is 
	component topmulti 
		port(clk, reset: in STD_LOGIC; 
				WriteData, Adr: inout STD_LOGIC_VECTOR(31 downto 0); 
				MemWrite: inout STD_LOGIC;
				FSM: inout STD_LOGIC_VECTOR(15 downto 0);
				---------------------------------------------
				pc, instr, data, aluout, srca, srcb, aluresult, writedata3: inout STD_LOGIC_VECTOR(31 downto 0);
				writereg: inout STD_LOGIC_VECTOR(4 downto 0);
				op, funct: inout STD_LOGIC_VECTOR(5 downto 0));
	end component; 
	signal clk, reset, MemWrite: STD_LOGIC;
	signal WriteData, Adr: STD_LOGIC_VECTOR(31 downto 0); 
	signal FSM: STD_LOGIC_VECTOR(15 downto 0);
	---------------------------------------------
	signal pc, instr, data, aluout, srca, srcb, aluresult, writedata3: STD_LOGIC_VECTOR(31 downto 0);
	signal writereg: STD_LOGIC_VECTOR(4 downto 0);
	signal op, funct: STD_LOGIC_VECTOR(5 downto 0);

begin 
	-- instantiate device to be tested 
	dut: topmulti port map(clk, reset, WriteData, Adr, MemWrite, FSM, 
									----------------------------------------------
									pc, instr, data, aluout, srca, srcb, aluresult, writedata3, writereg, op, funct);
	
	-- Generate clock with 10 ns period 
	process begin 
		clk <= '1'; 
		wait for 5 ns; 
		clk <= '0'; 
		wait for 5 ns; 
	end process;
	
	-- Generate reset for first two clock cycles 
	process begin 
		reset <= '1'; 
		wait for 20 ns; 
		reset <= '0'; 
		wait;
	end process;
	
	-- check that 7 gets written to address 84 at end of program 
	process (clk) begin 
		if (clk'event and clk = '0' and MemWrite = '1') then 
			if (conv_integer(Adr) = 84 and conv_integer (WriteData) = 7) then 
				report "Simulation succeeded"; 
			elsif (Adr /= 80) then 
				report "Simulation failed " & integer'image (conv_integer(Adr)) & " " & integer'image (conv_integer(WriteData));
			end if; 
		end if; 
	end process; 
end;
