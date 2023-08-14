`timescale 1ns / 1ps
module FourBitAdder (
    input [4:0]a_input,
    input [4:0]b_input,
    output [4:0]theOutput
);

    assign theOutput = a_input + b_input;



endmodule

