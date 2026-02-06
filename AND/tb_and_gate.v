// tb_and_gate.v
`timescale 1ns/1ps

module tb_and_gate;

reg a;
reg b;
wire y;

// Instantiate the AND gate
and_gate uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    // GTKWave dump
    $dumpfile("and_gate.vcd");
    $dumpvars(0, tb_and_gate);

    // Display header
    $display("A B | Y");
    $display("---------");

    a = 0; b = 0; #10;
    $display("%b %b | %b", a, b, y);

    a = 0; b = 1; #10;
    $display("%b %b | %b", a, b, y);

    a = 1; b = 0; #10;
    $display("%b %b | %b", a, b, y);

    a = 1; b = 1; #10;
    $display("%b %b | %b", a, b, y);

    #10;
    $finish;
end

endmodule

