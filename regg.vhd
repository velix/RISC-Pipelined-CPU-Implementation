--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125

library ieee;
use ieee.std_logic_1164.all;
--This is AND gate
entity andGate is	
   port( andA, andB : in std_logic;
            andF : out std_logic);
end andGate;

architecture func of andGate is 
begin
   andF <= andA and andB; 
end func;
--*============================
--	This is NAND_2_TO_1 gate
library ieee;
use ieee.std_logic_1164.all;

entity nand2Gate is 
   port( andA, andB : in std_logic;
         andF : out std_logic);
end nand2Gate;

architecture func of nand2Gate is 
begin
   andF <= andA nand andB; 
end func;
--*============================
--	This is NAND_3_TO_1 gate
library ieee;
use ieee.std_logic_1164.all;

entity nand3Gate is	
   port(andA, andB, andC : in std_logic;
        andF : out std_logic);
end nand3Gate;
--
architecture func of nand3Gate is 
begin
  andF <= not(andA and andB and andC); 
end func;
--*=======================*=====================
LIBRARY ieee;
Use ieee.STD_Logic_1164.all;
ENTITY regg IS
Port (Input, Clock, Enable :IN STD_LOGIC ;
		Output : OUT STD_LOGIC ); 
END regg;

Architecture Logicfunc Of regg IS 
   component  nand3Gate is
			port(	andA, andB, andC : in std_logic;
               andF : out std_logic);
   end component;
   ----
   component  andGate is
			port( andA, andB  : in std_logic;
					andF  : out std_logic);
   end component;
   ----
   component  nand2Gate is
			port(	andA, andB : in std_logic;
               andF : out std_logic);
   end component;
   ----
	
   signal P1, P2, P3, P4, five, six, afterClock : std_logic;
	
begin
	--P3 <= P1 NAND p4;
	--P1 <= afterClock NAND P3;
	--P2 <= NOT(afterClock AND P1 AND P4);
	--P4 <= Input NAND P2;
	--five <= six NAND P1;
	--six <= P2 NAND five;
	--afterClock <= Clock AND Enable;
	U1: nand2Gate port map(P1,P4,P3);
	U2: nand2Gate port map(afterClock,P3,P1);
	U3: nand3Gate port map(afterClock,P1,P4,P2);
	U4: nand2Gate port map(Input,P2,P4);
	U5: nand2Gate port map(six,P1,five);
	U6: nand2Gate port map(P2,five,six); 
	U7: andGate port map(Clock,Enable,afterClock);
	Output <= five;
	
END Logicfunc;