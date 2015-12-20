--KOLOKATHI FOTINI P3090088
--KOTROTSIOU STAVROULA P3110089
--MILOULIS VELISARIOS P3100125

LIBRARY ieee;
Use ieee.std_logic_signed.all;
--to use STD_LOGIC_VECTOR
Use ieee.STD_Logic_1164.all;

--implementation of 16-bit Alu
ENTITY Alu IS
		GENERIC ( 
			n : INTEGER := 16
		);
		Port (  Input1, Input2 :IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
				CarryOut :OUT STD_LOGIC;
				Overflow :OUT STD_LOGIC;
				Operation :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				Output :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
				);
END Alu;

Architecture Logicfunc Of Alu IS 
	component  AluSlice is
			Port (  Input1, Input2, Carryin, Op3, Op1, Op2, zero :IN STD_LOGIC;
					Output, Carryout :OUT STD_LOGIC
				); 
    end component;
    
    signal CarryOuts, tempOutput : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    signal Zeroes :STD_LOGIC_VECTOR(n-1 DOWNTO 0) := (others => '0');
    signal COUT : STD_LOGIC;
    
   -- Command constants --
    constant ADD_FUNC : std_logic_vector(3 downto 0) := "0000";
	constant SUB_FUNC : std_logic_vector(3 downto 0) := "0001";
	constant AND_FUNC : std_logic_vector(3 downto 0) := "0010";
	constant OR_FUNC  : std_logic_vector(3 downto 0) := "0011";
	constant GEQ_FUNC : std_logic_vector(3 downto 0) := "0100";
	constant NOT_FUNC : std_logic_vector(3 downto 0) := "0101";
begin
		--BInvert : Operation(2)
		--Op1 : Operation(0)
		--Op2 : Operation(1)
		-- Lose the carryIn signal. Unecessary, since it's only explicitly used in subtraction, so just stick the same sub denoting bit in there
		G0: AluSlice port map (Input1(0), Input2(0), Operation(0), Operation(0), Operation(2), Operation(1), Zeroes(0), tempOutput(0), CarryOuts(0));
		G1: AluSlice port map (Input1(1), Input2(1), CarryOuts(0), Operation(0), Operation(2), Operation(1), Zeroes(1), tempOutput(1), CarryOuts(1));
		G2: AluSlice port map (Input1(2), Input2(2), CarryOuts(1), Operation(0), Operation(2), Operation(1), Zeroes(2), tempOutput(2), CarryOuts(2));
		G3: AluSlice port map (Input1(3), Input2(3), CarryOuts(2), Operation(0), Operation(2), Operation(1), Zeroes(3), tempOutput(3), CarryOuts(3));
		G4: AluSlice port map (Input1(4), Input2(4), CarryOuts(3), Operation(0), Operation(2), Operation(1), Zeroes(4), tempOutput(4), CarryOuts(4));
		G5: AluSlice port map (Input1(5), Input2(5), CarryOuts(4), Operation(0), Operation(2), Operation(1), Zeroes(5), tempOutput(5), CarryOuts(5));
		G6: AluSlice port map (Input1(6), Input2(6), CarryOuts(5), Operation(0), Operation(2), Operation(1), Zeroes(6), tempOutput(6), CarryOuts(6));
		G7: AluSlice port map (Input1(7), Input2(7), CarryOuts(6), Operation(0), Operation(2), Operation(1), Zeroes(7), tempOutput(7), CarryOuts(7));
		G8: AluSlice port map (Input1(8), Input2(8), CarryOuts(7), Operation(0), Operation(2), Operation(1), Zeroes(8), tempOutput(8), CarryOuts(8));
		G9: AluSlice port map (Input1(9), Input2(9), CarryOuts(8), Operation(0), Operation(2), Operation(1), Zeroes(9), tempOutput(9), CarryOuts(9));
		G10: AluSlice port map (Input1(10), Input2(10), CarryOuts(9), Operation(0), Operation(2), Operation(1), Zeroes(10), tempOutput(10), CarryOuts(10));
		G11: AluSlice port map (Input1(11), Input2(11), CarryOuts(10), Operation(0), Operation(2), Operation(1), Zeroes(11), tempOutput(11), CarryOuts(11));
		G12: AluSlice port map (Input1(12), Input2(12), CarryOuts(11), Operation(0), Operation(2), Operation(1), Zeroes(12), tempOutput(12), CarryOuts(12));
		G13: AluSlice port map (Input1(13), Input2(13), CarryOuts(12), Operation(0), Operation(2), Operation(1), Zeroes(13), tempOutput(13), CarryOuts(13));
		G14: AluSlice port map (Input1(14), Input2(14), CarryOuts(13), Operation(0), Operation(2), Operation(1), Zeroes(14), tempOutput(14), CarryOuts(14));
		G15: AluSlice port map (Input1(15), Input2(15), CarryOuts(14), Operation(0), Operation(2), Operation(1), Zeroes(15), tempOutput(15), COUT);
	process(Operation)
		variable temp, temp2: std_logic_vector(n-1 downto 0);
		variable temp4: std_logic;
	begin
		case Operation is
			when ADD_FUNC =>
				temp := tempOutput;
			when SUB_FUNC =>
				temp := tempOutput;
			when AND_FUNC =>
				temp := tempOutput;
			when OR_FUNC =>
				temp := tempOutput;
			when GEQ_FUNC =>
				-- store into temp 4 the MSB
				temp4 := tempOutput(n-1);
				
				-- Init output vector with zeroes
				temp := (OTHERS => '0');
				-- Set LSB to NOT MSB (if input >= 0 MSB == 0 etc)
				temp(0) := NOT temp4;

			when NOT_FUNC =>
				temp := (OTHERS => '0'); -- set all to 0
				temp2 := temp or Input1;
				temp4:= temp2(15) or temp2(14)or temp2(13) or temp2(12) or temp2(11)or temp2(10)or temp2(9)or temp2(8)or temp2(7) or temp2(6) or temp2(5) or temp2(4)or temp2(3)or temp2(2)or temp2(1)or temp2(0);
				temp(0) := NOT temp4; 
						
			when others =>
				temp := Input1 - Input2;
		end case;
		

		Carryout <= COUT;
		Overflow <= CarryOuts(n-2) XOR COUT;
		
		Output <= temp;
	end process;
END Logicfunc;

