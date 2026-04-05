`timescale 1ns/1ps

module tb_alu;

    logic [15:0] A;
    logic [15:0] B;
    logic [1:0] opcode;

    logic [15:0] result;
    logic greater;
    logic equal;

    alu dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .greater(greater),
        .equal(equal)
    );

    initial begin

        $display("Starting ALU testbench");

        // Test 1: Addition
        A = 16'd10;
        B = 16'd5;
        opcode = 2'b00;
        #10;

        // Test 2: Larger addition
        A = 16'd100;
        B = 16'd50;
        opcode = 2'b00;
        #10;

        // Test 3: Comparison A > B
        A = 16'd200;
        B = 16'd100;
        opcode = 2'b01;
        #10;

        // Test 4: Comparison A == B
        A = 16'd300;
        B = 16'd300;
        opcode = 2'b01;
        #10;

        // Test 5: Comparison A < B
        A = 16'd50;
        B = 16'd100;
        opcode = 2'b01;
        #10;

        $display("ALU testbench finished");

        $stop;

    end

endmodule