module nbntemp;
    reg [1:0] a, b;

    initial begin
        a <= 2'b01;
        b <= 2'b10;

        a <= b;
        b <= a;
    end
endmodule
