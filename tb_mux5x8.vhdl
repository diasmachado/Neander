library ieee;
use ieee.std_logic_1164.all;
entity tb_mux5x8 is
end entity;

architecture behavior of tb_mux5x8 is 

component mux5x8 is 
    port (
        c0  : in  std_logic_vector(7 downto 0);
        c1  : in  std_logic_vector(7 downto 0);
        c2  : in  std_logic_vector(7 downto 0);
        c3  : in  std_logic_vector(7 downto 0);
        c4  : in  std_logic_vector(7 downto 0);
        sel : in  std_logic_vector(2 downto 0);
        zc  : out std_logic_vector(7 downto 0)
    );

end component;

signal sc0,sc1,sc2,sc3,sc4,szc: std_logic_vector(7 downto 0);
signal ssel:std_logic_vector(2 downto 0);
begin
       u_mux5x8: mux5x8 port map(
        sc0,sc1,sc2,sc3,sc4,ssel,szc
                    );

    u_tb: process
    begin
    sc0 <= "11111111";
    sc1 <= "00000000";
    ssel <= "000";
    wait for 10 ns;

    ssel <= "001";
    wait for 10 ns;

end process;
end architecture;
   



