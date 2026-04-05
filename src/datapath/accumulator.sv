module accumulator (
    input  logic clk,
    input  logic reset,

    input  logic enable,
    input  logic clear,

    input  logic [11:0] sample_in,

    output logic [15:0] sum_out
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sum_out <= 0;
        end
        else if (clear) begin
            sum_out <= 0;
        end
        else if (enable) begin
            sum_out <= sum_out + sample_in;
        end
    end

endmodule