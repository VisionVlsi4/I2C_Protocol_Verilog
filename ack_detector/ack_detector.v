`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:47:53
// Design Name: 
// Module Name: ack_detector
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

module ack_detector(
    input clk,
    input rst,
    input ack_in,
    input check_ack,
    output reg ack_received
);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ack_received <= 1'b0;
    end
    else if(check_ack)
    begin
        if(ack_in == 1'b0)
            ack_received <= 1'b1;
        else
            ack_received <= 1'b0;
    end
end 
endmodule
