library ieee;
use ieee.std_logic_1164.all;
entity modula is 
port(
	rst , clk: 	in std_logic;
	ac_rw: 		in std_logic;
        ula_op: 	in std_logic_vector(2 downto 0);
        mem_nrw :	in std_logic;
	flags_nz: 	out std_logic_vector(1 downto 0);
        barramento:	inout std_logic_vector(7 downto 0) 
);
end entity;
architecture arcula of modula is 

component ula is 
port(
	x: in std_logic_vector(7 downto 0);
	y: in std_logic_vector(7 downto 0);
	ulaop: in std_logic_vector(2 downto 0);
	nz: out std_logic_vector(1 downto 0);
	s: out std_logic_vector(7 downto 0)
);
end component;

component regCarga8bit is 
port(        
        d      : in  std_logic_vector(7 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(7 downto 0)
);
end component;

component regCarga2bit is 
port(        
        d      : in  std_logic_vector(1 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(1 downto 0)
);
end component;

signal s_ac2ula, s_ula2ac:std_logic_vector(7 downto 0);
signal s_ac2flags :std_logic_vector(1 downto 0);

begin

barramento <= s_ac2ula when mem_nrw ='1' else (others => 'Z');
u_acula     : ula          port map(s_ac2ula , barramento, ula_op,s_ac2flags,s_ula2ac);
u_acreg8    : regCarga8bit port map(s_ula2ac  , clk, '1',  rst , ac_rw , s_ac2ula);
u_acreg2    : regCarga2bit port map(s_ac2flags, clk, '1' , rst , ac_rw , flags_nz);

end architecture;



