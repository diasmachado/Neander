library ieee;
use ieee.std_logic_1164.all;

entity counter is 
    port (
        rst : in std_logic;
        clk : in std_logic;

        s : out std_logic_vector(2 downto 0)
    );
end entity;

architecture struct of counter is
component ctrldec is
    port (
        j : out std_logic_vector(2 downto 0);
        k : out std_logic_vector(2 downto 0);
        q : in std_logic_vector(2 downto 0)
    );
end component;

component ffjk is
    port(
         j, k   : in std_logic;
       	 clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic 
    );
end component;

signal srst : std_logic;
signal spr : std_logic;
signal sj : std_logic_vector(2 downto 0);
signal sk : std_logic_vector(2 downto 0);
signal sq : std_logic_vector(2 downto 0);
signal snq : std_logic_vector(2 downto 0);

begin
    spr <= '1';
    u_ffjk0 : ffjk port map(sj(0), sk(0), clk, spr, rst, sq(0), snq(0));
    u_ffjk1 : ffjk port map(sj(1), sk(1), clk, spr, rst, sq(1), snq(1));
    u_ffjk2 : ffjk port map(sj(2), sk(2), clk, spr, rst, sq(2), snq(2));
    u_controlador : ctrldec port map(sj, sk, sq);
    s <= sq;
end architecture;
