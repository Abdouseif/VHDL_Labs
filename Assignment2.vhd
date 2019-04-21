.Library ieee;
use ieee.std_logic_1164.all;

entity Assignment2 is 
GENERIC (n : integer := 16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : in std_logic_vector(n-1 downto 0);
Cin : in std_logic;
S0: in std_logic;
S1: in std_logic;
S2: in std_logic;
S3: in std_logic;
Cout : out std_logic;
F : out std_logic_vector (n-1 DOWNTO 0));

end entity;
Architecture myModel of Assignment2 is
COMPONENT fulladder IS
               
GENERIC (n : integer := 16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
Cin : in std_logic;
Cout : out std_logic;
s : out std_logic_vector (n-1 DOWNTO 0));
END COMPONENT;

SIGNAL temp : std_logic_vector(n-1 DOWNTO 0);
SIGNAL temp2 : std_logic_vector(n-1 DOWNTO 0);
SIGNAL F_temp : std_logic_vector(n-1 DOWNTO 0);
SIGNAL tempcout : std_logic;
begin
F<= A and B when s1='0' and s0='0' and s2='1' and s3='0'
else A or B when s1='0' and s0='1'  and s2='1' and s3='0'
else A xor B when s1='1' and s0='0'  and s2='1' and s3='0'
else  not A when s1='1' and s0='1'  and s2='1' and s3='0'

else '0'& A(n-1 downto 1)when S0='0' AND S1='0'  and s2='0' and s3='1'
else A(0)& A(n-1 downto 1)when S0='1' AND S1='0'  and s2='0' and s3='1'
else Cin & A(n-1 downto 1) when S0='0' AND S1='1'  and s2='0' and s3='1' 
else A(n-1)& A(n-1) &A(n-2 downto 1) when  s0='1' and s1='1' and s2='0' and s3='1'


else A(n-2 downto 0)&'0' when S0='0' AND S1='0' and s2='1' and s3='1'
else A(n-2 downto 0)& A(15) when S0='1' AND S1='0' and s2='1' and s3='1'
else A(n-2 downto 0)& Cin when S0='0' AND S1='1' and s2='1' and s3='1'
else (others => '0') when  S0='1' AND S1='1' and s2='1' and s3='1'
else (others => '0') when S0='1' AND S1='1' AND cin='1'
else F_temp ;

Cout<= A(0) when s2='0' and s3='1'
else   A(n-1) when  s2='1' and s3='1'
else  '0' when S0='1' AND S1='1' AND S2='0' and S3='0' AND cin='1'
else tempcout when S0='1' AND S1='1' AND S2='0' and S3='0' AND cin='0'
else tempcout when S0='0' AND S1='0' AND S2='0' and S3='0' 
else tempcout when S0='0' AND S1='1' AND S2='0' and S3='0' 
else tempcout when S0='1' AND S1='0' AND S2='0' and S3='0' 
else '0';


 


temp<= (Others =>'0') when S0='0' AND S1='0'
else B when S0='1' AND S1='0'
else not B when S0='0' AND S1='1'
else (Others =>'1') when S0='1' AND S1='1' and cin='0'
else (Others =>'0') ;

adder2: fulladder port map(A,temp,Cin,tempcout,F_temp);






end Architecture;
