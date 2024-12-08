library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
	generic ( 
     constant N: natural := 1  
    );
	 
	port(
		A, B : in std_logic_vector(7 downto 0);	--wejsnia
		S : in std_logic_vector(3 downto 0);		--sterowanie
		Y : out std_logic_vector(7 downto 0);		--wyjscie
		STS : out std_logic_vector(3 downto 0)		--Cout, A=B, A>B, A<B
		);	

end ALU;

architecture Behavioral of ALU is

	signal ALU_out : std_logic_vector(7 downto 0);
	signal STS_out : std_logic_vector(3 downto 0);
	signal tmp : std_logic_vector(8 downto 0);

begin
	
	process(A,B,S)
		begin
			case(S) is
				when "0000" => ALU_out <= A;
				when "0001" => ALU_out <= A+1;
				when "0010" => ALU_out <= A+B;
				when "0011" => ALU_out <= A-B;
				when "0100" => ALU_out <= A and B;
				when "0101" => ALU_out <= A or B;
				when "0110" => ALU_out <= A xor B;
				when "0111" => ALU_out <= A nand B;
				when "1000" => ALU_out <= A nor B;
				when "1001" => ALU_out <= A xnor B;
				when "1010" => ALU_out <= not A;
				when "1011" => ALU_out <= std_logic_vector(unsigned(A) sll N);--przesuniecie w lewo
				when "1100" => ALU_out <= std_logic_vector(unsigned(A) srl N);--przesuniecie w prawo
				when "1101" => ALU_out <= std_logic_vector(unsigned(A) rol N);--rotacja w lewo
				when "1110" => ALU_out <= std_logic_vector(unsigned(A) ror N);--rotacja w prawo
				when others => ALU_out <= A;
			end case;
	end process;

	process(A,B)									--komparator
		begin
			if(A=B) then
				STS_out(2 downto 0)<= "100";
			end if;  
			if(A>B) then
				STS_out(2 downto 0)<= "010";
			end if;
			if(A<B) then
				STS_out(2 downto 0)<= "001";
			end if;
	end process;
	
	tmp <= ('0' & A) + ('0' & B);	--wyjscie przeniesienia
	STS_out(3) <= tmp(8); 

	Y<=ALU_out;
	STS<=STS_out;
	
end Behavioral;


