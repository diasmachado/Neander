library ieee;
use ieee.std_logic_1164.all;
entity modctrl is 
port(
	barr:		 in std_logic_vector(7 downto 0);
	nz:		 in std_logic_vector(1 downto 0);
	rst, clk, nrw:	 in std_logic ;
	barrctrl:	 out std_logic_vector(10 downto 0)
);
end entity;
architecture control of modctrl is
component regCarga8bit is
port(        
        d      : in  std_logic_vector(7 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(7 downto 0)
);
end component;
component decode is
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
end component;

component moduc is 
port(
		
	sel_op:		in std_logic_vector(10 downto 0);
	nz:		in std_logic_vector(1 downto 0);
	clk , rst: 	in std_logic;
	zuc:       	out std_logic_vector(10 downto 0)	

);
end component;

signal s_ir2dec: std_logic_vector(7 downto 0);
signal s_dec2uc : std_logic_vector(10 downto 0);

begin

u_ir:     regCarga8bit port map(barr , clk, '1', rst, nrw, s_ir2dec);
u_decod:  decode port map(s_ir2dec, s_dec2uc);
u_uc:     moduc port map(s_dec2uc, nz, clk, rst , barrctrl);
end architecture; 








