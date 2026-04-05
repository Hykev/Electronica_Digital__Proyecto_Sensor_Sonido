module register_bank (
    input  logic clk,
    input  logic reset,

    input  logic [11:0] sensor_data_in,
    input  logic [15:0] accumulator_in,
    input  logic [4:0]  sample_count_in,

    input  logic write_sensor,
    input  logic write_accumulator,
    input  logic write_count,

    output logic [11:0] sensor_data,
    output logic [15:0] accumulator,
    output logic [4:0]  sample_count
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sensor_data <= 0;
            accumulator <= 0;
            sample_count <= 0;
        end
        else begin
            if (write_sensor)
                sensor_data <= sensor_data_in;

            if (write_accumulator)
                accumulator <= accumulator_in;

            if (write_count)
                sample_count <= sample_count_in;
        end
    end

endmodule