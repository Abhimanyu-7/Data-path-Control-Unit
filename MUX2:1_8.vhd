library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX21_8 is
port
(
d_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
d_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
SEL : IN STD_LOGIC;
Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

);
end MUX21_8;

Architecture behavioral of MUX21_8 is
begin 

Y <= d_0 when (SEL = '0')
		else
		d_1 when (SEL = '1');

end behavioral;

