`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:38:37
// Design Name: 
// Module Name: bit_counter
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

module bit_counter(
    input clk,
    input rst,
    input enable,
    output reg [2:0] count,
    output reg done
);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 3'd0;
        done  <= 1'b0;
    end
    else if(enable)
    begin
        if(count == 3'd7)
        begin
            count <= 3'd0;
            done  <= 1'b1;
        end
        else
        begin
            count <= count + 1'b1;
            done  <= 1'b0;
        end
    end
    else
    begin
        done <= 1'b0;
    end
end 
endmodule


