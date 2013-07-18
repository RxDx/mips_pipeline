library IEEE;
use IEEE.std_logic_1164.all;
use work.p_MI0.all;

-- Declaracao das entradas e saidas
entity forward is
	generic( 
		size: integer := 32
	);
	
	port (
		EX_rs, EX_rt, ID_rs, ID_rt, MEM_rd: in reg32;
		EX_RegWrite, MEM_RegWrite: in std_logic;
		ForwardA, ForwardB: out std_logic_vector(1 downto 0)
	);
end forward;


-- TODO: fazer essa parte!!!
architecture arq_forward of forward is

	signal temp: reg32 := (others => '0');
begin
	process(a, num)
	begin
		for  i  in 0 to size-(num+1)  loop
			temp(i+num) <= a(i);
	        end loop;      
	end process;

	f <= temp;

end arq_forward;	
