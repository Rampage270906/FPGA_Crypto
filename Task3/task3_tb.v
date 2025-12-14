`timescale 1ns/1ps
module task3_tb;

reg clk;
reg rst;
reg x;
wire y;

fsm dut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, task3_tb);

    clk = 0;
    rst = 1;
    x = 0;

    #10 rst = 0;

    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;

    #10 $finish;
end

endmodule
