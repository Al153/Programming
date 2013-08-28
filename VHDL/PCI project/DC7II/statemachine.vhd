Sampler: process(PCI_Clock, PCI_Reset, Sampler_control, Sample_bit, Sample_vector)
begin
	if PCI_reset = '0' then
		for i in 0 to 255 loop
			Sample_vector(i)<='0';
		end loop;

	else
		case Sampler_control is
			when "01" =>
				for i in 0 to 255 loop
				if rising_edge(PCI_Clock) then
					Sample_vector(i) <= Sample_bit;
				end if
			when "10" =>
				for


	end if;
