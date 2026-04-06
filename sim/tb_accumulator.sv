`timescale 1ns/1ps

module tb_accumulator;

    logic clk;
    logic reset;
    logic enable;
    logic clear;

    logic [11:0] sample_in;
    logic [15:0] sum_out;

    accumulator DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .clear(clear),
        .sample_in(sample_in),
        .sum_out(sum_out)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;
        clear = 0;

        #10 reset = 0;

        $display("==== INICIO TEST ACCUMULATOR ====");

        enable = 1;

        sample_in = 100;
        #10;
        $display("Sample: %d | Accumulator: %d", sample_in, sum_out);

        sample_in = 120;
        #10;
        $display("Sample: %d | Accumulator: %d", sample_in, sum_out);

        sample_in = 80;
        #10;
        $display("Sample: %d | Accumulator: %d", sample_in, sum_out);

        sample_in = 200;
        #10;
        $display("Sample: %d | Accumulator: %d", sample_in, sum_out);

        // limpiar acumulador
        clear = 1;
        #10;
        clear = 0;

        $display("Accumulator cleared: %d", sum_out);

        $display("==== FIN TEST ACCUMULATOR ====");

        $finish;

    end

endmodule