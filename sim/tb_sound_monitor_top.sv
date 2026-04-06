`timescale 1ns/1ps

module tb_sound_monitor_top;

logic clk;
logic reset;

logic [6:0] seg;

sound_monitor_top DUT(

    .clk(clk),
    .reset(reset),
    .seg(seg)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #20
    reset = 0;

    $display("==== INICIO TEST SISTEMA COMPLETO ====");

    repeat(50) begin
        #20;
        $display("time=%0t seg=%b", $time, seg);
    end

    $display("==== FIN TEST SISTEMA ====");

    $finish;

end

endmodule