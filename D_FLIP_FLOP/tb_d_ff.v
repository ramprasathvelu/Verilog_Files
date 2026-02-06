`timescale 1ns/1ps

module tb_d_flipflop;

reg clk;
reg d;
wire q;

// Instantiate D Flip-Flop
d_flipflop uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    // GTKWave dump
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, tb_d_flipflop);

    // Initialize signals
    clk = 0;
    d = 0;

    // Display header
    $display("Time\tCLK\tD\tQ");
    $display("-------------------------");

    // Monitor changes
    $monitor("%0t\t%b\t%b\t%b", $time, clk, d, q);

    // Apply test vectors
    #7  d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;

    #10 $finish;
end

endmodule

