library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maindec is
port(clk, reset: in STD_LOGIC;
	  op: in STD_LOGIC_VECTOR(5 downto 0);
	  IorD, MemWrite, IRWrite, PCWrite, Branch, AluSrcA, RegWrite, MemtoReg, RegDst: out STD_LOGIC;
	  AluOp, AluSrcB, PcSrc: out STD_LOGIC_VECTOR(1 downto 0);
	  FSM: inout STD_LOGIC_VECTOR(15 downto 0));
	  
end maindec;

architecture Behavioral of maindec is

--signal FSM: STD_LOGIC_VECTOR(15 downto 0);

begin
	process(clk, reset) begin
		if reset = '1' then
			FSM <= x"5010"; --Fetch
		elsif clk'event and clk = '1' then
			if FSM = x"0840" OR FSM = x"0880" OR FSM = x"2100" OR
				FSM = x"0605" OR FSM = x"0800" OR FSM = x"4008" then
					FSM <= x"5010";
			elsif FSM = x"5010" then
					FSM <= x"0030";
			else
				case op is
					when "000000" => case FSM is --RType
												when x"0030" => FSM <= x"0402"; --RTypeEx
												when x"0402" => FSM <= x"0840"; --RTypeWB
												when others	 => FSM <= "----------------"; --Illegal State
											end case;
					when "100011" => case FSM is --LW							
												when x"0030" => FSM <= x"0420"; --MemAdr
												when x"0420" => FSM <= x"0100"; --MemRD
												when x"0100" => FSM <= x"0880"; --MemWB
												when others  => FSM <= "----------------"; --Illegal State
											end case;
					when "101011" => case FSM is --SW						
												when x"0030" => FSM <= x"0420"; --MemAdr
												when x"0420" => FSM <= x"2100"; --MemWR
												when others  => FSM <= "----------------"; --Illegal State
											end case;
					when "000100" => case FSM is --BEQ
												when x"0030" => FSM <= x"0605"; --BeqEx
												when others  => FSM <= "----------------"; --Illegal State
											end case;
					when "001000" => case FSM is --ADDI
												when x"0030" => FSM <= x"0420"; --ADDIEx
												when x"0420" => FSM <= x"0800"; --ADDIWB
												when others  => FSM <= "----------------"; --Illegal State
											end case;
					when "000010" => case FSM is --Jump
												when x"0030" => FSM <= x"4008"; --JEx
												when others  => FSM <= "----------------"; --Illegal State
											end case;
					when others	=> FSM <= "----------------"; --Illegal Op
				end case;
			end if;
		end if;
	end process;
	
	PCWrite <= FSM(14);
	MemWrite <= FSM(13);
	IRWrite <= FSM(12);
	RegWrite <= FSM(11);
	ALUSrcA <= FSM(10);
	Branch <= FSM(9);
	IorD <= FSM(8);
	MemtoReg <= FSM(7);
	RegDst <= FSM(6);
	ALUSrcB <= FSM(5 downto 4);
	PCSrc <= FSM(3 downto 2);
	ALUOp <= FSM(1 downto 0);
end Behavioral;

