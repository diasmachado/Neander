library ieee;							
use ieee.std_logic_1164.all;
entity jx is
port(
	x: in std_logic;
	b: in std_logic_vector(2 downto 0);
	sctrl : out std_logic_vector(10 downto 0)
);
end entity;
architecture pulo of jx is
component jmpfalse is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--======================================
component jmp is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;

signal s_true, s_false: std_logic_vector(10 downto 0);

begin

sctrl <= s_true when x = '1' else
	 s_false when x = '0' else (others => 'Z');

u_true: jmp port map(b , s_true);
u_false: jmpfalse port map(b , s_false);

end architecture;
