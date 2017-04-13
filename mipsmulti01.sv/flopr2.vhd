library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all; 

entity flopr2 is -- flip-flop with synchronous reset 
	generic(width: integer); 
	port(clk, reset: in STD_LOGIC;
		  d1, d2: in STD_LOGIC_VECTOR(width-1 downto 0); 
		  q1, q2: out STD_LOGIC_VECTOR(width-1 downto 0)); 
end;

architecture asynchronous of flopr2 is 
begin 
	process(clk, reset) begin 
		if reset = '1' then 
			q1 <= CONV_STD_LOGIC_VECTOR(0, width); 
			q2 <= CONV_STD_LOGIC_VECTOR(0, width);
		elsif clk'event and clk = '1' then 
			q1 <= d1;
			q2 <= d2;
		end if; 
	end process; 
end;

