`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 22:31:32
// Design Name: 
// Module Name: tlc_tb
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


module tlc_tb;
    reg clk,reset;
    wire [1:0] north,south,east,west;
    traffic_light_controller trial1(.clk(clk),.reset(reset),.north(north),.south(south),.west(west),.east(east));
    always #5 clk = ~clk;
    initial 
        begin
        clk=0;
        reset=1;
        #20
        reset=0;
        #1000;
        $stop;
        end
endmodule

