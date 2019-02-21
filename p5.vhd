library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p5 is
    port (
        A, B, C : in std_logic_vector(7 downto 0);
        SL1, SL2: in std_logic;
        CLK     : in std_logic;
        RAX, RBX: out std_logic_vector(7 downto 0)
    );
end p5;

architecture p5_arc of p5 is
    signal m1: std_logic_vector(7 downto 0);
    signal d0, d1: std_logic;
begin
    
    rega: process(CLK) begin
        if (rising_edge(CLK)) then
            if (d1 = '1') then
                RAX <= A;
            end if;
        end if;
    end process rega;
    
    regb: process(CLK) begin
        if (rising_edge(CLK)) then
            if (d0 = '1') then
                RBX <= m1;
            end if;
        end if;
    end process regb;    
    
    with SL2 select
        m1 <= B when '1', C when '0';
    
    d0 <= not SL1;
    d1 <= SL1;
end p5_arc;
