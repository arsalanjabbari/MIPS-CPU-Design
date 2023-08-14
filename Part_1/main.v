`timescale 1ns / 1ps
module main (
    input clk,
    input reset,
    input startA,
    input [4:0]firstInput,
    input loadB,
    input [4:0]secondInput,
    output [4:0]theOutput,
    output startC
);
    wire reset;
    wire startA;
    wire lookaheadBitA;
    wire loadB;
    wire [4:0]inputB;
    wire clk;
    wire shiftA;
    wire latchB;
    wire latchC;
    wire shiftC;
    wire startC;
    
	wire [4:0]fourBitAdderOutput;
	wire [31:0]fourBitRegisterOutput;
	wire [31:0]parallelInputSerialOutput;
	wire [4:0]serialInputParallelOutput;


Controller controller(
    .clk(clk);
    .startA(startA);
    .loadB(loadB);
    .shiftA(shiftA);
    .latchB(latchB);
    .latchC(latchC);
    .shiftC(shiftC);
    .startC(startC);
);

FourBitAdder fourBitAdder(
    .a_input(serialInputParallelOutput);
    .b_input(fourBitRegisterOutput);
    .theOutput(fourBitAdder_output)
);

FourBitRegister FourBitRegister(
    .clk(clk);
    .latchB(latchB);
    .inputFourBit(secondInput);
    .outputFourBit(fourBitRegister_output)
);

SerialInputParallelOutput sipo(
    .serialInput(firstInput);
    .shiftA(shiftA);
    .clk(clk);
    .parallelOutput(sipo_output);
);

ParallelInputSerialOutput piso(
    .parallelInput(fourBitAdder_output);
    .latch(latchC);
    .shift(shiftC);
    .clk(clk);
    .serialOutput(theOutput);
);
    
endmodule
