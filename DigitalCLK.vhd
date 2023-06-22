---- Header Files ----
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

---- Entity Declaration ----
entity DigitalCLK is
		port
		(
			CLK : in std_logic;
			Reset : in std_logic;
			seg0 : out  std_logic_vector(6 downto 0);
			seg1 : out  std_logic_vector(6 downto 0);
			seg2 : out  std_logic_vector(6 downto 0);
			seg3 : out  std_logic_vector(6 downto 0)
		);
end DigitalCLK;

---- Architecture ----
architecture Behaviour of DigitalCLK is
--- Signal Declaration ---
	signal clk1 : std_logic;
	signal cnt  : std_logic_vector(27 downto 0);
	signal S : std_logic_vector(7 downto 0);
	signal M : std_logic_vector(7 downto 0);

begin

	counting: process(clk1)
	begin
		if(Reset = '0') then
			S <= "00000000";
			M <= "00000000";
			elsif(rising_edge(clk1)) then
				if(S = "01011011") then
					S <= "00000000";
					M <= M + "00000001";
				elsif (M = "01011011") then
					M <= "00000000";
				else
					S <= S + "00000001";
				end if;
			end if;
	end process;
	
---- Process for Seconds ----
	process(S) is
	begin
		case S(3 downto 0) is
			when "0000" =>
				seg0 <= "1000000";

			when "0001" =>
				seg0 <= "1111001";

			when "0010" =>
				seg0 <= "0100100";

			when "0011" =>
				seg0 <= "0110000";

			when "0100" =>
				seg0 <= "0011001";  

			when "0101" =>
				seg0 <= "0010010";  

			when "0110" =>
				seg0 <= "0000010";  

			when "0111" =>
				seg0 <= "1111000";
 
			when "1000" =>
				seg0 <= "0000000";  

			when "1001" =>
				seg0 <= "0010000";  

			when others  =>
				seg0 <= "1111100";  
		end case;


		case S(7 downto 4) is
            when "0000" =>
				seg1 <= "1000000";

			when "0001" =>
				seg1 <= "1111001";

			when "0010" =>
				seg1 <= "0100100";

			when "0011" =>
				seg1 <= "0110000";

			when "0100" =>
				seg1 <= "0011001";  

			when "0101" =>
				seg1 <= "0010010";  

			when "0110" =>
				seg1 <= "0000010";  

			when "0111" =>
				seg1 <= "1111000";
 
			when "1000" =>
				seg1 <= "0000000";  

			when "1001" =>
				seg1 <= "0010000";  

			when others =>
				seg1 <= "1111100";  
		end case;
	end process;
	
---- Process for Minutes ----
	process(M) is
	begin
		case M(3 downto 0) is
			when "0000" =>
				seg2 <= "1000000";

			when "0001" =>
				seg2 <= "1111001";

			when "0010" =>
				seg2 <= "0100100";

			when "0011" =>
				seg2 <= "0110000";

			when "0100" =>
				seg2 <= "0011001";  

			when "0101" =>
				seg2 <= "0010010";  

			when "0110" =>
				seg2 <= "0000010";  

			when "0111" =>
				seg2 <= "1111000";
 
			when "1000" =>
				seg2 <= "0000000";  

			when "1001" =>
				seg2 <= "0010000";  

			when others  =>
				seg2 <= "1111100";  
		end case;


		case M(7 downto 4) is
            when "0000" =>
				seg3 <= "1000000";

			when "0001" =>
				seg3 <= "1111001";

			when "0010" =>
				seg3 <= "0100100";

			when "0011" =>
				seg3 <= "0110000";

			when "0100" =>
				seg3 <= "0011001";  

			when "0101" =>
				seg3 <= "0010010";  

			when "0110" =>
				seg3 <= "0000010";  

			when "0111" =>
				seg3 <= "1111000";
 
			when "1000" =>
				seg3 <= "0000000";  

			when "1001" =>
				seg3 <= "0010000";  

			when others =>
				seg3 <= "1111100";  
 
		end case;
	end process;

---- Frequency Divider ----
	process (CLK)
	begin
		if(rising_edge(CLK)) then
			if(cnt = X"017D7840") then
				cnt <= X"0000000";
				clk1 <= not clk1;
			else
					cnt <= cnt + 1;
					clk1 <= clk1;
			end if;
		end if;
	end process;

end Behaviour;
