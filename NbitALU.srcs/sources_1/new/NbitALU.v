`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2026 16:16:43
// Design Name: 
// Module Name: NbitALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module NbitALU #(
    parameter N = 8
)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [3:0]   ALU_Sel,
    output reg [N-1:0] ALU_Out,
    output         CarryOut,
    output         Overflow,
    output         Zero,
    output         Negative
);
reg CarryR, OverflowR;
reg [N:0] TempAns;
always@(*) begin
CarryR = 1'b0;
OverflowR = 1'b0;
ALU_Out = {N{1'b0}};
case(ALU_Sel)
4'h0: begin
TempAns = A + B;
ALU_Out = TempAns[N-1:0];
CarryR = TempAns[N];
OverflowR = (~A[N-1] & ~B[N-1] & ALU_Out[N-1]) | (A[N-1] & B[N-1] & ~ALU_Out[N-1]);
end
4'h1: begin
TempAns = A - B;
ALU_Out = TempAns[N-1:0];
CarryR = TempAns[N];
OverflowR = (~A[N-1] & B[N-1] & ALU_Out[N-1]) | (A[N-1] & ~B[N-1] & ~ALU_Out[N-1]);
end
4'h2: ALU_Out = A * B;
4'h3: if(B == 0) ALU_Out = 0;
else ALU_Out = A / B;
4'h4: ALU_Out = A & B;
4'h5: ALU_Out = A | B;
4'h6: ALU_Out = A ^ B;
4'h7: ALU_Out = ~(A | B);
4'h8: ALU_Out = ~(A & B);
4'h9: ALU_Out = ~(A ^ B);
4'hA: ALU_Out = ~A;
4'hB: ALU_Out = A << 1;
4'hC: ALU_Out = A >> 1;
4'hD: ALU_Out = {A[N-2:0], A[N-1]};
4'hE: ALU_Out = {A[0], A[N-1:1]};
4'hF: if (A > B) ALU_Out = 1;
else ALU_Out = 0;
default: begin
CarryR = 1'b0;
OverflowR = 1'b0;
ALU_Out = {N{1'b0}};
end
endcase
end
assign CarryOut = CarryR;
assign Overflow = OverflowR;
assign Zero = (ALU_Out == 0);
assign Negative = (ALU_Out[N-1] == 1);
endmodule