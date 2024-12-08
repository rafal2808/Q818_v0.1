--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:51 03/18/2019
-- Design Name:   
-- Module Name:   C:/Users/ja/Desktop/work/FPGA/projekty/DCEQ816/Logic_test.vhd
-- Project Name:  DCEQ816
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LOGIC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Logic_test IS
END Logic_test;
 
ARCHITECTURE behavior OF Logic_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LOGIC
    PORT(
         Logic_romd : IN  std_logic_vector(12 downto 0);
         Logic_roma : OUT  std_logic_vector(10 downto 0);
         Logic_ms : OUT  std_logic_vector(17 downto 0);
         Logic_clk : IN  std_logic;
         Logic_reset : IN  std_logic;
         Logic_sts : IN  std_logic_vector(3 downto 0);
         Logic_bus : IN  std_logic_vector(7 downto 0);
         Logic_db : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Logic_romd : std_logic_vector(12 downto 0) := (others => '0');
   signal Logic_clk : std_logic := '0';
   signal Logic_reset : std_logic := '0';
   signal Logic_sts : std_logic_vector(3 downto 0) := (others => '0');
   signal Logic_bus : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Logic_roma : std_logic_vector(10 downto 0);
   signal Logic_ms : std_logic_vector(17 downto 0);
   signal Logic_db : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Logic_clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LOGIC PORT MAP (
          Logic_romd => Logic_romd,
          Logic_roma => Logic_roma,
          Logic_ms => Logic_ms,
          Logic_clk => Logic_clk,
          Logic_reset => Logic_reset,
          Logic_sts => Logic_sts,
          Logic_bus => Logic_bus,
          Logic_db => Logic_db
        );

   -- Clock process definitions
   Logic_clk_process :process
   begin
		Logic_clk <= '0';
		wait for Logic_clk_period/2;
		Logic_clk <= '1';
		wait for Logic_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		Logic_reset<='1';
		wait for 10 ns;
		Logic_reset<='0';
		wait for 10 ns;
      Logic_romd<="0000000000010";
      wait for 10 ns;
		Logic_romd<="0000000000111";
      wait for 10 ns;		

      wait for 10 ns;

      wait;
   end process;

END;
