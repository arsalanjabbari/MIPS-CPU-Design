`timescale 1ns / 1ps
module ComparisonUnit (
    input aComparison,
    input bComparison,
    input [2:0]opcodeComparison,
    input carryFlag,
    input zeroFlag,
    input diff,
    output reg[31:0]resultComparison
);

// Implementation
always @(*) begin

	resultComparison = 0;
    case (opcodeComparison)
        // A >= B (signed)
        3'b001 :resultComparison[0] = (aComparison != bComparison) ? !aComparison : !diff;
        // A < B (signed)
        3'b010 : resultComparison[0] = ~(aComparison ^ bComparison) ? diff : aComparison;
        // A != B
        3'b011: resultComparison[0] = !zeroFlag ? 1:0;    
        // A == B
        3'b100: resultComparison[0] = zeroFlag ? 1:0;    // check "=="
        // A >= B (unsigned)
        3'b101: resultComparison[0] = carryFlag;   // check ">=" unsigned
        // A < B (unsigned)
        3'b110: resultComparison[0] = !carryFlag;   // check "<" unsigned
    endcase
end
 	
endmodule
