library ieee;
use ieee.std_logic_1164.all;
entity programcounter is 
port(
	nbarrinc, pc_nrw: in std_logic;
	cl ,clk: in std_logic;
	barramento: in std_logic_vector(7 downto 0);
	endout: out std_logic_vector(7 downto 0)
);
end entity;
architecture behavior of programcounter is 
component regCarga8bit is
port(        
        d      : in  std_logic_vector(7 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(7 downto 0)
);
end component;
component somador8 is
	port(
	a, b : in  std_logic_vector(7 downto 0);
	cin  : in  std_logic;
	s    : out std_logic_vector(7 downto 0);
	cout : out std_logic
	);
end component;
signal sadd, s_mux2pc, spc_atual, sendpc2mem:std_logic_vector(7 downto 0);
signal s_never:std_logic;
begin

s_mux2pc <= sadd when nbarrinc ='1' else
	    barramento when nbarrinc ='0' else (others => 'Z');

endout   <= spc_atual;

u_soma: somador8 port map("00000001", spc_atual, '0',sadd, s_never);
u_rip: regCarga8bit port map (s_mux2pc, clk, '1', cl, pc_nrw, spc_atual);

end architecture;
