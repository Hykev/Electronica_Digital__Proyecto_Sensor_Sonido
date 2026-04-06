`timescale 1ns/1ps

module control_fsm(
    input  logic clk,
    input  logic reset,

    input  logic sample_ready,
    input  logic level_high,

    output logic take_sample,
    output logic accumulate,
    output logic compute,
    output logic update_display
);

typedef enum logic [2:0] {
    IDLE,
    SAMPLE,
    ACCUMULATE,
    COMPUTE,
    DISPLAY
} state_t;

state_t state, next_state;

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

always_comb begin
    next_state = state;

    case(state)

        IDLE:
            if(sample_ready)
                next_state = SAMPLE;

        SAMPLE:
            next_state = ACCUMULATE;

        ACCUMULATE:
            next_state = COMPUTE;

        COMPUTE:
            next_state = DISPLAY;

        DISPLAY:
            next_state = IDLE;

    endcase
end

always_comb begin

    take_sample    = 0;
    accumulate     = 0;
    compute        = 0;
    update_display = 0;

    case(state)

        SAMPLE:
            take_sample = 1;

        ACCUMULATE:
            accumulate = 1;

        COMPUTE:
            compute = 1;

        DISPLAY:
            update_display = 1;

    endcase
end

endmodule