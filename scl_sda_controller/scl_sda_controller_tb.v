`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 21:16:55
// Design Name: 
// Module Name: scl_sda_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module scl_sda_controller_tb;

reg clk;
reg rst;
reg start;
reg stop;
reg scl_tick;

wire scl;
wire sda;

scl_sda_controller uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .stop(stop),
    .scl_tick(scl_tick),
    .scl(scl),
    .sda(sda)
);

always #5 clk = ~clk;
always #20 scl_tick = ~scl_tick;

initial
begin
    clk = 0;
    rst = 1;
    start = 0;
    stop = 0;
    scl_tick = 0;

    #20;
    rst = 0;

    // Generate START
    start = 1;
    #20;
    start = 0;

    #60;

    // Generate STOP
    stop = 1;
    #20;
    stop = 0;

    #40;

    $finish;
end

endmodule
