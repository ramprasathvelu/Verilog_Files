`timescale 1ns/1ps

module priority_encoder_tb;

reg  [3:0] d;
wire [1:0] y;
wire valid;

// Instantiate DUT
priority_encoder uut (
    .d(d),
    .y(y),
    .valid(valid)
);

initial begin
    // GTKWave
    $dumpfile("priority_encoder.vcd");
    $dumpvars(0, priority_encoder_tb);

    // Display header
    $display("Time\tD\tY\tValid");
    $display("-------------------------");

    // Monitor
    $monitor("%0t\t%b\t%b\t%b", $time, d, y, valid);

    // Test cases
    d = 4'b0000; #10;
    d = 4'b0001; #10;
    d = 4'b0010; #10;
    d = 4'b0100; #10;
    d = 4'b1000; #10;
    d = 4'b1010; #10;
    d = 4'b1111; #10;

    $finish;
end

endmodule

