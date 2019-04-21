LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY intabdo IS
 
 PORT ( clk : IN std_logic;
        rst:in std_logic;
        modd:in std_logic;
        input: in std_logic_vector (4 DOWNTO 0);
        finaloutput: out std_logic_vector(4 downto 0)
       );

	 
END ENTITY intabdo;


ARCHITECTURE labfinal OF intabdo IS  

Signal RAMaddress :std_logic_vector (4 DOWNTO 0);
Signal RAMinput :std_logic_vector (4 DOWNTO 0);
Signal RAMoutput :std_logic_vector (4 DOWNTO 0);
Signal keylen :std_logic_vector (4 DOWNTO 0);
signal output :std_logic_vector (4 DOWNTO 0);
 
 component ram is 
    GENERIC ( n : integer := 5 ;m : integer := 5);
    port(
        clk : IN std_logic;
        we : IN std_logic;
	address : IN std_logic_vector(m-1 DOWNTO 0);
	datain   : IN std_logic_vector(n-1 DOWNTO 0);
	dataout : OUT std_logic_vector(n-1 DOWNTO 0)
         );
    end component;

component readinput is 
    port(
        clk : IN std_logic;
        rst:in std_logic;
        modd:in std_logic;
        input: in std_logic_vector (4 DOWNTO 0);
        keylength: out std_logic_vector(4 DOWNTO 0);
        AddresstoRAM: out std_logic_vector(4 downto 0);
        inputtoRAM: out std_logic_vector(4 downto 0)
      
         );
    end component;

component genout is 
    port(
        clk : IN std_logic;
        rst:in std_logic;
        modd:in std_logic;
        input: in std_logic_vector (4 DOWNTO 0);
        keylength: in std_logic_vector(4 DOWNTO 0);
        AddresstoRAM: out std_logic_vector(4 downto 0);
        outfromRAM: in std_logic_vector(4 downto 0);
        output: out std_logic_vector(4 downto 0)
      
         );
    end component;

begin

 number1: ram generic map(5,5) port map(clk, modd , RAMaddress, RAMinput,RAMoutput);
 number2: readinput port map(clk,rst,modd,input,keylen,RAMaddress,RAMinput);
 number3: genout port map(clk,rst,modd,input,keylen,RAMaddress,RAMoutput,output);
  finaloutput<=output;
end labfinal;
