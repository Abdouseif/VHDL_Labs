Library ieee;
use ieee.std_logic_1164.all;

entity partc is 

port(
A : IN std_logic_vector (15 DOWNTO 0);
Cin : in std_logic;
S0: in std_logic;
S1: in std_logic;
Cout : out std_logic;
F : out std_logic_vector (15 DOWNTO 0));

end entity;

Architecture myModel of partc is
begin
F<= '0'& A(15 downto 1)when S0='0' AND S1='0'
else A(0)& A(15 downto 1)when S0='1' AND S1='0'
else Cin & A(15 downto 1) when S0='0' AND S1='1'
else A(15)& '0'&A(14 downto 1);

Cout<= A(0);
end Architecture;
