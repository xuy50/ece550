`timescale 1 ns / 1 ps
module skeleton_tb();


reg clock, reset, errors;
wire imem_clock, dmem_clock, processor_clock, regfile_clock;



skeleton s1(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);
					 
			
initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b1;    // at time 0
        errors = 0;

        reset = 1'b1;    // assert reset
        @(negedge clock);    // wait until next negative edge of clock
        @(negedge clock);    // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
        @(negedge clock);    // wait until next negative edge of clock

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        #4000 $stop;
end

	
always
	#10     clock = ~clock;
	
endmodule 