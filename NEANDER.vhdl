library ieee;
use ieee.std_logic_1164.all;
entity neander is
port (
	rst: std_logic;
	clk: std_logic
);
end entity;
architecture onepiece of neander is
component moduloMEM is
port(
    rst, clk   : in    std_logic;
    nbarrPC    : in    std_logic;
    REM_nrw    : in    std_logic;
    MEM_nrw    : in    std_logic;
    RDM_nrw    : in    std_logic;
    end_PC     : in    std_logic_vector(7 downto 0);       
    end_Barr   : in    std_logic_vector(7 downto 0);
    barramento : inout std_logic_vector(7 downto 0)
);
end component;
--==================================================================
component modula is 
port(
	rst , clk: 	in std_logic;
	ac_rw: 		in std_logic;
        ula_op: 	in std_logic_vector(2 downto 0);
        mem_nrw :	in std_logic;
	flags_nz: 	out std_logic_vector(1 downto 0);
        barramento:	inout std_logic_vector(7 downto 0) 
);
end component;
--==================================================================
component modctrl is 
port(
	barr:		 in std_logic_vector(7 downto 0);
	nz:		 in std_logic_vector(1 downto 0);
	rst, clk, nrw:	 in std_logic ;
	barrctrl:	 out std_logic_vector(10 downto 0)
);
end component;
--==================================================================
component programcounter is 
port(
	nbarrinc, pc_nrw: in std_logic;
	cl ,clk: in std_logic;
	barramento: in std_logic_vector(7 downto 0);
	endout: out std_logic_vector(7 downto 0)
);
end component;

signal s_barrdados, s_pc2mem: std_logic_vector(7 downto 0);
signal s_flag2mc:   std_logic_vector(1 downto 0);
signal s_barrctrl:  std_logic_vector(10 downto 0);
--s_barrctrl(10)=nbarrinc;
--s_barrctrl(9)=nbarripc;

--s_barrctrl(8)=ulaop(2);
--s_barrctrl(7)=ulaop(1);
--s_barrctrl(6)=ulaop(0);

--s_barrctrl(5)=pc_nrw;
--s_barrctrl(4)=ac_nrw;
--s_barrctrl(3)=mem_nrw;
--s_barrctrl(2)=rem_nrw;
--s_barrctrl(1)=rdm_nrw;
--s_barrctrl(0)=ri_nrw;
begin
u_mdula: modula port map(rst, clk, s_barrctrl(4), s_barrctrl(8 downto 6), s_barrctrl(3), s_flag2mc,s_barrdados);

u_modmem: moduloMEM port map(rst , clk ,s_barrctrl(9), s_barrctrl(2), s_barrctrl(3), s_barrctrl(1),s_pc2mem, s_barrdados , s_barrdados);

u_mdcrtl: modctrl port map(s_barrdados, s_flag2mc, rst, clk ,s_barrctrl(0), s_barrctrl);

u_pc: programcounter port map(s_barrctrl(10), s_barrctrl(5), rst, clk, s_barrdados, s_pc2mem);

end architecture;
