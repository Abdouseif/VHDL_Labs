Library ieee;
use ieee.std_logic_1164.all;

entity parta is 
GENERIC (n : integer := 16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
Cin : in std_logic;
S0: in std_logic;
S1: in std_logic;
Cout : out std_logic;
F : out std_logic_vector (n-1 DOWNTO 0));

end entity;

Architecture myModel of parta is
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
temp<= (Others =>'0') when S0='0' AND S1='0'
else B when S0='1' AND S1='0'
else not B when S0='0' AND S1='1'
else (Others =>'1') when S0='1' AND S1='1' and cin='0'
else (Others =>'0') ;

adder2: fulladder port map(A,temp,Cin,tempcout,F_temp);

F<= (others => '0') when S0='1' AND S1='1' AND cin='1'
else F_temp ;

cout<= '0' when S0='1' AND S1='1' AND cin='1'
else tempcout;


end Architecture;