library ieee;
use ieee.std_logic_1164.all;
entity moduloMEM is
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
end entity;
architecture lione of moduloMEM is
component regCarga8bit is
port(        
        d      : in  std_logic_vector(7 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(7 downto 0)
);   
end component;

component as_ram is
	port(
		addr  : in    std_logic_vector(7 downto 0);
		data  : inout std_logic_vector(7 downto 0);
		notrw : in    std_logic;
		reset : in    std_logic
	);
end component;

signal s_mux2rem , s_rem2mem, s_mem2rdm ,s_rdm2barr: std_logic_vector(7 downto 0);

begin

s_mux2rem <= end_PC when  nbarrPC = '1' else
             end_Barr when nbarrPC = '0' else (others => 'Z');


barramento <= s_rdm2barr when MEM_nrw = '0'
                        else (others => 'Z');
s_mem2rdm <= barramento when MEM_nrw = '1'
                        else (others => 'Z');
         

u_remmar:   regCarga8bit port map(s_mux2rem , clk , '1' , rst , REM_nrw , s_rem2mem);
u_as_ram:   as_ram       port map(s_rem2mem, s_mem2rdm ,  MEM_nrw , rst);
u_remmbr:   regCarga8bit port map(s_mem2rdm, clk ,'1', rst ,RDM_nrw, s_rdm2barr);
end architecture;






