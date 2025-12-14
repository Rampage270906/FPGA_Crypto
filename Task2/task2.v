module dff(
    input  clk,
    input  d,
    input  clear,   
    output reg q);

always @(posedge clk or posedge clear)
begin
    if (clear)
        q <= 1'b0;
    else
        q <= d;
end
endmodule

module dff_set(
    input  clk,
    input  d,
    input  set,
    output q
);

wire q_int;

dff u1 (
    .clk(clk),
    .d(~d),
    .clear(set),
    .q(q_int)
);

assign q = ~q_int;

endmodule
