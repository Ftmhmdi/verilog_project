module tb ;
reg clk;
reg [1:0] opcode;
reg [9:0] entry1;
reg [1:0] entry2;

processor processor(clk, opcode, entry1, entry2);

always begin
    #1 clk = !clk;
end
initial begin
    clk=1;
    //test 1 and 2 mul and sum
    // opcode = 3;
    // # 10 
    // opcode = 2;
    
    //test 1 load
    // opcode = 0;
    // entry1 = 5;
    // entry2 = 2;

    //test 2 load
    // opcode = 0;
    // entry1 = 500;
    // entry2 = 1;

    //test 1 save
    // opcode = 1;
    // entry1 = 400;
    // entry2 = 3;

    //test 2 save
    // opcode = 1;
    // entry1 = 511;
    // entry2 = 0;


end

endmodule
//reg operation;
// reg signed [3:0] A;
// reg signed [3:0] B;
// reg signed [511:0] C;
// reg signed [511:0] D;
// reg signed [7:0] E;
// alu al(operation, A, B, C, D, E);
// initial begin
//     operation = 1;
//     A=-2;
//     B=-3;
//     #5
//     A = -7;
//     B = 7;
//     #5
//     A = 1;
//     B = -8;
//     #5
//     A= 4;
//     B=6;
// end    