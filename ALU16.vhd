Library ieee;
use ieee.std_logic_1164.all;

entity ALU is 

port(
A : IN std_logic_vector (15 DOWNTO 0);
B : in std_logic_vector(15 downto 0);
Cin : in std_logic;
S0: in std_logic;
S1: in std_logic;
S2: in std_logic;
S3: in std_logic;
Cout : out std_logic;
F : out std_logic_vector (15 DOWNTO 0));

end entity;
Architecture myModel of ALU is
begin

F<= A and B when s1='0' and s0='0' and s2='1' and s3='0'
else A or B when s1='0' and s0='1'  and s2='1' and s3='0'
else A xor B when s1='1' and s0='0'  and s2='1' and s3='0'
else  not A when s1='1' and s0='1'  and s2='1' and s3='0'

else '0'& A(15 downto 1)when S0='0' AND S1='0'  and s2='0' and s3='1'
else A(0)& A(15 downto 1)when S0='1' AND S1='0'  and s2='0' and s3='1'
else Cin & A(15 downto 1) when S0='0' AND S1='1'  and s2='0' and s3='1' 
else A(15)& Cin &A(14 downto 1) when  s0='1' and s1='1' and s2='0' and s3='1'


else A(14 downto 0)&'0' when S0='0' AND S1='0' and s2='1' and s3='1'
else A(14 downto 0)& A(15) when S0='1' AND S1='0' and s2='1' and s3='1'
else A(14 downto 0)& Cin when S0='0' AND S1='1' and s2='1' and s3='1'
else x"0000";

Cout<= A(0) when s2='0' and s3='1'
else   A(15) when  s2='1' and s3='1'
else '0';





end Architecture;