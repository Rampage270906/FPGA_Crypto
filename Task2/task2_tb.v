`timescale 1ns/1ps
module task2_tb;

reg clk;
reg d;
reg clear;
reg set;
wire q_clear;
wire q_set;

always #5 clk = ~clk;

dff dut1 (
    .clk(clk),
    .d(d),
    .clear(clear),
    .q(q_clear)
);

dff_set dut2 (
    .clk(clk),
    .d(d),
    .set(set),
    .q(q_set)
);

initial begin
    $dumpfile("task2.vcd");
    $dumpvars(0, task2_tb);

    clk = 0;
    d = 0;
    clear = 1;
    set = 0;

    #5 clear = 0;

    #10 d = 1;
    #10 d = 0;

    #5 set = 1;
    #5 set = 0;

    #10 d = 1;
    #10 d = 0;

    #10 $finish;
end

endmodule
