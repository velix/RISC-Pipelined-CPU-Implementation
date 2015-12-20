--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125


LIBRARY ieee;
Use ieee.STD_Logic_1164.all;
ENTITY sign_extender IS
	generic (
		n : integer := 16;
		k : integer := 6
	);
	port (	
		immediate : in std_logic_vector (k-1 downto 0);
		extended : out std_logic_vector (n-1 downto 0)
	);
END sign_extender;

Architecture Logicfunc Of sign_extender IS 		
begin
		-- replicate the high-order sign bit of the original input in the high order bits of the extended input
	    extended <= (n-1 downto k => immediate(k-1)) & (immediate);
END Logicfunc;
