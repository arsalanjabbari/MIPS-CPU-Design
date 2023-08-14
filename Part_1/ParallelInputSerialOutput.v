`timescale 1ns / 1ps
module ParallelInputSerialOutput(
    input [3:0]parallelInput,
    input latchC,
    input shiftC,
    input clk,
    output serialOutput
);

    reg [3:0]data;

    always@(posedge clk) begin
        if(latchC)begin
            data = parallelInput;
        end
        else if(shiftC) begin
            data = {1'b0, data[3:1]};
        end
    end

    assign serialOutput = data[0];

endmodule
