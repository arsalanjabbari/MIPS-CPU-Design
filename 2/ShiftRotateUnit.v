`timescale 1ns / 1ps
module ShiftRotateUnit (
    input signed [31:0]aShiftRotate,
    input [4:0]bShiftRotate,
    input [2:0]opcodeShiftRotate,
    output reg [31:0]resultShiftRotate
);

// Implementation
always @(*) begin
    case (opcodeShiftRotate)
        3'b000: resultShiftRotate = (aShiftRotate << bShiftRotate)|(aShiftRotate >> (32 - bShiftRotate));
        3'b001: resultShiftRotate = (aShiftRotate >> bShiftRotate)|(aShiftRotate << (32 - bShiftRotate));
        3'b010: resultShiftRotate = aShiftRotate << bShiftRotate;
        3'b011: resultShiftRotate = aShiftRotate >> bShiftRotate;
        3'b111: resultShiftRotate = aShiftRotate >>> bShiftRotate;
    endcase
end

endmodule
