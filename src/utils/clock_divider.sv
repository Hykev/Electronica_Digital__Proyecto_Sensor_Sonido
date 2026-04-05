module clock_divider #(
    parameter DIVISOR = 50000000
)(
    input  logic clk,
    input  logic reset,
    output logic clk_out
);

    logic [$clog2(DIVISOR)-1:0] counter;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end
        else begin
            if (counter == DIVISOR-1) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

endmodule