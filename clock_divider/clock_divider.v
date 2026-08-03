`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:25:35
// Design Name: 
// Module Name: clock_divider
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

module clock_divider #(
    parameter CLK_FREQ = 100_000_000, //100 MHz
    parameter I2C_FREQ = 100_000      //100 kHz
)
(
    input clk,
    input rst,
    output reg scl_tick
);

localparam DIVIDER = CLK_FREQ/(2*I2C_FREQ);

reg [15:0] counter;
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        counter  <= 16'd0;
        scl_tick <= 1'b0;
    end
    else
    begin
        if(counter == DIVIDER-1)
        begin
            counter  <= 16'd0;
            scl_tick <= ~scl_tick;
        end
        else
        begin
            counter <= counter + 1'b1;
        end
    end
end 
endmodule
