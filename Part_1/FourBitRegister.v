`timescale 1ns / 1ps
module FourBitRegister (
    input clk,
    input latchB,
    input [3:0]inputFourBit,
    output reg [3:0]outputFourBit
);
    always @(negedge clk) begin
        if (!latchB) begin
            outputFourBit == inputFourBit
        end
    end
endmodule
