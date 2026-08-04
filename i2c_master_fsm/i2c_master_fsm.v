`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 21:28:00
// Design Name: 
// Module Name: i2c_master_fsm
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

module i2c_master_fsm(

input clk,
input rst,
input start_tx,

input bit_done,
input ack_received,

output reg load_shift,
output reg shift_enable,

output reg start_condition,
output reg stop_condition,

output reg check_ack,

output reg busy,
output reg done

);

parameter IDLE         = 3'd0;
parameter START        = 3'd1;
parameter SEND_ADDR    = 3'd2;
parameter ACK1         = 3'd3;
parameter SEND_DATA    = 3'd4;
parameter ACK2         = 3'd5;
parameter STOP         = 3'd6;

reg [2:0] state,next_state;
always @(posedge clk or posedge rst)
begin

    if(rst)
        state <= IDLE;

    else
        state <= next_state;

end
always @(*)
begin

next_state = state;

case(state)

IDLE:
begin
    if(start_tx)
        next_state = START;
end

START:
begin
    next_state = SEND_ADDR;
end

SEND_ADDR:
begin
    if(bit_done)
        next_state = ACK1;
end

ACK1:
begin
    if(ack_received)
        next_state = SEND_DATA;
    else
        next_state = STOP;
end

SEND_DATA:
begin
    if(bit_done)
        next_state = ACK2;
end

ACK2:
begin
    next_state = STOP;
end

STOP:
begin
    next_state = IDLE;
end

default:
next_state = IDLE;

endcase

end
always @(*)
begin

load_shift      = 0;
shift_enable    = 0;
start_condition = 0;
stop_condition  = 0;
check_ack       = 0;
busy            = 1;
done            = 0;

case(state)

IDLE:
begin
busy = 0;
end

START:
begin
start_condition = 1;
load_shift = 1;
end

SEND_ADDR:
begin
shift_enable = 1;
end

ACK1:
begin
check_ack = 1;
end

SEND_DATA:
begin
shift_enable = 1;
end

ACK2:
begin
check_ack = 1;
end

STOP:
begin
stop_condition = 1;
done = 1;
busy = 0;
end

endcase

end

endmodule
