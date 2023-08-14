`timescale 1ns / 1ps
module SerialInputParallelOutput(
    input serialInput,
    input shiftA,
    input clk,
    output [3:0]parallelOutput
);
    reg [3:0]data;

    always@(posedge clk) begin
        if(shiftA)begin
            data = {data[2:0], serialInput}
        end
    end

    assign parallelOutput = data;

endmodule
