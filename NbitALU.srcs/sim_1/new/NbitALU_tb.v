`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2026 19:52:40
// Design Name: 
// Module Name: NbitALU_tb
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


module NbitALU_tb();
parameter N = 8;
reg [N-1:0] A;
reg [N-1:0] B;
reg [3:0] ALU_Sel;
wire [N-1:0] ALU_Out;
wire CarryOut, Overflow, Zero, Negative;
NbitALU dut (.A(A), .B(B), .ALU_Sel(ALU_Sel), .ALU_Out(ALU_Out), .CarryOut(CarryOut), .Overflow(Overflow), 
.Zero(Zero), .Negative(Negative));
initial begin
A = 8'b10000000; B = 8'b00000001;
ALU_Sel = 4'h0; #10;
ALU_Sel = 4'h1; #10;
ALU_Sel = 4'h2; #10;
ALU_Sel = 4'h3; #10;
ALU_Sel = 4'h4; #10;
ALU_Sel = 4'h5; #10;
ALU_Sel = 4'h6; #10;
ALU_Sel = 4'h7; #10;
ALU_Sel = 4'h8; #10;
ALU_Sel = 4'h9; #10;
ALU_Sel = 4'hA; #10;
ALU_Sel = 4'hB; #10;
ALU_Sel = 4'hC; #10;
ALU_Sel = 4'hD; #10;
ALU_Sel = 4'hE; #10;
ALU_Sel = 4'hF; #10;
end
endmodule
