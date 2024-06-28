module processor (
    input clk,
    input [1:0] opcode,
    input [9:0] entry1,
    input [1:0] entry2
);
    reg signed [511:0] tmp;
    reg signed [31:0] mem [511:0];
    reg signed [511:0] registers [3:0];
    wire signed [511:0] alu_C, alu_D;
    
    alu alu_inst (
        .operation(opcode),
        .A(registers[0]),
        .B(registers[1]),
        .C(alu_C),
        .D(alu_D)
    );
    
    localparam [1:0] 
            load = 2'b00, store = 2'b01, mul = 2'b10, sum = 2'b11;
    
    initial begin
        #0
        // test 1 mul and sum
        // registers[0] = -10;
        // registers[1] = 2345;
        // registers[2] = -511'd20938447598233;
        // registers[3] = 512'hFFFFFFFFFFFFFFFF;

        // test 2 mul and sum
        // registers[0] = -1024;
        // registers[1] = -2048;
        // registers[2] = -511'hABCD;
        // registers[3] = 512'd29384758923;

        // test 1 load
        // mem[5] = 0;
        // mem[6] = 0;
        // mem[7] = 23'd16;
        // mem[8] = 23'd16;
        // for ( int i = 0 ; i<12 ;i=i+2 ) begin
        //     mem[9+i] =  mem[8+i] * 16;
        //     mem[9+i+1] =  mem[8+i] * 16;
        //     $display("%d",i);
        // end

        // test 2 load
        // for ( int i = 0 ; i<512 ;i++ ) begin
        //     mem[i] =  1;
        // end

        //test 1 save
        //registers[entry2] = 512'h10000000100000000100000001000000001000000010000000010000000100000000100000001000000001000000010000000010000000100000000000000000;

        //test 2 save
        // registers[entry2] = -1;
    end
    
    always @(posedge clk) begin
        #0
        if (entry1<0 || entry2 < 0 || entry2 >3 || entry1 > 511) begin
            $display("invalid index");
        end
        else begin
        case (opcode)
            load: begin
                tmp = 512'b0;
                for (int i = 15; i >= 0; i = i - 1) begin
                    if (i + entry1 <= 511) begin
                        tmp = {tmp[479:0], mem[i + entry1]}; 
                    end
                end
                registers[entry2] = tmp;
                $display("register[%0d] = %h",entry2, registers[entry2]);
                for (int i = entry1; i < entry1+16; i = i + 1) begin
                    if (i<512) begin
                        $display("mem[%0d] = %0h",i, mem[i]);
                    end
                end

            end
            store: begin
                
                tmp = registers[entry2];
                for (int i = 0; i < 16; i = i + 1) begin
                    if (i + entry1 <= 511) begin
                        mem[i + entry1] = tmp[i * 32 +: 32];
                        $display("%0h",tmp[(i + entry1 + 1) * 32 - 1 -: 32]);
                    end
                end

                for (int i = entry1; i < entry1+16; i = i + 1) begin
                    if (i<512) begin
                        $display("mem[%0d] = %0h",i, mem[i]);
                    end
                end
                $display("register[%0d] = %0h",entry2, registers[entry2]);
            end
            mul, sum: begin
                registers[2] = alu_C;
                registers[3] = alu_D;
                for (int i = 0; i < 4; i = i + 1) begin
                    if (opcode ==2) begin
                        $display("* register[%0d] = %0d",i, registers[i]);
                    end
                    if (opcode ==3) begin
                        $display("+ register[%0d] = %0d",i, registers[i]);
                    end
                    
                end
            end
        endcase         
        end
    end
endmodule
