library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity I_O is
	Port(
		IO_in : in std_logic_vector(7 downto 0);		--we zewnetrzne
		IO_bus : in std_logic_vector(7 downto 0);		--we z magistrali
		IO_out1 : out std_logic_vector(7 downto 0);	--wy rej. IN
		IO_out2 : out std_logic_vector(7 downto 0);	--wy ogolne1
		IO_out3 : out std_logic_vector(7 downto 0);	--wy odolne2
		IO_ms : in std_logic_vector(3 downto 0)		--CLK (IN, OUT1, OUT2), CLR
		);
end I_O;

architecture Behavioral of I_O is

begin
---------------------------------------------------------------------
	process(IO_ms(3), IO_ms(0))							--rejestr IN
		begin
			if rising_edge(IO_ms(3)) then					--zapis
				if IO_ms(0)='0' then	
					IO_out1<= IO_in;
				end if;
			end if;
			if IO_ms(0)='1' then								--reset
				IO_out1<= "00000000";
			end if;
	end process;
---------------------------------------------------------------------
	process(IO_ms(2), IO_ms(0))							--rejestr OUT1
		begin
			if rising_edge(IO_ms(2)) then					--zapis
				if IO_ms(0)='0' then	
					IO_out2<= IO_bus;
				end if;
			end if;
			if IO_ms(0)='1' then								--reset
				IO_out2<= "00000000";
			end if;
	end process;
---------------------------------------------------------------------
	process(IO_ms(1), IO_ms(0))							--rejestr OUT2
		begin
			if rising_edge(IO_ms(1)) then					--zapis
				if IO_ms(0)='0' then	
					IO_out3<= IO_bus;
				end if;
			end if;
			if IO_ms(0)='1' then								--reset
				IO_out3<= "00000000";
			end if;
	end process;

end Behavioral;

