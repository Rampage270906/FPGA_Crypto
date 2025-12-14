module nbtemp;
    reg [1:0] a, b, t;

    initial begin
        a <= 2'b01;
        b <= 2'b10;

        t <= a;
        a <= b;
        b <= t;
    end
endmodule
