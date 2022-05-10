library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity acc is
port( xh : in std_logic_vector(10 downto 0);
      clk, first, reset, nxt: in std_logic;

	yvalid : out std_logic;

      yn : out std_logic_vector(11 downto 4));
end acc;

architecture rtl of acc is
signal y_tmp : std_logic_vector(11 downto 0);
begin

process(clk,reset)
begin
  if (reset = '1') then
    y_tmp <= (OTHERS => '0');
  elsif clk'event and clk = '1' then

    if first = '1' then
      y_tmp <= ('0' & xh);
    else
      y_tmp <= ('0' & xh) + y_tmp;
    end if;

  end if;

end process;



process (clk)

begin

	yvalid <= nxt;

end process;


yn <= y_tmp(11 downto 4);

end rtl;
 
