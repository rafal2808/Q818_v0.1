--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:46 03/30/2019
-- Design Name:   
-- Module Name:   C:/Users/ja/Desktop/work/FPGA/projekty/DCEQ816/ALU_test.vhd
-- Project Name:  DCEQ816
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(7 downto 0);
         STS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal S : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal STS : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          Y => Y,
          STS => STS
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
     A<="00000011";
	  B<="00000001";
	  S<="0000";
	  wait for 5 ns;
	  S<="0000";
	  wait for 10 ns;
	  S<="0001";
	  wait for 10 ns;
	  S<="0010";
	  wait for 10 ns;
	  S<="0011";
	  wait for 10 ns;
	  S<="0100";
	  wait for 10 ns;
	  S<="0101";
	  wait for 10 ns;
	  S<="0110";
	  wait for 10 ns;
	  S<="0111";
	  wait for 10 ns;
	  S<="1000";
	  wait for 10 ns;
	  S<="1001";
	  wait for 10 ns;
	  S<="1010";
	  wait for 10 ns;
	  S<="1011";
	  wait for 10 ns;
	  S<="1100";
	  wait for 10 ns;
	  S<="1101";
	  wait for 10 ns;
	  S<="1110";
	  wait for 10 ns;


      wait;
   end process;

END;
