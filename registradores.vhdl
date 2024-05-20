--=========================================================== reg1b
library ieee;
use ieee.std_logic_1164.all;

entity regCarga1bit is
port(        
        d      : in  std_logic;
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic    
);
end entity;
architecture reg1bit of regCarga1bit is 
component ffd is 
port(            
        d      : in std_logic;            
        clk    : in std_logic;            
        pr, cl : in std_logic;            
        q, nq  : out std_logic        
);
end component;
signal datain,dataout,nq : std_logic;
begin
    s <= dataout;
    datain <= d when nrw = '1' else dataout when nrw = '0';
    u_reg : ffd port map(datain,clk,pr,cl,dataout,nq);

end architecture;
--=========================================================== reg2b
library ieee;
use ieee.std_logic_1164.all;
entity regCarga2bit is
port(        
        d      : in  std_logic_vector(1 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(1 downto 0)
);
end entity;
architecture reg2bit of regCarga2bit is
component regCarga1bit is
port(        
        d      : in  std_logic;
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic
    );    
end component;
begin

    u_reg0 : regCarga1bit port map(d(0) ,clk , cl , pr , nrw , s(0)); -- Z
    u_reg1 : regCarga1bit port map(d(1) ,clk , pr , cl , nrw , s(1)); -- N
   
end architecture;
--=========================================================== reg8b
library ieee;
use ieee.std_logic_1164.all;
entity regCarga8bit is
port(        
        d      : in  std_logic_vector(7 downto 0);
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic_vector(7 downto 0)
);
end entity;
architecture reg8bit of regCarga8bit is
component regCarga1bit is
port(        
        d      : in  std_logic;
        clk    : in  std_logic;
        pr, cl : in  std_logic;
        nrw    : in  std_logic;
        s      : out std_logic
    );    
end component;
begin
 

    u_reg0 : regCarga1bit port map(d(0) ,clk , pr , cl , nrw , s(0));
    u_reg1 : regCarga1bit port map(d(1) ,clk , pr , cl , nrw , s(1));
    u_reg2 : regCarga1bit port map(d(2) ,clk , pr , cl , nrw , s(2));
    u_reg3 : regCarga1bit port map(d(3) ,clk , pr , cl , nrw , s(3));
    u_reg4 : regCarga1bit port map(d(4) ,clk , pr , cl , nrw , s(4));
    u_reg5 : regCarga1bit port map(d(5) ,clk , pr , cl , nrw , s(5));
    u_reg6 : regCarga1bit port map(d(6) ,clk , pr , cl , nrw , s(6));
    u_reg7 : regCarga1bit port map(d(7) ,clk , pr , cl , nrw , s(7));
   
end architecture;
