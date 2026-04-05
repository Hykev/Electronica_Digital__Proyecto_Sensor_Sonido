`timescale 1ns/1ps

module tb_accumulator;

    logic clk;
    logic reset;
    logic enable;
    logic clear;

    logic [11:0] sample_in;
    logic [15:0] sum_out;

    accumulator dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .clear(clear),
        .sample_in(sample_in),
        .sum_out(sum_out)
    );

    // clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;
        clear = 0;
        sample_in = 0;

        #10 reset = 0;

        // First sample
        enable = 1;
        sample_in = 12'd100;
        #10;

        // Second sample
        sample_in = 12'd120;
        #10;

        // Third sample
        sample_in = 12'd90;
        #10;

        // Fourth sample
        sample_in = 12'd110;
        #10;

        enable = 0;

        // Clear accumulator
        clear = 1;
        #10;
        clear = 0;

        $stop;

    end

endmodule