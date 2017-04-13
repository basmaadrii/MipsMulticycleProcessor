LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controllertest IS
END controllertest;
 
ARCHITECTURE behavior OF controllertest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         zero : IN  std_logic;
         op : IN  std_logic_vector(5 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         IorD : OUT  std_logic;
         MemWrite : OUT  std_logic;
         IRWrite : OUT  std_logic;
         RegDst : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         RegWrite : OUT  std_logic;
         ALUSrcA : OUT  std_logic;
         PCEn : OUT  std_logic;
         ALUSrcB : OUT  std_logic_vector(1 downto 0);
         PCSrc : OUT  std_logic_vector(1 downto 0);
         ALUControl : OUT  std_logic_vector(2 downto 0);
			FSM: INOUT STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal zero : std_logic := '0';
   signal op : std_logic_vector(5 downto 0) := (others => '0');
   signal funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal IorD : std_logic;
   signal MemWrite : std_logic;
   signal IRWrite : std_logic;
   signal RegDst : std_logic;
   signal MemtoReg : std_logic;
   signal RegWrite : std_logic;
   signal ALUSrcA : std_logic;
   signal PCEn : std_logic;
   signal ALUSrcB : std_logic_vector(1 downto 0);
   signal PCSrc : std_logic_vector(1 downto 0);
   signal ALUControl : std_logic_vector(2 downto 0);
	signal FSM: std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          clk => clk,
          reset => reset,
          zero => zero,
          op => op,
          funct => funct,
          IorD => IorD,
          MemWrite => MemWrite,
          IRWrite => IRWrite,
          RegDst => RegDst,
          MemtoReg => MemtoReg,
          RegWrite => RegWrite,
          ALUSrcA => ALUSrcA,
          PCEn => PCEn,
          ALUSrcB => ALUSrcB,
          PCSrc => PCSrc,
          ALUControl => ALUControl,
			 FSM => FSM
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
	
	process begin 
		reset <= '1'; 
		wait for 20 ns; 
		reset <= '0'; 
		wait; 
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      
		--add
      op <= "000000";
		funct <= "100000";
		
		wait for clk_period*5;
		
		--sub
      op <= "000000";
		funct <= "100010";
		
		wait for clk_period*4;
		
		--and
      op <= "000000";
		funct <= "100100";
		
		wait for clk_period*4;
		
		--or
      op <= "000000";
		funct <= "100101";
		
		wait for clk_period*4;
		
		--slt
      op <= "000000";
		funct <= "101010";
		
		wait for clk_period*4;
		
		--lw
      op <= "100011";
		
		wait for clk_period*5;
		
		--sw
      op <= "101011";
		
		wait for clk_period*4;
		
		--beq
      op <= "000100";
		zero <= '1';
		
		wait for clk_period*3;
		
		--beq
      op <= "000100";
		zero <= '0';
		
		wait for clk_period*3;
		
		--addi
      op <= "001000";
		
		wait for clk_period*4;
		
		--j
      op <= "000010";
		
		wait for clk_period*3;
		
      wait;
   end process;

END;
