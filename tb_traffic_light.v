`timescale 1ns/1ps

module tb_traffic_light;

    reg clk;
    reg rst;
    wire R, Y, G;

    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .R(R),
        .Y(Y),
        .G(G)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #200 $finish;
    end

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
    end

endmodule