`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 21:35:58
// Design Name: 
// Module Name: i2c_master_top
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

module i2c_master_top(

    input clk,
    input rst,
    input start_tx,

    input [7:0] data_in,
    input ack_in,

    output scl,
    output sda,

    output busy,
    output done

);

wire scl_tick;

wire load_shift;
wire shift_enable;
wire start_condition;
wire stop_condition;
wire check_ack;

wire ack_received;

wire [2:0] count;
wire bit_done;

wire serial_out;
wire [7:0] shift_data;
clock_divider u1(
    .clk(clk),
    .rst(rst),
    .scl_tick(scl_tick)
);

shift_register u2(
    .clk(clk),
    .rst(rst),
    .load(load_shift),
    .shift(shift_enable),
    .data_in(data_in),
    .serial_out(serial_out),
    .data_out(shift_data)
);

bit_counter u3(
    .clk(clk),
    .rst(rst),
    .enable(shift_enable),
    .count(count),
    .done(bit_done)
);

ack_detector u4(
    .clk(clk),
    .rst(rst),
    .ack_in(ack_in),
    .check_ack(check_ack),
    .ack_received(ack_received)
);
scl_sda_controller u5(

    .clk(clk),
    .rst(rst),

    .start(start_condition),
    .stop(stop_condition),

    .scl_tick(scl_tick),

    .scl(scl),
    .sda(sda)

);

i2c_master_fsm u6(

    .clk(clk),
    .rst(rst),
    .start_tx(start_tx),

    .bit_done(bit_done),
    .ack_received(ack_received),

    .load_shift(load_shift),
    .shift_enable(shift_enable),

    .start_condition(start_condition),
    .stop_condition(stop_condition),

    .check_ack(check_ack),

    .busy(busy),
    .done(done)

);

endmodule
