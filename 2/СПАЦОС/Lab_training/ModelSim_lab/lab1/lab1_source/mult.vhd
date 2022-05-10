library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult is
  port (dataa : in std_logic_vector(7 downto 0);
        datab : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(10 downto 0));
end mult;
    
architecture rtl of mult is
begin
	result <= dataa * datab;
end rtl;
