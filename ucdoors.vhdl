library ieee;							--LDA
use ieee.std_logic_1164.all;
entity lda is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture pride of lda is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= not(b(2)) or b(1) or not(b(0));

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=(not(b(2)) and not(b(1)) and b(0)) or (b(2) and not(b(1)) and not(b(0)));
sctrl(4)<=b(2) and b(1) and b(0);
sctrl(3)<='0';
sctrl(2)<=(not (b(1)) and(b(2) xnor b(0))) or (not b(2) and b(1) and b(0));
sctrl(1)<=(b(2) and not b(0)) or (not (b(2)) and not(b(1)) and b(0));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================
library ieee;
use ieee.std_logic_1164.all;					--STA
entity sta is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture lust of sta is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= not(b(2)) or b(1) or not(b(0));

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=(not(b(2)) and not(b(1)) and b(0)) or (b(2) and not(b(1)) and not(b(0)));
sctrl(4)<='0';
sctrl(3)<=b(1) and b(2) and not(b(0));
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0))) or (not(b(2)) and b(1) and b(0)) or (b(2) and not(b(1)) and b(0));
sctrl(1)<=(not b(2) and not b(1) and b(0)) or (not (b(0)) and not(b(1)) and b(2));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================

library ieee;
use ieee.std_logic_1164.all;					--NOP
entity nop is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture envy of nop is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= '1';

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=not(b(2)) and not(b(1)) and b(0);
sctrl(4)<='0';
sctrl(3)<='0';
sctrl(2)<=not (b(2)) and not (b(1)) and not (b(0));
sctrl(1)<=not(b(2)) and not(b(1)) and b(0);
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================
library ieee;
use ieee.std_logic_1164.all;
entity nott is	
port(								--NOTT
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture wrath of nott is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= '1';

sctrl(8)<='1';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=not(b(2)) and not(b(1)) and b(0);
sctrl(4)<=b(2) and b(1) and b(0);
sctrl(3)<='0';
sctrl(2)<=not (b(2)) and not (b(1)) and not (b(0));
sctrl(1)<=not(b(2)) and not(b(1)) and b(0);
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================

library ieee;							--add
use ieee.std_logic_1164.all;
entity add is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture greed of add is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= not(b(2)) or b(1) or not(b(0));

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='1';

sctrl(5)<=(not(b(2)) and not(b(1)) and b(0)) or (b(2) and not(b(1)) and not(b(0)));
sctrl(4)<=b(2) and b(1) and b(0);
sctrl(3)<='0';
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0))) or (not(b(2)) and b(1) and b(0)) or (b(2) and not(b(1)) and b(0));
sctrl(1)<=(b(2) and not b(0)) or (not (b(2)) and not(b(1)) and b(0));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================

library ieee;							--OR
use ieee.std_logic_1164.all;
entity orr is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture sloth of orr is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= not(b(2)) or b(1) or not(b(0));

sctrl(8)<='0';
sctrl(7)<='1';
sctrl(6)<='0';

sctrl(5)<=(not(b(2)) and not(b(1)) and b(0)) or (b(2) and not(b(1)) and not(b(0)));
sctrl(4)<=b(2) and b(1) and b(0);
sctrl(3)<='0';
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0))) or (not(b(2)) and b(1) and b(0)) or (b(2) and not(b(1)) and b(0));
sctrl(1)<=(b(2) and not b(0)) or (not (b(2)) and not(b(1)) and b(0));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================

library ieee;							--andd
use ieee.std_logic_1164.all;
entity andd is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture gluttony of andd is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= not(b(2)) or b(1) or not(b(0));

sctrl(8)<='0';
sctrl(7)<='1';
sctrl(6)<='1';

sctrl(5)<=(not(b(2)) and not(b(1)) and b(0)) or (b(2) and not(b(1)) and not(b(0)));
sctrl(4)<=b(2) and b(1) and b(0);
sctrl(3)<='0';
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0))) or (not(b(2)) and b(1) and b(0)) or (b(2) and not(b(1)) and b(0));
sctrl(1)<=(b(2) and not b(0)) or (not (b(2)) and not(b(1)) and b(0));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;


--======================================================================================
library ieee;							--jmp
use ieee.std_logic_1164.all;
entity jmp is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture tall of jmp is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<=not(b(2)) or b(1) or not(b(0));
sctrl(9)<= '1';

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=not(b(1)) and b(0);
sctrl(4)<='0';
sctrl(3)<='0';
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0))) or (not(b(2)) and b(1) and b(0)) ;
sctrl(1)<=(not(b(2)) and not(b(1)) and b(0)) or ((b(2)) and not (b(1)) and not (b(0)));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================
library ieee;							--jmp false
use ieee.std_logic_1164.all;
entity jmpfalse is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture small of jmpfalse is
--sctrl(10)=nbarrinc;
--sctrl(9)=nbarripc;

--sctrl(8)=ulaop(2);
--sctrl(7)=ulaop(1);
--sctrl(6)=ulaop(0);

--sctrl(5)=pc_nrw;
--sctrl(4)=ac_nrw;
--sctrl(3)=mem_nrw;
--sctrl(2)=rem_nrw;
--sctrl(1)=rdm_nrw;
--sctrl(0)=ri_nrw;
begin
sctrl(10)<='1';
sctrl(9)<= '1';

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<=not(b(2)) and b(0);
sctrl(4)<='0';
sctrl(3)<='0';
sctrl(2)<=(not(b(2)) and not(b(1)) and not(b(0)));
sctrl(1)<=(not(b(2)) and not(b(1)) and b(0));
sctrl(0)<=not(b(2)) and b(1) and not(b(0));

end architecture;

--======================================================================================
library ieee;							--hlt
use ieee.std_logic_1164.all;
entity hlt is
port(
	b: in std_logic_vector(2 downto 0);
	sctrl: out std_logic_vector(10 downto 0)
);
end entity;
architecture nada of hlt is 
begin
sctrl(10)<='0';
sctrl(9)<= '0';

sctrl(8)<='0';
sctrl(7)<='0';
sctrl(6)<='0';

sctrl(5)<='0';
sctrl(4)<='0';
sctrl(3)<='0';
sctrl(2)<='0';
sctrl(1)<='0';
sctrl(0)<='0';
end architecture;
