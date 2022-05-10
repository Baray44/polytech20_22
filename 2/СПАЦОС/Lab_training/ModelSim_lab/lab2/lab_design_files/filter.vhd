library ieee;
use ieee.std_logic_1164.all;

entity filter is
port (clk, reset, newt : in std_logic;
      d : in std_logic_vector(7 downto 0);
      yvalid, nxt: out std_logic;
      yn : out std_logic_vector(7 downto 0));
end filter;

architecture struct of filter is
signal taps_to_mult : std_logic_vector(7 downto 0);
signal hvalues_to_mult : std_logic_vector(2 downto 0);
signal mult_to_acc : std_logic_vector(10 downto 0);
signal sel_int : std_logic_vector(1 downto 0);
signal first_int, next_int : std_logic;

component acc
  port(xh : in std_logic_vector(10 downto 0);
       clk, first, reset, nxt: in std_logic;

	 yvalid : out std_logic;
       yn : out std_logic_vector(11 downto 4));
end component;

component hvalues_mf
 PORT (
		address		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
	    ); 
	end component;

component state_m
  port(clk, reset, newt : in std_logic;
       sel: out std_logic_vector(1 downto 0);
       nxt, first: out std_logic);
end component;

component taps
  port(clk, newt, reset	: in std_logic;
       d : in std_logic_vector(7 downto 0);
       sel : in std_logic_vector(1 downto 0);
       x : out std_logic_vector(7 downto 0));
end component;

    
component mult_lpm 
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
	);
END component;
    
    
    
begin
u1: taps port map(clk => clk, 
                  newt => newt, 
                  reset => reset,
                  d => d, 
                  sel => sel_int, 
                  x => taps_to_mult);

u2: hvalues_mf port map(
		                address	=> sel_int,
		                clock			=>   clk,
		                q		     =>   hvalues_to_mult);
	 

u3: state_m port map(clk =>   clk, 
                 reset => reset, 
                 newt =>    newt,
                 sel =>   sel_int, 
                 nxt =>   next_int, 
                 first => first_int);

u4: mult_lpm port map(		clock		=>   clk,
		                  dataa		=> taps_to_mult,
		                  datab => hvalues_to_mult,
		                  result => mult_to_acc );
	
u5: acc port map (xh => mult_to_acc, 
                  clk => clk, 
                  reset => reset,
                  first => first_int,
 	       		nxt => next_int,
			yvalid => yvalid,
                  yn => yn);

nxt <= next_int;

end struct;

