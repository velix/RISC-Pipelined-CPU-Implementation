--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg0 IS
GENERIC ( 
			n : INTEGER := 16
		);
  PORT (Input : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0); 
		Clock,Enable : IN STD_LOGIC; 
		Output : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)); 
END reg0; 

ARCHITECTURE Behavior OF reg0 IS 

--signal P1, P2, P3, P4, five, six, afterClock : std_logic;

BEGIN 
	--P3 <= P1 NAND p4;
	--P1 <= afterClock NAND P3;
	--P2 <= NOT(afterClock AND P1 AND P4);
	--P4 <= Input NAND P2;
	--five <= six NAND P1;
	--six <= P2 NAND five;
	--afterClock <= Clock AND Enable;
	Output <= (OTHERS => '0');
END Behavior; 
