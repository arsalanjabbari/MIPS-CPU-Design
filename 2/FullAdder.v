`timescale 1ns / 1ps
module FullAdder (
    input aFullAdder,
    input bFullAdder,
    input carryInFullAdder,
    output sumFullAdder,
    output carryOutFullAdder
);
assign sumFullAdder = aFullAdder ^ bFullAdder ^ carryInFullAdder;
assign carryOutFullAdder = aFullAdder & bFullAdder | bFullAdder & carryInFullAdder | aFullAdder & carryInFullAdder;

endmodule
