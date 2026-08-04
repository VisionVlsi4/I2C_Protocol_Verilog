`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 21:30:32
// Design Name: 
// Module Name: i2c_master_fsm_tb
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

module i2c_master_fsm_tb;

reg clk;
reg rst;
reg start_tx;
reg bit_done;
reg ack_received;

wire load_shift;
wire shift_enable;
wire start_condition;
wire stop_condition;
wire check_ack;
wire busy;
wire done;

i2c_master_fsm uut(

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

always #5 clk=~clk;

initial
begin

clk=0;
rst=1;
start_tx=0;
bit_done=0;
ack_received=0;

#20;

rst=0;

start_tx=1;

#10;
start_tx=0;

#20;
bit_done=1;

#10;
bit_done=0;

ack_received=1;

#20;
bit_done=1;

#10;
bit_done=0;

#30;

$finish;

end

endmodule
