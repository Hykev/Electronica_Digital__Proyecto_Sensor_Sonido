`timescale 1ns/1ps

module xadc_interface(

    input  logic clk,
    input  logic reset,

    output logic [11:0] adc_data,
    output logic sample_ready

);

logic [11:0] counter;

always_ff @(posedge clk or posedge reset) begin

    if(reset) begin
        counter <= 0;
        sample_ready <= 0;
    end
    else begin
        counter <= counter + 1;

        adc_data <= counter;
        sample_ready <= 1;
    end

end

endmodule