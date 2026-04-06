`timescale 1ns/1ps

module level_decoder(

    input  logic [15:0] sound_level,
    output logic [3:0]  level_digit

);

always_comb begin

    if(sound_level < 16'd200)
        level_digit = 4'd0;

    else if(sound_level < 16'd400)
        level_digit = 4'd1;

    else if(sound_level < 16'd600)
        level_digit = 4'd2;

    else if(sound_level < 16'd800)
        level_digit = 4'd3;

    else
        level_digit = 4'd4;

end

endmodule