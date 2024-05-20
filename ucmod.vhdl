library ieee;							
use ieee.std_logic_1164.all;
entity moduc is 
port(
		
	sel_op:		in std_logic_vector(10 downto 0);
	nz:		in std_logic_vector(1 downto 0);
	clk , rst: 	in std_logic;
	zuc:       	out std_logic_vector(10 downto 0)	

);
end entity;
architecture dresrossa of moduc is
component lda is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component sta is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component nop is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component nott is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component add is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component orr is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component andd is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component jmp is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component jx is
port(
	x: in std_logic;
	b: in std_logic_vector(2 downto 0);
	sctrl : out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component hlt is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end component;
--====================================================
component counter is 
    port (
        rst : in std_logic;
        clk : in std_logic;

        s : out std_logic_vector(2 downto 0)
    );
end component;

--====================================================
signal b_lda, b_sta, b_nop, b_not , b_add : std_logic_vector(10 downto 0); 
signal b_and, b_or, b_jmp, b_jn, b_jz , b_hlt: std_logic_vector(10 downto 0);
signal	s_counter: std_logic_vector(2 downto 0);

begin


u_counter:  counter port map(rst , clk , s_counter);
u_lda: 		lda port map(s_counter , b_lda);
u_sta: 		sta port map(s_counter , b_sta);
u_nop: 		nop port map(s_counter , b_nop);
u_not: 	       nott port map(s_counter , b_not);
u_add: 		add port map(s_counter , b_add);
u_or: 		orr port map(s_counter , b_or);
u_and: 	       andd port map(s_counter , b_and);
u_jmp: 		jmp port map(s_counter , b_jmp);
u_jn: 		 jx port map(nz(1), s_counter, b_jn);
u_jz: 		 jx port map(nz(0), s_counter , b_jz);
u_hlt: 		hlt port map(s_counter, b_hlt);

zuc <= b_nop  when sel_op = "10000000000" else
       b_sta  when sel_op = "01000000000" else
       b_lda  when sel_op = "00100000000" else
       b_add  when sel_op = "00010000000" else
       b_or   when sel_op = "00001000000" else
       b_and  when sel_op = "00000100000" else
       b_not  when sel_op = "00000010000" else
       b_jmp  when sel_op = "00000001000" else
       b_jn   when sel_op = "00000000100" else
       b_jz   when sel_op = "00000000010" else
       b_hlt  when sel_op = "00000000001" else(others => 'Z');
       
end architecture;























