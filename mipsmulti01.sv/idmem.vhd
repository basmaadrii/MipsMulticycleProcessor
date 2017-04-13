library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use STD.TEXTIO.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.STD_LOGIC_ARITH.all;

entity idmem is
	port(clk, MemWrite: in STD_LOGIC;
			Adr, WriteData: in STD_LOGIC_VECTOR(31 downto 0);
			ReadData: out STD_LOGIC_VECTOR(31 downto 0));
end idmem;

architecture Behavioral of idmem is
begin
	process is
		type ramtype is array(127 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
		variable mem: ramtype;
		file mem_file: TEXT; 
		variable L: line; 
		variable ch: character; 
		variable index, result: integer;
	begin
		-- initialize memory from file 
		for i in 0 to 127 loop -- set all contents low 
			mem(conv_integer(i)) := CONV_STD_LOGIC_VECTOR(0, 32); 
		end loop; 
		index := 0; 
		FILE_OPEN(mem_file, "C:/mips/memfile.dat", READ_MODE); 
		while not endfile(mem_file) loop 
			readline(mem_file, L); 
			result := 0;
			for i in 1 to 8 loop 
				read(L, ch); 
				if '0' <= ch and ch <= '9' then 
					result := result*16 + character'pos(ch) - character'pos('0'); 
				elsif 'a' <= ch and ch <= 'f' then 
					result := result*16 + character'pos(ch) - character'pos('a') + 10; 
				else 
					report "Format error on line" & integer'image (index) severity error; 
				end if; 
			end loop; 
			mem(index) := CONV_STD_LOGIC_VECTOR(result, 32); 
			index := index + 1; 
		end loop;
		-- read or write memory 
		loop
			report "hi";
			if clk'event and clk = '1' then 
				if(MemWrite = '1')then 
					mem(CONV_INTEGER(Adr(8 downto 2))):= WriteData;
					
				end if; 
			end if;
			ReadData <= mem(CONV_INTEGER(Adr(8 downto 2))); 
			wait on clk, Adr; 
		end loop; 
	end process;
end Behavioral;

