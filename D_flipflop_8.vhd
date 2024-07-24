library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_ff8 is 
port(
D			: in STD_LOGIC_VECTOR(7 DOWNTO 0);
CLK,RST  : in STD_LOGIC;
Q 			: out STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end D_ff8;

architecture behavioral of D_ff8 is 
begin

process(CLK,RST)
begin

if (RST='1') then
Q <= (others =>'0');
elsif (rising_edge(CLK)) then 
Q <= D;

end if;
end process;
end behavioral;
