`timescale 1ns / 1ps

module Multiplexer4_1(
    input [31:0]aMux,
    input [31:0]bMux,
    input [31:0]cMux,
    input [31:0]dMux,
    input [1:0]selectMux,
    output [31:0]outputMux
    );

// Implementation
assign outputMux = selectMux[1] ? (selectMux[0] ? dMux : cMux) : (selectMux[0] ? bMux : aMux);

endmodule
