module fsm(
    input  clk,
    input  rst,
    input  x,
    output reg y
);

reg [1:0] state, next_state;

parameter a = 2'b00;
parameter b = 2'b01;
parameter c = 2'b10;
parameter d = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= a;
    else
        state <= next_state;
end

always @(*) begin
    y = 0;
    case (state)
        a: begin
            if (x) next_state = b;
            else   next_state = a;
        end

        b: begin
            if (x) next_state = b;
            else   next_state = c;
        end

        c: begin
            if (x) begin
                next_state = d;
                y = 1;
            end else
                next_state = a;
        end

        d: begin
            if (x) begin
                next_state = b;
                y = 1;
            end else begin
                next_state = c;
                y = 1;
            end
        end

        default: next_state = a;
    endcase
end

endmodule
