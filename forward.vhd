library IEEE;
use IEEE.std_logic_1164.all;
use work.p_MI0.all;

-- Declaracao das entradas e saidas
entity forward is
	generic( 
		size: integer := 32
	);
	
	port (
		EX_rs, EX_rd, EX_rt, ID_rs, ID_rt, MEM_rd: in reg32;
		EX_RegWrite, MEM_RegWrite: in std_logic;
		ForwardA, ForwardB: out std_logic_vector(1 downto 0)
	);
end forward;


-- TODO: fazer essa parte!!!
architecture arq_forward of forward is

	signal temp: reg32 := (others => '0');
begin
	process(EX_rs, EX_rd, EX_rt, ID_rs, ID_rt, MEM_rd, EX_RegWrite, MEM_RegWrite)
	begin
		-- EX hazards
		if (EX_RegWrite <> 0 and (EX_rd <> 0) and (EX_rd == ID_rs)) -- EX Hazard
			ForwardA <= '10'
		if (EX_RegWrite <> 0 and (EX_rd <> 0) and (EX_rd == ID_rt)) -- EX Hazard
			ForwardB <= '10'

		-- MEM Hazards
		if (MEM_RegWrite and (MEM_rd <> 0) and (EX_rd <> ID_rs) and (MEM_rd == ID_rs))
			ForwardA <= '01'
		if (MEM_RegWrite and (MEM_rd <> 0) and (EX_rd <> ID_rt) and (MEM_rd == ID_rt))
			ForwardB <= '01'
		
	end process;

	f <= temp;

end arq_forward;	
