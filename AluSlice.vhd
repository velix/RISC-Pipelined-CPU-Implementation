--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125

LIBRARY ieee;
Use ieee.STD_Logic_1164.all;
Use ieee.std_logic_signed.all;

--implementation of 1-bit Alu
ENTITY AluSlice IS
		Port (  Input1, Input2, Carryin, Op3, Op1, Op2, zero :IN STD_LOGIC;
				Output, Carryout :OUT STD_LOGIC
				);
END AluSlice;

Architecture Logicfunc Of AluSlice IS 
	component  full_adder is
			Port ( in1, in2, carryin :IN STD_LOGIC ;
					sum, carryout : OUT STD_LOGIC );
    end component;
	---------------
	component  mux is
			Port ( in1, in2, sig :IN STD_LOGIC ;
					output : OUT STD_LOGIC ); 
    end component;
	---------------
	component  mux3 is
			Port ( in1, in2, in3, sig1, sig2 :IN STD_LOGIC ;
					output : OUT STD_LOGIC );  
    end component;

	signal f1,f2, f3, f4, f5: STD_LOGIC;
begin

	
	-- when BInv == 1, return BInv
	G0: mux port map (Input2, NOT Input2, Op3, f2);
	
	-- when zeroes == 1, return zero
	G1: mux port map (f2, zero, Op1, f1);
	
	f3 <= Input1 AND Input2;
	f4 <= Input1 OR Input2;
	
	
	G2: full_adder port map ( Input1, f1, Carryin, f5, Carryout);
	
	
	G3: mux3 port map (f3, f4, f5, Op2,  Op3,  Output);

END Logicfunc;
