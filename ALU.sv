module alu (
    input reg operation,
    input reg signed [511:0] A,
    input reg signed [511:0] B,
    output reg signed [511:0] C,
    output reg signed [511:0] D
);
reg signed [1023:0] E;
always @(A or B) begin
    $display("sa");
    if (operation==1) begin
        E = A*B;
        $display("sasasa");
    end
    else begin
        E = A + B;
    end
    C = E[511:0];
    D = E[1023:511];
end    
endmodule
