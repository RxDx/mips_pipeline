library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity hazard is
	port (
	        clk: in std_logic;
	        IdEx_Rt: in std_logic_vector(4 downto 0);
	        IfId_Rs, IfId_Rt: in std_logic_vector(4 downto 0);
		IdEx_MemRead: in std_logic;
		IdEx_MemWrite: in std_logic;
		Stall: out std_logic
	);
end hazard;


architecture arq_hazard of hazard is

begin
   
    process (clk)
    begin
        if falling_edge(clk) then
            --************************************************************************--
            --                              Hazard LW                                 --
            --************************************************************************--
            
            if (IdEx_MemRead = '1' and ((IdEx_Rt = IfId_Rs or IdEx_Rt = IfId_Rt))) then
                Stall <= '1';
            else
                Stall <= '0';
            end if;
        end if;
    
    end process;

end arq_hazard;
