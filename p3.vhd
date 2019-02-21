library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p3 is
    port (
        X, Y    : in    std_logic_vector(7 downto 0);
        S0, S1  : in    std_logic;
        LDA, LDB: in    std_logic;
        CLK     : in    std_logic;
        RB      : inout std_logic_vector(7 downto 0)        
    );
end p3;

architecture p3_arc of p3 is
    signal m1: std_logic_vector(7 downto 0);
    signal qa: std_logic_vector(7 downto 0);
    signal m2: std_logic_vector(7 downto 0);
begin
    with S1 select
        m1 <= X when '1', RB when '0';
    
    rega: process(CLK) begin
        if (rising_edge(CLK)) then
            if (LDA = '1') then
                qa <= m1;
            end if;
        end if;
    end process rega;

    with S0 select
        m2 <= qa when '1', Y when '0';
        
    regb: process(CLK) begin
        if (rising_edge(CLK)) then
            if (LDB = '1') then
                RB <= m2;
            end if;
        end if;
    end process regb;    
        
    
end p3_arc;
