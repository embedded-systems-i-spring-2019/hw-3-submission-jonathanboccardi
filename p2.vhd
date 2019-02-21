
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p2 is
    port (
        X, Y, Z: in    std_logic_vector(7 downto 0);
        MS     : in    std_logic_vector(1 downto 0);
        DS, CLK: in    std_logic;
        RA, RB : inout std_logic_vector(7 downto 0)
    );
end p2;

architecture p2_arc of p2 is
    signal mux_res: std_logic_vector(7 downto 0);
    signal d0, d1 : std_logic;
begin
    d1 <= DS;
    d0 <= not DS;
    
    with MS select
    mux_res <= X when "00", Y when "01", Z when "10", RB when "11";
    
    rega: process(CLK)
        begin
            if (rising_edge(CLK)) then
                if (d0 = '1') then
                    RA <= mux_res;
                end if;
            end if;
        end process rega;
     
     regb: process(CLK)
        begin
            if (rising_edge(CLK)) then
                if (d1 = '1') then
                    RB <= RA;
                end if;
            end if;
        end process regb;
end p2_arc;
