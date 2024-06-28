module alu (
    input [1:0] operation,
    input signed [511:0] A,
    input signed [511:0] B,
    output reg signed [511:0] C,
    output reg signed [511:0] D
);
reg signed [1023:0] E;
always @(A or B or operation) begin
    if (operation == 2) begin
        E = A * B;
    end else if (operation == 3) begin
        E = A + B;
    end else begin
        E = 0;
    end
    C = E[511:0];
    D = E[1023:512];
end
endmodule


// reg [1:0]operation;
// reg signed [7:0] E;
// reg signed [3:0] A;
// reg signed [3:0] B;
// reg signed [3:0] C;
// reg signed [3:0] D;
// initial begin
//     operation = 2'b11;
//     A = -8;
//     B = 7;
//     #5 operation = 2'b10;
//     #5 operation = 11;
//     A = 6;
//     B = -5;
//     #5 operation = 2'b10;
//     #5 operation = 2'b11;
//     A=-8;
//     B = -8;
//     #5 operation = 2'b10;
//     #5 operation = 2'b11;
//     A = 3;
//     B = 0;
//     #5 operation = 2'b10;
// end
// always @(A or B or operation) begin
//     #0
//     E = 8'b0;
//     // $display("%d", operation);
//     if (operation==2) begin
        
//         E = A*B;
//         $display("%d*%d=%d", A, B, E);
//     end
//     if (operation == 3) begin
//         E = A + B;
//         $display("%d+%d=%d", A, B, E);
//     end
//     C = E[3:0];
//     D = E[7:4];
// end    