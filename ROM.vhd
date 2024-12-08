library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity ROM is
	port(
		ROM_ADDR: in std_logic_vector(10 downto 0); 		--Adres
		ROM_CLOCK: in std_logic;								--zegar
		ROM_DATA_OUT: out std_logic_vector(12 downto 0) --Dane wyjœciowe
	);
end ROM;

architecture Behavioral of ROM is
	
	type ROM_ARRAY is array (0 to 2047 ) of std_logic_vector (12 downto 0); 
	
	signal ROM: ROM_ARRAY:= (
 "0000000000000",
 "0000001010110",
 "1000000000011",
 "0000000001010",
 
 "0100000000011",
 "0000000001010",
 
 "0010000000011",
 "0000000001010",
 
 "0001000000011",
 "0000000001010",
 
 "0000100000011",
 "0000000001010",
 
 "0000010000011",
 "0000000001010",
 
 "0000001000011",
 "0000000001010",
 
 "0000000100011",
 "0000000001010",
 "0001010010110",
 
	others=>"0000000000000" ); 
	
begin
	process(ROM_CLOCK)--proces zegarowy
		begin
			if(rising_edge(ROM_CLOCK)) then	--je¿eli narastaj¹ce zbocze zegara
					ROM_DATA_OUT <= ROM(to_integer(unsigned(ROM_ADDR)));
				end if;
	end process;

end Behavioral;

