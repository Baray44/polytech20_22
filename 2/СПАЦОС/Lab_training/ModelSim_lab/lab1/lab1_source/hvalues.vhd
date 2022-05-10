library ieee;
use ieee.std_logic_1164.all;
 
entity hvalues is
port(sel : in std_logic_vector(1 downto 0);
     h : out std_logic_vector(2 downto 0));
end hvalues;

architecture rtl of hvalues is
  constant coeff_a: std_logic_vector := "111";
  constant coeff_b: std_logic_vector := "101";
  constant coeff_c: std_logic_vector := "011";
  constant coeff_d: std_logic_vector := "001";
begin

process(sel)
begin
  if (sel = "00") then 
    h <= coeff_a;
  elsif (sel = "01") then 
    h <= coeff_b;
  elsif (sel = "10") then 
    h <= coeff_c;
  else 
    h <= coeff_d;
  end if;
end process;

end rtl;
