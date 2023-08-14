`timescale 1ns / 1ps
module Controller (
    input clk,
    input startA,
    input loadB,
    output shiftA,
    output latchB,
    output latchC,
    output shiftC,
    output startC
);

    // Params
    parameter waitB = 0;
    parameter waitA = 1;
    parameter takeA = 2;
    parameter sendC = 3;

    // Registers
    reg [1:0]lookahead = 0;
    reg [1:0]next;
    reg [1:0]count;
    reg [1:0]countplus;
    
    always @(posedge clk) begin
        lookahead <= next;
        count <= countplus;
    end
    always @(*) begin
        shiftA = 0;
        latchB = 0;
        latchC = 0;
        shiftC = 0;
        startC = 0;
        case (lookahead)
            waitB : begin
                if(loadB) begin
                    next = waitA;
                    latchB = 1;
                end
                else begin
                    next = waitB;
                end
            end
            waitA : begin
                if(startA) begin
                    countplus = 0;
                    shiftA = 1;
                    next = takeA;
                end
                else begin
                    next = waitA;
                end
            end
            takeA : begin
                if(countplus != 3)begin
                    shiftA = 1;
                    countplus = count + 1;
                end
                else begin
                    countplus = 0;
                    next = sendC;
                    latchC = 1;
                end
            end
            sendC : begin
                if(countplus == 0)begin
                    startC = 1;
                    shiftC = 1;
                    countplus = count + 1;
                end
                else if (countplus == 1) begin
                    shiftC = 1;
                    countplus = count + 1;
                end
                else if (countplus == 2) begin
                    shiftC = 1;
                    countplus = count + 1;
                end
                else if (countplus == 3) begin
                    next = waitB;
                end
            end
        endcase
    end
        
endmodule
