LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CORE_MS2_test IS
END CORE_MS2_test;
 
ARCHITECTURE behavior OF CORE_MS2_test IS 
 
    COMPONENT CORE_MS2
    PORT(
         MS2_IN : IN  std_logic_vector(7 downto 0);
         MS2_DB : IN  std_logic_vector(7 downto 0);
         MS2_RAM : IN  std_logic_vector(7 downto 0);
         MS2_ms : IN  std_logic_vector(9 downto 0);
         MS2_OUT : OUT  std_logic_vector(7 downto 0);
         MS2_STS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal MS2_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal MS2_DB : std_logic_vector(7 downto 0) := (others => '0');
   signal MS2_RAM : std_logic_vector(7 downto 0) := (others => '0');
   signal MS2_ms : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal MS2_OUT : std_logic_vector(7 downto 0);
   signal MS2_STS : std_logic_vector(3 downto 0);
 
 
   constant period : time := 10 ns;
 
BEGIN

   uut: CORE_MS2 PORT MAP (
          MS2_IN => MS2_IN,
          MS2_DB => MS2_DB,
          MS2_RAM => MS2_RAM,
          MS2_ms => MS2_ms,
          MS2_OUT => MS2_OUT,
          MS2_STS => MS2_STS
        );


   stim_proc: process
   begin	
		MS2_IN<= "00000001";
		MS2_DB<= "00000010";
		MS2_RAM<="00000011";
		wait for 5 ns;
      MS2_ms<= "0011110000";
		wait for 5 ns;
      MS2_ms<= "0000000000";
		wait for 5 ns;
      MS2_ms<= "0000001000";
		wait for 5 ns;
      MS2_ms<= "0000000001";
		wait for 5 ns;		
   wait;
   end process;

END;
