module mux(input a, b, sel,
           output out); 
    assign out=sel?b:a;

endmodule

module t_ff(
    input  clk,
    input  rst,
    input  t,
    output reg q);
    wire q_bar;
    wire d;

    assign q_bar = ~q;

    mux u1 (
        .a(q),
        .b(q_bar),
        .sel(t),
        .out(d));

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
