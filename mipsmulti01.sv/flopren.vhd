library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.all; 

entity flopren is
	generic(width: integer); 
	port(clk, reset, enable: in  STD_LOGIC; 
		  d: in  STD_LOGIC_VECTOR(width-1 downto 0); 
		  q: out STD_LOGIC_VECTOR(width-1 downto 0)); 
end flopren;

architecture asynchronous of flopren is 
begin 
	process(clk, reset) begin 
		if reset = '1' then 
			q <= CONV_STD_LOGIC_VECTOR(0, width); 
		elsif clk'event and clk = '1' then
			if enable = '1' then
				q <= d; 
			end if;
		end if; 
	end process; 
end;
