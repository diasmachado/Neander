--===================================================================== por
library ieee;
use ieee.std_logic_1164.all;
entity por is                                                        
port(
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    sor: out std_logic_vector(7 downto 0) 
);
end entity;
architecture comuta of por is      
begin 
 genor: for i in 7 downto 0 generate
 sor(i)<= x(i) or y(i);       

end generate genor;

end architecture;

--===================================================================== pnot
library ieee;
use ieee.std_logic_1164.all;
entity pnot is
port(
    x: in std_logic_vector(7 downto 0);
    snot: out std_logic_vector(7 downto 0) 
);
end entity;
architecture comuta of pnot is       
begin
 genor: for i in 7 downto 0 generate
 snot(i)<= not(x(i));
end generate genor;

end architecture;
--===================================================================== pand
library ieee;
use ieee.std_logic_1164.all;
entity pand is
port(
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    sand: out std_logic_vector(7 downto 0) 
);
end entity;
architecture comuta of pand is      
begin 
 genor: for i in 7 downto 0 generate
 sand(i)<= x(i) and y(i);       

end generate genor;

end architecture;

--===================================================================== somador
library ieee;
use ieee.std_logic_1164.all;

entity somador is
  port(
    a, b, cin  : in  std_logic;
    s, cout    : out std_logic
  );
end entity;

architecture behavior of somador is
begin
  s <= (a xor b) xor cin;
  cout <= (a and b) or (cin and a) or (cin and b);
end architecture;

-- SOMADOR --

library ieee;
use ieee.std_logic_1164.all;

entity somador8 is
  port(
    a, b : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    s    : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end entity;

architecture behavior of somador8 is
  component somador is
    port(
      a, b, cin  : in  std_logic;
      s, cout    : out std_logic
    );
  end component;

  signal c1, c2, c3, c4, c5, c6, c7, c8 : std_logic;
begin
  u_somador0 : somador port map(a(0), b(0), cin, s(0), c1);
  u_somador1 : somador port map(a(1), b(1), c1,  s(1), c2);
  u_somador2 : somador port map(a(2), b(2), c2,  s(2), c3);
  u_somador3 : somador port map(a(3), b(3), c3,  s(3), c4);
  u_somador4 : somador port map(a(4), b(4), c4,  s(4), c5);
  u_somador5 : somador port map(a(5), b(5), c5,  s(5), c6);
  u_somador6 : somador port map(a(6), b(6), c6,  s(6), c7);
  u_somador7 : somador port map(a(7), b(7), c7,  s(7), c8);

  cout <= c8;

end architecture;

--===================================================================== detect

library ieee;
use ieee.std_logic_1164.all;
entity detect is
port(
    x: in std_logic_vector(7 downto 0);
    nz: out std_logic_vector(1 downto 0) 
);
end entity;
architecture comuta of detect is
begin 

nz(1)<= x(7);
nz(0)<= not(x(7) or x(6) or x(5) or x(4) or x(3) or x(2) or x(1) or x(0));
end architecture;
