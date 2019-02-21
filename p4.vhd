library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p4 is
    port(
        X, Y    : in std_logic_vector(7 downto 0);
        S0, S1  : in std_logic;
        LDA, LDB: in std_logic;
        CLK     : in std_logic;
        RD      : in std_logic;
        RA      : out std_logic_vector(7 downto 0);
        RB      : inout std_logic_vector(7 downto 0)
    );
end p4;

architecture p4_arc of p4 is
    signal ma, mb: std_logic_vector(7 downto 0);
begin
    
    rega: process(CLK) begin
        if (falling_edge(CLK)) then
            if ((LDA and RD) = '1') then
                RA <= ma;
            end if;
        end if;
    end process rega;

    regb: process(CLK) begin
        if (falling_edge(CLK)) then
            if ((LDB and (not RD)) = '1') then
                RB <= mb;
            end if;
        end if;
    end process regb;    
    
    with S1 select
        mb <= X when '1', Y when '0';
        
    with S0 select
        ma <= RB when '1', Y when '0';
        
end p4_arc;
