`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:49:28
// Design Name: 
// Module Name: ack_detector_tb
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

module ack_detector_tb;

reg clk;
reg rst;
reg ack_in;
reg check_ack;

wire ack_received;

ack_detector uut(
    .clk(clk),
    .rst(rst),
    .ack_in(ack_in),
    .check_ack(check_ack),
    .ack_received(ack_received)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    ack_in = 1;
    check_ack = 0;

    #20;
    rst = 0;

    // Slave sends ACK (0)
    ack_in = 0;
    check_ack = 1;
    #10;

    // Slave sends NACK (1)
    ack_in = 1;
    #10;

    check_ack = 0;

    #20;

    $finish;
end

endmodule
