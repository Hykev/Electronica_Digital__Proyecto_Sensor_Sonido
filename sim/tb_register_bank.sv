`timescale 1ns/1ps

module tb_register_bank;

    logic clk;
    logic reset;

    logic [11:0] sensor_data_in;
    logic [15:0] accumulator_in;
    logic [4:0]  sample_count_in;

    logic write_sensor;
    logic write_accumulator;
    logic write_count;

    logic [11:0] sensor_data;
    logic [15:0] accumulator;
    logic [4:0]  sample_count;

    register_bank DUT (
        .clk(clk),
        .reset(reset),
        .sensor_data_in(sensor_data_in),
        .accumulator_in(accumulator_in),
        .sample_count_in(sample_count_in),
        .write_sensor(write_sensor),
        .write_accumulator(write_accumulator),
        .write_count(write_count),
        .sensor_data(sensor_data),
        .accumulator(accumulator),
        .sample_count(sample_count)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        write_sensor = 0;
        write_accumulator = 0;
        write_count = 0;

        #10 reset = 0;

        $display("==== INICIO TEST REGISTER BANK ====");

        // escribir sensor
        sensor_data_in = 350;
        write_sensor = 1;
        #10;
        write_sensor = 0;

        $display("Sensor Register = %d", sensor_data);

        // escribir acumulador
        accumulator_in = 1200;
        write_accumulator = 1;
        #10;
        write_accumulator = 0;

        $display("Accumulator Register = %d", accumulator);

        // escribir contador
        sample_count_in = 8;
        write_count = 1;
        #10;
        write_count = 0;

        $display("Sample Count Register = %d", sample_count);

        $display("==== FIN TEST REGISTER BANK ====");

        $finish;

    end

endmodule