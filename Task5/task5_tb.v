`timescale 1ns/1ps
module task5_tb();
reg clk,areset,load,ena;
reg [3:0] data;
wire [3:0] q;

shift_reg dut (.clk(clk),
    .areset(areset),
    .load(load),
    .ena(ena),
    .data(data),
    .q(q));

always #5 clk=~clk;

initial begin
    $dumpfile("task5.vcd");
    $dumpvars(0,task5_tb);

    clk=0;
    areset=1;
    load=0;
    ena=0;
    data=4'b0000;
    #5 areset = 0;
    #10 load = 1; data = 4'b1011;
    #10 load = 0;
    #10 ena = 1;
    #10 ena = 0;
    #10 load = 1; ena = 1; data = 4'b1100;
    #10 load = 0; ena = 0;
    #10 $finish;
end
endmodule
