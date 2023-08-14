`timescale 1ns / 1ps
module main(
	input [31:0]firstInput,
	input [31:0]secondInput,
	input [5:0]opcode,
	output [31:0]theOutput
	);

    // Wires, Output of modules
	wire [31:0]shiftRotateUnitOutput;
	wire [31:0]logicalUnitOutput;
	wire [31:0]comparisonUnitOutput;
	wire [31:0]adderSubtracterUnitOutput;

    // adder/subtraction unit equals zero? have carryout?
	wire carryFlag;
	wire zeroFlag;

// Adder/Subtraction Unit
AdderSubtractorUnit addSub (
    .aAddSub(firstInput),
    .bAddSub(secondInput),
    .addSubIdentifier(opcode[3]),
    .resultAddSub(adderSubtracterUnitOutput),
    .zeroFlag(zeroFlag),
    .carryFlag(carryFlag)
    );

// Comparison Unit
ComparisonUnit comparsion (
    .aComparison(firstInput[31]), 
    .bComparison(secondInput[31]), 
    .opcodeComparison(opcode[2:0]),
    .carryFlag(carryFlag), 
    .zeroFlag(zeroFlag), 
    .diff(adderSubtracterUnitOutput[31]),  
    .resultComparison(comparisonUnitOutput)
    );

// Logical Unit
LogicalUnit logical (
    .aLogical(firstInput), 
    .bLogical(secondInput), 
    .opcodeLogical(opcode[1:0]), 
    .resultLogical(logicalUnitOutput)
    );

// Shift/Rotate Unit
ShiftRotateUnit shiftRot (
    .aShiftRotate(firstInput), 
    .bShiftRotate(secondInput[4:0]), 
    .opcodeShiftRotate(opcode[2:0]), 
    .resultShiftRotate(shiftRotateUnitOutput)
    );

// Multiplexer Unit
Multiplexer4_1 mux4_1 (
    .aMux(adderSubtracterUnitOutput), 
    .bMux(comparisonUnitOutput), 
    .cMux(logicalUnitOutput), 
    .dMux(shiftRotateUnitOutput), 
    .selectMux(opcode[5:4]), 
    .outputMux(theOutput)
    );

endmodule
