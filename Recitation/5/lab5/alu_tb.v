`timescale 1 ns / 100 ps

module alu_tb();

    // inputs to the ALU are reg type

    reg            clock;
    reg [31:0] data_operandA, data_operandB, data_expected;
    reg [4:0] ctrl_ALUopcode, ctrl_shiftamt;


    // outputs from the ALU are wire type
    wire [31:0] data_result;
    wire isNotEqual, isLessThan, overflow;


    // Tracking the number of errors
    integer errors;
    integer index;    // for testing...


    // Instantiate ALU
    alu alu_ut(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt,
        data_result, isNotEqual, isLessThan, overflow);

    initial

    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;

        checkOr();
        checkAnd();
        checkAdd();
        checkSub();
//        checkSLL();
//        checkSRA();

//        checkNE();
//        checkLT();
        checkOverflow();

        if(errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        $stop;
    end

    // Clock generator
    always
         #10     clock = ~clock;

    task checkOr;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00011;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in OR (test 1); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 2); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 3); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 4); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end
        end
    endtask

    task checkAnd;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00010;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in AND (test 5); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in AND (test 6); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in AND (test 7); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in AND (test 8); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end
        end
    endtask

    task checkAdd;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00000;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in ADD (test 9); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            for(index = 0; index < 31; index = index + 1)
            begin
                @(negedge clock);
                assign data_operandA = 32'h00000001 << index;
                assign data_operandB = 32'h00000001 << index;

                assign data_expected = 32'h00000001 << (index + 1);

                @(negedge clock);
                if(data_result !== data_expected) begin
                    $display("**Error in ADD (test 17 part %d); expected: %h, actual: %h", index, data_expected, data_result);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("add - A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
					 end
					 // end test
            end
        end
    endtask

    task checkSub;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00001;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in SUB (test 10); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end
       
			//sub loop test 1
				for(index = 0; index < 31; index = index + 1)
				begin
					@(negedge clock);
					assign data_operandA = 32'h00000001 << index;
					assign data_operandB = 32'h00000001 << (index+1);

					assign data_expected = data_operandA - data_operandB;

					@(negedge clock);
					if(data_result !== data_expected) begin
						$display("**Error in SUB (test sub loop test1: %d); expected: %h, actual: %h", index, data_expected, data_result);
						errors = errors + 1;
					end
					 
					else begin
						$display("sub - A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
					end
				end
			//end test 1
			//sub loop test 2
				for(index = 0; index < 31; index = index + 1)
				begin
					@(negedge clock);
					assign data_operandA = 32'h00000001 << (index+1);
					assign data_operandB = 32'h00000001 << index;

					assign data_expected = data_operandA - data_operandB;

					@(negedge clock);
					if(data_result !== data_expected) begin
						$display("**Error in SUB (test sub loop test2: %d); expected: %h, actual: %h", index, data_expected, data_result);
						errors = errors + 1;
					end
					 
					else begin
						$display("sub - A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
					end
				end
			//end test 2
			end
    endtask

    task checkSLL;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00100;
            assign data_operandB = 32'h00000000;

            assign data_operandA = 32'h00000001;
            assign ctrl_shiftamt = 5'b00000;

            @(negedge clock);
            if(data_result !== 32'h00000001) begin
                $display("**Error in SLL (test 11); expected: %h, actual: %h", 32'h00000001, data_result);
                errors = errors + 1;
            end

            for(index = 0; index < 5; index = index + 1)
            begin
                @(negedge clock);
                assign data_operandA = 32'h00000001;
                assign ctrl_shiftamt = 5'b00001 << index;

                assign data_expected = 32'h00000001 << (2**index);

                @(negedge clock);
                if(data_result !== data_expected) begin
                    $display("**Error in SLL (test 18 part %d); expected: %h, actual: %h", index, data_expected, data_result);
                    errors = errors + 1;
                end
            end

            for(index = 0; index < 4; index = index + 1)
            begin
                @(negedge clock);
                assign data_operandA = 32'h00000001;
                assign ctrl_shiftamt = 5'b00011 << index;

                assign data_expected = 32'h00000001 << ((2**index) + (2**(index + 1)));

                @(negedge clock);
                if(data_result !== data_expected) begin
                    $display("**Error in SLL (test 19 part %d); expected: %h, actual: %h", index, data_expected, data_result);
                    errors = errors + 1;
                end
            end
        end
    endtask

    task checkSRA;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00101;
            assign data_operandB = 32'h00000000;

            assign data_operandA = 32'h00000000;
            assign ctrl_shiftamt = 5'b00000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in SRA (test 12); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end
				
				//self test
				//1
				@(negedge clock);
            assign data_operandA = 32'h00000000;
            assign ctrl_shiftamt = 5'b00001;

            @(negedge clock);
            if(data_result !== 32'h80000000) begin
                $display("**Error in SRA (s1); expected: %h, actual: %h", 32'h80000000, data_result);
                errors = errors + 1;
            end
            
				//2
				@(negedge clock);
            assign data_operandA = 32'h00001000;
            assign ctrl_shiftamt = 5'b00100;

            @(negedge clock);
            if(data_result !== 32'h00000100) begin
                $display("**Error in SRA (s2); expected: %h, actual: %h", 32'h80000000, data_result);
                errors = errors + 1;
            end
				
				//end test
        end
    endtask

    task checkNE;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00001;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(isNotEqual !== 1'b0) begin
                $display("**Error in isNotEqual (test 13); expected: %b, actual: %b", 1'b0, isNotEqual);
                errors = errors + 1;
            end
				else begin
					$display("NE - A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
				end
				
				//self test
					//1
                @(negedge clock);
                assign data_operandA = 32'h00000001;
                assign data_operandB = 32'h00000001;

                @(negedge clock);
                if(isNotEqual !== 1'b0) begin
                    $display("**Error in NE (test s1); expected: %h, actual: %b", 1'b0, isNotEqual);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, 1'b0, isNotEqual);
					 end
					 
					 //2
                @(negedge clock);
                assign data_operandA = 32'h00000010;
                assign data_operandB = 32'h00000001;

                @(negedge clock);
                if(isNotEqual !== 1'b1) begin
                    $display("**Error in NE (test s2); expected: %h, actual: %b", 1'b1, isNotEqual);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, 1'b1, isNotEqual);
					 end
					 
					 //3
                @(negedge clock);
                assign data_operandA = 32'h00000011;
                assign data_operandB = 32'h00000001;

                @(negedge clock);
                if(isNotEqual !== 1'b1) begin
                    $display("**Error in NE (test s3); expected: %h, actual: %b", 1'b1, isNotEqual);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, 1'b1, isNotEqual);
					 end
					 
					 //4
                @(negedge clock);
                assign data_operandA = 32'h00100001;
                assign data_operandB = 32'h00100001;

                @(negedge clock);
                if(isNotEqual !== 1'b0) begin
                    $display("**Error in NE (test s4); expected: %h, actual: %b", 1'b0, isNotEqual);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, 1'b0, isNotEqual);
					 end
					 
					 //5
                @(negedge clock);
                assign data_operandA = 32'h10100001;
                assign data_operandB = 32'h00100001;

                @(negedge clock);
                if(isNotEqual !== 1'b1) begin
                    $display("**Error in NE (test s5); expected: %h, actual: %b", 1'b1, isNotEqual);
                    errors = errors + 1;
                end
					 // test output print
					 else begin
						$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, 1'b1, isNotEqual);
					 end
					 
					 //for
					 for(index = 0; index < 31; index = index + 1)
					 begin
						 @(negedge clock);
						 assign data_operandA = 32'h00000001;
						 assign data_operandB = 32'h00000001 << index;
							
						 if(index == 0) begin
							assign data_expected = 1'b0;
						 end
						 else begin
							assign data_expected = 1'b1;
						 end
	
						 @(negedge clock);
						 if(isNotEqual !== data_expected) begin
							  $display("**Error in NE (test s for part %d); expected: %h actual: %b", index, data_expected, isNotEqual);
							  errors = errors + 1;
						 end
						 // test output print
						 else begin
							$display("NE - A: %h, B: %h, expected: %h, actual: %b", data_operandA, data_operandB, data_expected, isNotEqual);
						 end
					 // end for test
					 end
					 
				// end test
				
        end
    endtask

    task checkLT;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00001;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(isLessThan !== 1'b0) begin
                $display("**Error in isLessThan (test 14); expected: %b, actual: %b", 1'b0, isLessThan);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h0FFFFFFF;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(isLessThan !== 1'b0) begin
                $display("**Error in isLessThan (test 23); expected: %b, actual: %b", 1'b0, isLessThan);
                errors = errors + 1;
            end

            // Less than with overflow
            @(negedge clock);
            assign data_operandA = 32'h80000001;
            assign data_operandB = 32'h7FFFFFFF;

            @(negedge clock);
            if(isLessThan !== 1'b1) begin
                $display("**Error in isLessThan (test 24); expected: %b, actual: %b", 1'b1, isLessThan);
                errors = errors + 1;
            end
				
				
        end
    endtask

    task checkOverflow;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00000;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(overflow !== 1'b0) begin
                $display("**Error in overflow (test 15); expected: %b, actual: %b", 1'b0, overflow);
                errors = errors + 1;
            end
				
            @(negedge clock);
            assign data_operandA = 32'h80000000;
            assign data_operandB = 32'h80000000;

            @(negedge clock);
            if(overflow !== 1'b1) begin
                $display("**Error in overflow (test 20); expected: %b, actual: %b", 1'b1, overflow);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h40000000;
            assign data_operandB = 32'h40000000;

            @(negedge clock);
            if(overflow !== 1'b1) begin
                $display("**Error in overflow (test 21); expected: %b, actual: %b", 1'b1, overflow);
                errors = errors + 1;
            end

            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00001;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(overflow !== 1'b0) begin
                $display("**Error in overflow (test 16); expected: %b, actual: %b", 1'b0, overflow);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h80000000;
            assign data_operandB = 32'h80000000;

            @(negedge clock);
            if(overflow !== 1'b0) begin
                $display("**Error in overflow (test 22); expected: %b, actual: %b", 1'b0, overflow);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h80000000;
            assign data_operandB = 32'h0F000000;

            @(negedge clock);
            if(overflow !== 1'b1) begin
                $display("**Error in overflow (test 25); expected: %b, actual: %b", 1'b1, overflow);
                errors = errors + 1;
            end
        end
    endtask

endmodule
