
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY dec_counter IS
	Generic ( n: integer := 16);
	PORT( clk ,rst: in std_logic;
		data_out : out std_logic_vector ( n-1 downto 0)
		);
END ENTITY dec_counter;

ARCHITECTURE dec_counter_arch OF dec_counter IS

component generic_register is
Generic (n: integer := 16);
port ( 
d : in std_logic_vector (n-1 downto 0);
clk, rst, enable: IN std_logic;
q: out std_logic_vector(n-1 downto 0)
);

end component;

signal rego: std_logic_vector( n-1 downto 0);
begin


process(clk, rst)
begin
	if rst = '1'  then rego <= std_logic_vector(to_unsigned(0,n));
elsif rising_edge(clk) then rego <= std_logic_vector(unsigned(rego) + 1);
end if;
end process;
data_out <= rego;
	
END dec_counter_arch;