library IEEE;
use IEEE.std_logic_1164.all;
use work.p_MI0.all;

-- Declaracao das entradas e saidas
entity forward is
	generic(
		size: integer := 32
	);

	port (
		EX_rs, EX_rd, EX_rt, ID_rs, ID_rt, MEM_RegRd: std_logic_vector(4 downto 0);
		EX_RegWrite, MEM_RegWrite: in std_logic;
		ForwardA, ForwardB: out std_logic_vector(1 downto 0)
	);
end forward;


-- TODO: fazer essa parte!!!
architecture arq_forward of forward is

	--signal temp: reg32 := (others => '0');
begin
	process(EX_rs, EX_rd, EX_rt, ID_rs, ID_rt, MEM_RegRd, EX_RegWrite, MEM_RegWrite)
	begin
		-- EX hazards
		if (EX_RegWrite = '1'  and (EX_rd /= "00000") and (EX_rd = ID_rs)) then -- EX Hazard
			ForwardA <= "10";
		end if;
		if (EX_RegWrite = '1' and (EX_rd /= "00000") and (EX_rd = ID_rt)) then -- EX Hazard
			ForwardB <= "10";
		end if;


		-- MEM Hazards
		if (MEM_RegWrite = '1' and (MEM_RegRd /= "00000") and (EX_rd /= ID_rs) and (MEM_RegRd = ID_rs)) then
			ForwardA <= "01";
		end if;
		if (MEM_RegWrite = '1' and (MEM_RegRd /= "00000") and (EX_rd /= ID_rt) and (MEM_RegRd = ID_rt)) then
			ForwardB <= "01";
		end if;

	end process;

	--f <= temp;

end arq_forward;	
