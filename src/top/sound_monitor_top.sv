`timescale 1ns/1ps

module sound_monitor_top(

    input  logic clk,
    input  logic reset,

    output logic [6:0] seg

);

logic [11:0] adc_data;
logic sample_ready;

logic take_sample;
logic accumulate;
logic compute;
logic update_display;

logic [15:0] accumulated_value;
logic [3:0] level_digit;

xadc_interface xadc(

    .clk(clk),
    .reset(reset),
    .adc_data(adc_data),
    .sample_ready(sample_ready)

);

control_fsm fsm(

    .clk(clk),
    .reset(reset),
    .sample_ready(sample_ready),
    .level_high(1'b0),

    .take_sample(take_sample),
    .accumulate(accumulate),
    .compute(compute),
    .update_display(update_display)

);

accumulator acc(

    .clk(clk),
    .reset(reset),
    .enable(accumulate),
    .clear(1'b0),
    .sample_in(adc_data),
    .sum_out(accumulated_value)

);

level_decoder decoder(

    .sound_level(accumulated_value),
    .level_digit(level_digit)

);

sevenseg_driver display(

    .digit(level_digit),
    .seg(seg)

);

endmodule