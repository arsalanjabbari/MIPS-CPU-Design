`timescale 1ns / 1ps
module AdderSubtractorUnit (
    input [31:0]aAddSub,
    input [31:0]bAddSub,
    input addSubIdentifier,
    output [31:0]resultAddSub,
    output reg zeroFlag,
    output carryFlag
);

// Wires
wire [32:0]carry;
wire [31:0] bFullAdderInput;

// Identify the operator / with the help of figure 4-13 Morris Mano
// Implement carry in of the system, equivalent to identifier of system (add/sub) 
assign carry[0] = addSubIdentifier;

// This concept means, generation in hardware
// XOR for handling subtraction after identification
genvar j;
generate
	for(j = 0; j < 32; j = j + 1) begin
		assign bFullAdderInput[j] = bAddSub[j] ^ addSubIdentifier; 
	end
endgenerate

// Generate 32 Full Adders
genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        FullAdder fa(aAddSub[i], bFullAdderInput[i], carry[i], resultAddSub[i], carry[i+1]);
    end
endgenerate

// result equal zero ? pass it to comparison.
always @(*) begin
    if (resultAddSub == 0) begin
        zeroFlag = 1;
    end
    else begin
        zeroFlag = 0;
    end
end

// last carry out for passing to comparsion unit
assign carryFlag = carry[32];

endmodule
