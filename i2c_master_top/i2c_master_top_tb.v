`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 21:37:54
// Design Name: 
// Module Name: i2c_master_top_tb
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

module i2c_master_top_tb;

reg clk;
reg rst;
reg start_tx;
reg ack_in;

reg [7:0] data_in;

wire scl;
wire sda;
wire busy;
wire done;

i2c_master_top uut(

    .clk(clk),
    .rst(rst),
    .start_tx(start_tx),

    .data_in(data_in),
    .ack_in(ack_in),

    .scl(scl),
    .sda(sda),

    .busy(busy),
    .done(done)

);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    start_tx = 0;
    ack_in = 0;

    data_in = 8'hA5;

    #20;
    rst = 0;

    #20;
    start_tx = 1;

    #10;
    start_tx = 0;

    #500;

    $finish;

end

endmodule