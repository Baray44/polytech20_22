LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity state_m is
port(clk, reset, newt : in std_logic;
     sel: out std_logic_vector(1 downto 0);
     nxt, first: out std_logic);
end state_m;

architecture rtl of state_m is
TYPE state_type IS (idle, tap1, tap2, tap3, tap4);
SIGNAL state : state_type;
begin

process (reset, clk)
begin
  if reset = '1' then
    state <= idle;
  elsif clk'event and clk = '1' then
    case state is
      when idle => if newt = '1' then
                     state <= tap1;
--                   else
--                     state <= idle;
                   end if;
      when tap1 => state <= tap2;
      when tap2 => state <= tap3;
      when tap3 => state <= tap4;
      when tap4 => if newt = '1' then
                     state <= tap1;
                   else
                     state <= idle;
                   end if;
    end case;
  end if;
end process;

output: process(state)
begin
  nxt <= '0';   -- default value
  first <= '0'; -- default value
  sel <= "00";  -- default value

  case state is
    when idle => null; -- use defaults
    when tap1 => first <= '1';
    when tap2 => sel <= "01";
    when tap3 => sel <= "10";
    when tap4 => sel <= "11";
                 nxt <= '1';
  end case;
end process output;

end rtl;
