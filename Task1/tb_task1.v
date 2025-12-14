`timescale 1ns/1ps
module mux_tb();
reg ina,inb,insel;
wire out;
mux dut(ina,inb,insel,out);
initial begin
    $dumpfile("task1.vcd");
    $dumpvars(0, mux_tb);
    insel=1'b0;
    ina=1'b0;
    inb=1'b0;
    #10
    inb=1'b1;
    #10
    ina=1'b1;
    inb=1'b0;
    #10
    inb=1'b1;
    #10
    insel=1'b1;
    ina=1'b0;
    inb=1'b0;
    #10
    inb=1'b1;
    #10
    ina=1'b1;
    inb=1'b0;
    #10
    inb=1'b1;
    #10
    $finish;
end
endmodule