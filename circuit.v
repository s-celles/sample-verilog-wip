module circuit_test;
    reg [3:0] x;
    wire [3:0] w, y;
    reg [3:0] y_exp;

    // NOR gates
    nor(w[3], x[3], x[2]);
    nor(w[2], x[2], x[1]);
    nor(w[1], x[1], y[3]);
    nor(w[0], y[3], y[2]);

    // XOR gates
    xor(y[3], x[0], w[3]);
    xor(y[2], x[3], w[2]);
    xor(y[1], x[2], w[1]);
    xor(y[0], x[1], w[0]);

    initial begin
        // First test with input x = 4'b1000
        x = 4'b1000;
        y_exp = 4'b0011;
        #10;
        
        if (y !== y_exp) 
            $display("Test 1 failed: y incorrect\n val %b\n exp %b", y, y_exp);
        else
            $display("Test 1 passed: y = %b", y);
            
        // Second test with input x = 4'b1010
        x = 4'b1010;
        #10;
        $display("Test 2 result: y = %b", y);
        
        $display("Test complete");
    end
    
    initial
        $monitor("Time=%0t\nIN  x=%b\n    w=%b\nOUT y=%b\n", $time, x, w, y);
endmodule
