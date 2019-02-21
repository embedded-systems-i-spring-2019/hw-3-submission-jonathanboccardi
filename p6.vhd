library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p6 is
    port (
        A, B, C     : in std_logic_vector(7 downto 0);
        SEL1, SEL2  : in std_logic;
        CLK         : in std_logic;
        RAP, RBP    : out std_logic_vector(7 downto 0)
    );
end p6;

architecture p6_arc of p6 is
    signal m1: std_logic_vector(7 downto 0);
    signal d0, d1: std_logic;
begin
    rega: process(CLK) begin
        if (rising_edge(CLK)) then
            if (d1 = '1') then
                RAP <= m1;
            end if;
        end if;
    end process rega;
    
    regb: process(CLK) begin
        if (rising_edge(CLK)) then
            if (d0 = '1') then
                RBP <= C;
            end if;
        end if;
    end process regb;
    
    with SEL1 select
        m1 <= A when '1', B when '0';
        
    d0 <= not SEL2;
    d1 <= SEL2;
    
end p6_arc;
