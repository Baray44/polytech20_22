	component my_ISSP is
		port (
			source     : out std_logic_vector(8 downto 0);        -- source
			source_clk : in  std_logic                    := 'X'  -- clk
		);
	end component my_ISSP;

	u0 : component my_ISSP
		port map (
			source     => CONNECTED_TO_source,     --    sources.source
			source_clk => CONNECTED_TO_source_clk  -- source_clk.clk
		);

