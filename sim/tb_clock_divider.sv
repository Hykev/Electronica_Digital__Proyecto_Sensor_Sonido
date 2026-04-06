`timescale 1ns/1ps

module tb_clock_divider;

    logic clk;
    logic reset;
    logic clk_out;

    // divisor pequeño para simulación
    clock_divider #(
        .DIVISOR(4)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    // reloj base
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        $display("==== INICIO TEST CLOCK DIVIDER ====");

        #10;
        reset = 0;

        repeat(20) begin
            #10;
            $display("time=%0t | clk=%b | clk_out=%b", $time, clk, clk_out);
        end

        $display("==== FIN TEST CLOCK DIVIDER ====");

        $finish;

    end

endmodule