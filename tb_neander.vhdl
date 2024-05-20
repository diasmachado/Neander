library ieee;
use ieee.std_logic_1164.all;

entity tb_neander is
end entity;

architecture fboss of tb_neander is
constant CLK_PERIOD : time := 20 ns;
component neander is
    port (
        rst : in std_logic;
        clk : in std_logic
    );
end component;

signal srst : std_logic := '1';
signal sclk : std_logic := '0';

begin
    u_teste : neander port map (srst, sclk);
    sclk <= not (sclk) after CLK_PERIOD/2;
    u_tb : process 
    begin
 	srst <= '0';
        wait for CLK_PERIOD;
        srst <= '1';
        wait;
    end process;
end architecture;
