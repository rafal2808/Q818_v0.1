LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DCE_Q816
    PORT(
         CPU_in : IN  std_logic_vector(7 downto 0);
         CPU_out1 : OUT  std_logic_vector(7 downto 0);
         CPU_out2 : OUT  std_logic_vector(7 downto 0);
         CPU_romd : IN  std_logic_vector(12 downto 0);
         CPU_roma : OUT  std_logic_vector(10 downto 0);
         CPU_reset : IN  std_logic;
         CPU_clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CPU_in : std_logic_vector(7 downto 0) := (others => '0');
   signal CPU_romd : std_logic_vector(12 downto 0) := (others => '0');
   signal CPU_reset : std_logic := '0';
   signal CPU_clock : std_logic := '0';

 	--Outputs
   signal CPU_out1 : std_logic_vector(7 downto 0);
   signal CPU_out2 : std_logic_vector(7 downto 0);
   signal CPU_roma : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant CPU_clock_period : time := 100 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DCE_Q816 PORT MAP (
          CPU_in => CPU_in,
          CPU_out1 => CPU_out1,
          CPU_out2 => CPU_out2,
          CPU_romd => CPU_romd,
          CPU_roma => CPU_roma,
          CPU_reset => CPU_reset,
          CPU_clock => CPU_clock
        );

   -- Clock process definitions
   CPU_clock_process :process
   begin
		CPU_clock <= '0';
		wait for CPU_clock_period/2;
		CPU_clock <= '1';
		wait for CPU_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      CPU_reset<='0';
		wait for 10 ns;	
      CPU_reset<='1';
		CPU_in<="11001011";
		CPU_romd<="0000000000000";	
		wait for 5 ns;
		CPU_romd<="0001000000011";
		wait for 5 ns;
		CPU_romd<="0000000000110";		
		wait for 5 ns;
	   	CPU_romd<="1111111100011";
		wait for 5 ns;
		CPU_romd<="0000000001001";
		wait for 5 ns;
		CPU_romd<="0000000000000";	
		wait for 5 ns;
		CPU_romd<="0000000000000";	
		wait for 5 ns;
		CPU_romd<="0000000000000";	
		wait for 5 ns;
		CPU_romd<="0000000000000";
		wait for 5 ns;
		CPU_romd<="0000000000000";		
		wait for 5 ns;
		CPU_romd<="0000000000000";
		wait for 5 ns;
		CPU_romd<="0000000000000";
		wait for 5 ns;
		CPU_romd<="0000000000000";	
		wait for 5 ns;
		CPU_romd<="0000000000000";			
      wait for 100 ns;	



      wait;
   end process;

END;
