module alu (

    input  logic [15:0] A,
    input  logic [15:0] B,
    input  logic [1:0]  opcode,

    output logic [15:0] result,
    output logic greater,
    output logic equal
);

    always_comb begin

        result  = 0;
        greater = 0;
        equal   = 0;

        case (opcode)

            2'b00: begin
                result = A + B;
            end

            2'b01: begin
                if (A > B)
                    greater = 1;
                else
                    greater = 0;

                if (A == B)
                    equal = 1;
                else
                    equal = 0;
            end

            default: begin
                result  = 0;
                greater = 0;
                equal   = 0;
            end

        endcase
    end

endmodule