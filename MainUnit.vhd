
Library ieee;
use ieee.std_logic_1164.all;

entity MainUnit is 
GENERIC (n : integer := 16;m: integer :=16);
port(
	edec1: in std_logic;
	edec2: in std_logic;
	seldec1: in std_logic_vector (1 downto 0);
	seldec2: in  std_logic_vector  (1 downto 0);
	clk : in std_logic;
	wen: in std_logic;
	rstctr:in std_logic;
	rst:  in std_logic_vector(3 DOWNTO 0));

end MainUnit;

Architecture myModel of MainUnit is
COMPONENT Buss IS
          PORT( 
        	io : inout std_logic_vector (n-1 DOWNTO 0);
		edec1: in std_logic;
		edec2: in std_logic;
		seldec1: in std_logic_vector (1 downto 0);
		seldec2: in  std_logic_vector  (1 downto 0);
		clk : in std_logic;
		rst:  in std_logic_vector(3 DOWNTO 0));
          END COMPONENT;

COMPONENT RAM IS
          PORT( clk : IN std_logic;
                we : IN std_logic;
	        address : IN std_logic_vector(m-1 DOWNTO 0);
	        datain   : IN std_logic_vector(n-1 DOWNTO 0);
	        dataout : OUT std_logic_vector(n-1 DOWNTO 0) );
          END COMPONENT;
COMPONENT counter IS

 PORT ( clk : IN std_logic;
        rst:in std_logic;
	address : out std_logic_vector(m-1 DOWNTO 0));
 END COMPONENT;

signal iosig : std_logic_vector (n-1 DOWNTO 0);
signal  datain   : std_logic_vector(n-1 DOWNTO 0);
signal dataout :  std_logic_vector(n-1 DOWNTO 0) ;
signal address : std_logic_vector(m-1 DOWNTO 0);
begin

iosig<=dataout when wen='0';
datain<=iosig when wen='1';

BusPort: Buss Port map(iosig,edec1,edec2,seldec1,seldec2,clk,rst);
RamPort: RAM Port map(clk,wen,address,datain,dataout);
CounterPort: counter port map(clk,rstctr,address);


end Architecture;