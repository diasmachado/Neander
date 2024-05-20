library ieee;
use ieee.std_logic_1164.all;
entity decode is 
port(
	intrin: in std_logic_vector(7 downto 0);
	introut: out std_logic_vector(10 downto 0)
	--introut(10) = nop;
	--introut(9) = sta;
	--introut(8) = lda;
	--introut(7) = add;
	--introut(6) = or;
	--introut(5) = and;
	--introut(4) = not;
	--introut(3) = jump;
	--introut(2) = jn;
	--introut(1) = jz;
	--introut(0) = hlt;
	
);
end entity;
architecture dec of decode is
begin
introut <=      "10000000000" when intrin = "00000000" else --nop
		"01000000000" when intrin = "00010000" else --sta 
		"00100000000" when intrin = "00100000" else --lda
		"00010000000" when intrin = "00110000" else --add
		"00001000000" when intrin = "01000000" else --or
		"00000100000" when intrin = "01010000" else --and
		"00000010000" when intrin = "01100000" else --not
		"00000001000" when intrin = "10000000" else --jmp
		"00000000100" when intrin = "10010000" else --jn
		"00000000010" when intrin = "10100000" else --jz
		"00000000001" when intrin = "11110000" else (others => 'Z'); --hlt
end architecture;

