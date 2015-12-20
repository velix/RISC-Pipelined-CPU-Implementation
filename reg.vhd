--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125



LIBRARY ieee;
Use ieee.STD_Logic_1164.all;
ENTITY reg IS
GENERIC ( 
			n : INTEGER := 16
		);
Port (Input :IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Clock, Enable :IN STD_LOGIC ;
		Output :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
END reg;

Architecture Logicfunc Of reg IS 
	component  regg is
			Port (Input, Clock, Enable :IN STD_LOGIC ;
					Output : OUT STD_LOGIC ); 
    end component;
	
begin
	G0: regg port map(Input(0), Clock, Enable, Output(0));
	G1: regg port map(Input(1), Clock, Enable, Output(1));
	G2: regg port map(Input(2), Clock, Enable, Output(2));
	G3: regg port map(Input(3), Clock, Enable, Output(3));
	G4: regg port map(Input(4), Clock, Enable, Output(4));
	G5: regg port map(Input(5), Clock, Enable, Output(5));
	G6: regg port map(Input(6), Clock, Enable, Output(6));
	G7: regg port map(Input(7), Clock, Enable, Output(7));
	G8: regg port map(Input(8), Clock, Enable, Output(8));
	G9: regg port map(Input(9), Clock, Enable, Output(9));
	G10: regg port map(Input(10), Clock, Enable, Output(10));
	G11: regg port map(Input(11), Clock, Enable, Output(11));
	G12: regg port map(Input(12), Clock, Enable, Output(12));
	G13: regg port map(Input(13), Clock, Enable, Output(13));
	G14: regg port map(Input(14), Clock, Enable, Output(14));
	G15: regg port map(Input(15), Clock, Enable, Output(15));
	
END Logicfunc;