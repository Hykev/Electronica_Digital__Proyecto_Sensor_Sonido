`timescale 1ns/1ps

module tb_clock_divider;

    logic clk;
    logic reset;
    logic clk_out;

    clock_divider #(
        .DIVISOR(10)
    ) dut (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        #10 reset = 0;

        #200;

        $stop;

    end

endmodule