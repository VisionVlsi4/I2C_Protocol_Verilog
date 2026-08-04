`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 20:30:37
// Design Name: 
// Module Name: shift_register
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

module shift_register(
    input clk,
    input rst,
    input load,
    input shift,
    input [7:0] data_in,
    output reg serial_out,
    output reg [7:0] data_out
);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        data_out   <= 8'd0;
        serial_out <= 1'b0;
    end
    else if(load)
    begin
        data_out <= data_in;
    end
    else if(shift)
    begin
        serial_out <= data_out[7];
        data_out <= {data_out[6:0],1'b0};
    end
end
endmodule