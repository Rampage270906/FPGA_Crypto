`timescale 1ns/1ps
module tb_adder;

reg  [7:0] a;
reg  [7:0] b;
wire [7:0] s;
wire overflow;

adder dut (
    .a(a),
    .b(b),
    .s(s),
    .overflow(overflow)
);

initial begin
    $dumpfile("task6.vcd");
    $dumpvars(0, tb_adder);

    a = 8'sd10;   b = 8'sd20;   #10;
    a = 8'sd100;  b = 8'sd50;   #10;
    a = -8'sd60;  b = -8'sd70;  #10;
    a = 8'sd127;  b = 8'sd1;    #10;
    a = -8'sd128; b = -8'sd1;   #10;
    #10 $finish;
end

endmodule
