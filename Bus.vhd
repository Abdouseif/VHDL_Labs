Library ieee;
use ieee.std_logic_1164.all;

entity Buss is 
GENERIC (n : integer := 16);
port(
io : inout std_logic_vector (n-1 DOWNTO 0);
edec1: in std_logic;
edec2: in std_logic;
seldec1: in std_logic_vector (1 downto 0);
seldec2: in  std_logic_vector  (1 downto 0);
clk : in std_logic;
rst:  in std_logic_vector(3 DOWNTO 0));
end Buss;

Architecture myModel of buss is
COMPONENT my_nDFF IS
          PORT( Clk,Rst,e : IN std_logic;
                d : IN std_logic_vector(n-1 DOWNTO 0);
                q : OUT std_logic_vector(n-1 DOWNTO 0));
          END COMPONENT;

COMPONENT buf IS
          PORT( inn : IN std_logic_vector (n-1 DOWNTO 0);
                outt : out std_logic_vector(n-1 downto 0);
                c : in std_logic);
          END COMPONENT;
COMPONENT Decoder IS

PORT(inn : IN std_logic_vector (1 DOWNTO 0);
outt : out std_logic_vector(3 downto 0);
e : in std_logic);
 END COMPONENT;

signal enreg1,enreg2,enreg3,enreg4  :std_logic;
signal cbuf1,cbuf2,cbuf3,cbuf4 :std_logic;
signal inbuf1,inbuf2,inbuf3,inbuf4 : std_logic_vector(n-1 DoWNTO 0);
signal dec1out,dec2out : std_logic_vector (3 DOWNTO 0);


begin

enreg1<=dec1out(0);
enreg2<=dec1out(1);
enreg3<=dec1out(2);
enreg4<=dec1out(3);
cbuf1<=dec2out(0);
cbuf2<=dec2out(1);
cbuf3<=dec2out(2);
cbuf4<=dec2out(3);

REG1: my_nDFF Port map(clk,rst(0),enreg1,io,inbuf1);
REG2: my_nDFF Port map(clk,rst(1),enreg2,io,inbuf2);
REG3: my_nDFF Port map(clk,rst(2),enreg3,io,inbuf3);
REG4: my_nDFF Port map(clk,rst(3),enreg4,io,inbuf4);

BUF1: buf PORT MAP(inbuf1,io,cbuf1);
BUF2: buf PORT MAP(inbuf2,io,cbuf2);
BUF3: buf PORT MAP(inbuf3,io,cbuf3);
BUF4: buf PORT MAP(inbuf4,io,cbuf4);

DEC1: Decoder port map(seldec1,dec1out,edec1);
DEC2: Decoder port map(seldec2,dec2out,edec2);


end Architecture;
