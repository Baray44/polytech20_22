LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY taps IS
  PORT( clk, newt, reset : IN std_logic;
        d : IN std_logic_vector(7 downto 0);
	sel : IN std_logic_vector(1 downto 0);
	x : OUT	std_logic_vector(7 downto 0));
END taps;

ARCHITECTURE rtl OF taps IS
  signal xn, xn_1, xn_2, xn_3 : STD_LOGIC_VECTOR(7 downto 0);
BEGIN

reg: PROCESS(clk, reset)
BEGIN
  if reset = '1' then
    xn   <= "00000000";
    xn_1 <= "00000000";
    xn_2 <= "00000000";
    xn_3 <= "00000000";
  elsif clk'event and clk = '1' then
    if newt = '1' then
      xn   <= d;
      xn_1 <= xn;
      xn_2 <= xn_1;
      xn_3 <= xn_2;
    end if;
  end if;
END PROCESS reg;

mux41: PROCESS(sel, xn, xn_1, xn_2, xn_3)
BEGIN
  case sel is
    when "00" => x <= xn;
    when "01" => x <= xn_1;
    when "10" => x <= xn_2;
    when "11" => x <= xn_3;
    when others => x <= "XXXXXXXX";
  end case;
END PROCESS mux41;

END rtl;
