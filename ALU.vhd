library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity ALU is

port(
	A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	OP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	RESULT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);	
	Cout : OUT STD_LOGIC
);
end ALU;

architecture behavioral of ALU is 

signal ALU_RESULT : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal temp : STD_LOGIC_VECTOR(8 DOWNTO 0);

begin
process (A,B,OP)
begin
case(OP) is 

when "000" => --addition
ALU_RESULT <= A + B;
temp <= ('0' & A) + ('0' & B);

when "001" => --substraction
ALU_RESULT <= A - B;
temp <= ('0' & A) - ('0' & B);

when "010" => --multiplication
ALU_RESULT <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) * to_integer(unsigned(B)),8));

when "011" => --division
ALU_RESULT <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8)); 

when "100" => --XOR
ALU_RESULT <= A XOR B;

when "101" => --XNOR
ALU_RESULT <= A XNOR B;

when "110" => --isequal
if(A=B) then
ALU_RESULT<= x"01";
else
ALU_RESULT<= x"00";
end if;

when "111" => --isgreater
if(A>B) then 
ALU_RESULT<= x"01";
else
ALU_RESULT<= x"00";
end if;

when others =>
ALU_RESULT <= A;

end case;
end process;

RESULT <= ALU_RESULT;
Cout <= temp(8);

end behavioral;
