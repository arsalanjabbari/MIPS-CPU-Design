`timescale 1ns / 1ps
module LogicalUnit (
    input [31:0]aLogical,
    input [31:0]bLogical,
    input [1:0]opcodeLogical,
    output reg [31:0]resultLogical
);
// Implementation
always @(*) begin
    case (opcodeLogical)
        2'b00: resultLogical = ~ (aLogical | bLogical);
        2'b01: resultLogical = aLogical & bLogical;
        2'b10: resultLogical = aLogical | bLogical;
        2'b11: resultLogical = aLogical ^ bLogical;
    endcase
end

endmodule
