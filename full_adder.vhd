--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125

LIBRARY ieee;
Use ieee.STD_Logic_1164.all;
Use ieee.std_logic_signed.all;

ENTITY full_adder IS
Port ( in1, in2, carryin :IN STD_LOGIC;
		sum, carryout : OUT STD_LOGIC ); 
END full_adder;

Architecture Logicfunc Of full_adder IS 


Begin

sum<= in1 XOR in2 XOR carryin;
carryout<= (in1 AND in2) OR(in1 AND carryin)OR(in2 AND carryin);

END Logicfunc;
