
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:33:26
// Design Name: 
// Module Name: shift_register_tb
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

module shift_register_tb;

reg clk;
reg rst;
reg load;
reg shift;
reg [7:0] data_in;

wire serial_out;
wire [7:0] data_out;

shift_register uut(
    .clk(clk),
    .rst(rst),
    .load(load),
    .shift(shift),
    .data_in(data_in),
    .serial_out(serial_out),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    load = 0;
    shift = 0;
    data_in = 8'b10110011;

    #20;
    rst = 0;

    load = 1;
    #10;
    load = 0;

    repeat(8)
    begin
        shift = 1;
        #10;
    end

    shift = 0;

    #20;

    $finish;
end

endmodule


