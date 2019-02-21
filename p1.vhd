
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p1 is
    port(
        A, B : in std_logic_vector(7 downto 0);
        LDA, SEL, CLK : in std_logic;
        F : out std_logic_vector(7 downto 0)
    );
end p1;

architecture p1_arc of p1 is
    signal mux_res : std_logic_vector(7 downto 0);
begin
    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (LDA = '1') then
                F <= mux_res;
            end if;
       end if;
   end process;
   
   with SEL select
   mux_res <= A when '0', B when '1', (others => '0') when others;
end p1_arc;
