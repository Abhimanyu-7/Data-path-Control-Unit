library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is 
port(
clock		 : in STD_LOGIC;
reset		 : in STD_LOGIC;
acc,start : in STD_LOGIC;
state_out : out STD_LOGIC_VECTOR(2 DOWNTO 0);

WRA,WRB,WRC,SEL : out STD_LOGIC
);

end FSM;

architecture behavioral of FSM is 

type state is (init,fetch,proces,write_r, accm);

signal current_state, next_state : state;
begin

process(clock,reset)
begin

if(reset = '1') then
current_state <= init;

elsif(falling_edge(clock)) then
current_state <= next_state;
end if;
end process;

process(start,acc)
begin

case(current_state) is 
when init => --state_out = 000
state_out <= "000";
WRA <= '0';
WRB <= '0';
WRC <= '0';
SEL <= '0';

if (start ='1' and acc='0') then
next_state <= fetch;
elsif(start='1' and acc='1') then
next_state <= accm;
else
next_state <= init;
end if;

when fetch => --state_out = 001
state_out <= "001";
WRA <= '1';
WRB <= '1';
WRC <= '0';
SEL <= '0';
next_state <= proces;

when proces=> --state_out = 011
state_out <= "011";
WRA <= '0';
WRB <= '0';

next_state <= write_r;

when accm=> --state_out = 010
state_out <= "010";
WRA <= '0';
WRB <= '0';
WRC <= '1';
SEL <= '1';
next_state <= proces;

when write_r=> --state_out = 100
state_out <= "100";
WRA <= '0';
WRB <= '0';
WRC <= '1';
SEL <= '0';
next_state <= init;

end case;

end process;
end behavioral;
