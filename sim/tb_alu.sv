`timescale 1ns/1ps

module tb_alu;

    logic [15:0] A;
    logic [15:0] B;
    logic [1:0] opcode;

    logic [15:0] result;
    logic greater;
    logic equal;

    alu DUT (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .greater(greater),
        .equal(equal)
    );

    initial begin

        $display("==== INICIO TEST ALU ====");

        // Test 1: Suma
        A = 10;
        B = 5;
        opcode = 2'b00;
        #10;

        $display("SUMA: %d + %d = %d", A, B, result);

        // Test 2: Suma mayor
        A = 100;
        B = 50;
        opcode = 2'b00;
        #10;

        $display("SUMA: %d + %d = %d", A, B, result);

        // Test 3: Comparación A > B
        A = 20;
        B = 10;
        opcode = 2'b01;
        #10;

        $display("COMPARE: A=%d B=%d | greater=%b equal=%b", A, B, greater, equal);

        // Test 4: Comparación A == B
        A = 30;
        B = 30;
        opcode = 2'b01;
        #10;

        $display("COMPARE: A=%d B=%d | greater=%b equal=%b", A, B, greater, equal);

        $display("==== FIN TEST ALU ====");

        $finish;

    end

endmodule