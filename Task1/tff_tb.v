`timescale 1ns/1ps
module tff_tb;

reg clk;
reg rst;
reg t;
wire q;

t_ff dut(
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q));

always #5 clk = ~clk;

initial begin
    $dumpfile("tff.vcd");
    $dumpvars(0,tff_tb);

    clk = 0;
    rst = 1;
    t   = 0;
    #10 rst = 0;
    #10 t = 0;
    #20 t = 1;
    #20 t = 1;
    #20 t = 0;
    #20 t = 1;

    #20 $finish;
end
endmodule
