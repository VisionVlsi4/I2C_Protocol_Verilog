
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:27:34
// Design Name: 
// Module Name: clock_divider_tb
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

module clock_divider_tb;

reg clk;
reg rst;
wire scl_tick;

clock_divider uut
(
    .clk(clk),
    .rst(rst),
    .scl_tick(scl_tick)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #200000;

    $finish;
end

endmodule
