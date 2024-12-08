LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RAM_test IS
END RAM_test;
 
ARCHITECTURE behavior OF RAM_test IS 
 
    COMPONENT RAM
    PORT(
         RAM_IN : IN  std_logic_vector(7 downto 0);
         RAM_OUT : OUT  std_logic_vector(7 downto 0);
         RAM_WR : IN  std_logic;
         RAM_CLOCK : IN  std_logic;
         RAM_ms : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
   
   --Inputs
   signal RAM_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM_WR : std_logic := '0';
   signal RAM_CLOCK : std_logic := '0';
   signal RAM_ms : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal RAM_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant RAM_CLOCK_period : time := 5 ns;
 
BEGIN

   uut: RAM PORT MAP (
          RAM_IN => RAM_IN,
          RAM_OUT => RAM_OUT,
          RAM_WR => RAM_WR,
          RAM_CLOCK => RAM_CLOCK,
          RAM_ms => RAM_ms
        );

 RAM_CLOCK_process :process
   begin
  RAM_CLOCK <= '0';
  wait for RAM_CLOCK_period/2;
  RAM_CLOCK <= '1';
  wait for RAM_CLOCK_period/2;
   end process;
   

   stim_proc: process
   begin		
      RAM_IN<="00000111";
		wait for 5 ns;
		RAM_ms<="10";
		wait for 5 ns;
		RAM_ms<="00";
		wait for 5 ns;
		RAM_WR<='1';
		wait for 5 ns;
		RAM_WR<='0';
		wait for 5 ns;
		RAM_IN<="00000000";
		wait for 5 ns;
		RAM_ms<="10";
		wait for 5 ns;
		RAM_ms<="00";
		wait for 5 ns;
      wait;
   end process;

END;
