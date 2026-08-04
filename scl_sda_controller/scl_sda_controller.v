`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:57:05
// Design Name: 
// Module Name: scl_sda_controller
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

module scl_sda_controller(
    input clk,
    input rst,
    input start,
    input stop,
    input scl_tick,

    output reg scl,
    output reg sda
);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        scl <= 1'b1;
        sda <= 1'b1;
    end

    else
    begin

        if(start)
        begin
            scl <= 1'b1;
            sda <= 1'b0;
        end

        else if(stop)
        begin
            scl <= 1'b1;
            sda <= 1'b1;
        end

        else
        begin
            scl <= scl_tick;
        end

    end

end  
endmodule
