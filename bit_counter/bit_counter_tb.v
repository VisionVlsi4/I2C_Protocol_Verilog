`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:40:47
// Design Name: 
// Module Name: bit_counter_tb
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

module bit_counter_tb;

reg clk;
reg rst;
reg enable;

wire [2:0] count;
wire done;

bit_counter uut(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .count(count),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    enable = 0;

    #20;
    rst = 0;

    enable = 1;

    #100;

    enable = 0;

    #20;

    $finish;
end

endmodule
