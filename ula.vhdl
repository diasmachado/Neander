library ieee;
use ieee.std_logic_1164.all;
entity ula is 
port(
	x: in std_logic_vector(7 downto 0);
	y: in std_logic_vector(7 downto 0);
	ulaop: in std_logic_vector(2 downto 0);
	nz: out std_logic_vector(1 downto 0);
	s: out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of ula is
component pand is
port(
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    sand: out std_logic_vector(7 downto 0) 
);
end component;

component pnot is
port(
    x: in std_logic_vector(7 downto 0);
    snot: out std_logic_vector(7 downto 0) 
);
end component;

component por is
port(
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    sor: out std_logic_vector(7 downto 0) 
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

component mux5x8 is
 port(
	c0  : in  std_logic_vector(7 downto 0);
	c1  : in  std_logic_vector(7 downto 0);
	c2  : in  std_logic_vector(7 downto 0);
	c3  : in  std_logic_vector(7 downto 0);
	c4  : in  std_logic_vector(7 downto 0);
	sel : in  std_logic_vector(2 downto 0);
	zc  : out std_logic_vector(7 downto 0)
    );
end component;  
  
component detect is 
port(
    x: in std_logic_vector(7 downto 0);
    nz: out std_logic_vector(1 downto 0) 
);
end component;

signal snot, sand ,sor, sadd , s_resultado: std_logic_vector(7 downto 0);
signal snunca: std_logic;

begin 
	s <= s_resultado;
	u_and               : pand port map(x , y ,sand); 
	u_not               : pnot port map(x ,snot);
	u_por               : por port map(x , y ,sor);
	u_somador           : somador8 port map(x , y ,'0', sadd , snunca);
	u_mux               : mux5x8 port map(y , sadd, sor, sand ,snot, ulaop, s_resultado);
	u_detect            : detect  port map (s_resultado , nz);
end architecture;

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
