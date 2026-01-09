`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 18:16:06
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(clk,reset,north,south,west,east);
    input clk,reset;
    output reg [1:0] north,south,east,west;//green=1,yellow=2,red=3
    reg [2:0] state;
    reg [3:0] count;
    parameter [2:0] n_g=3'd0, n_y=3'd1, e_g=3'd2, e_y=3'd3, s_g=3'd4, s_y=3'd5, w_g=3'd6, w_y=3'd7;
    
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                state=n_g;
                count=3'd0;
            end
        else
            begin
                case(state)
                n_g:
                    begin
                        if(count==4'd15) 
                            begin
                            count=4'd0;
                            state=n_y;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=n_g;
                            end
                    end
                n_y:
                    begin
                        if(count==4'd3)
                            begin
                            count=4'd0;
                            state=e_g;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=n_y;
                            end
                     end
                 e_g:
                    begin
                        if(count==4'd15) 
                            begin
                            count=4'd0;
                            state=e_y;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=e_g;
                            end
                    end
                e_y:
                    begin
                        if(count==4'd3)
                            begin
                            count=4'd0;
                            state=s_g;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=e_y;
                            end
                     end
                 s_g:
                    begin
                        if(count==4'd15) 
                            begin
                            count=4'd0;
                            state=s_y;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=s_g;
                            end
                      end
                s_y:
                    begin
                        if(count==4'd3)
                            begin
                            count=4'd0;
                            state=w_g;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=s_y;
                            end
                     end
                 w_g:
                    begin
                        if(count==4'd15) 
                            begin
                            count=4'd0;
                            state=w_y;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=w_g;
                            end
                      end
                w_y:
                    begin
                        if(count==4'd3)
                            begin
                            count=4'd0;
                            state=n_g;
                            end
                        else
                            begin
                            count=count+4'd1;
                            state=w_y;
                            end
                     end
                endcase
             end//else block
          end//always block
    always@(state)
        begin
        case(state)
        n_g:
            begin
            north=2'd1;
            south=2'd3;
            east=2'd3;
            west=2'd3;
            end
        n_y:
            begin
            north=2'd2;
            south=2'd3;
            east=2'd3;
            west=2'd3;
            end
        e_g:
            begin
            north=2'd3;
            south=2'd3;
            east=2'd1;
            west=2'd3;
            end
        e_y:
            begin
            north=2'd3;
            south=2'd3;
            east=2'd2;
            west=2'd3;
            end
        s_g:
            begin
            north=2'd3;
            south=2'd1;
            east=2'd3;
            west=2'd3;
            end
        s_y:
            begin
            north=2'd3;
            south=2'd2;
            east=2'd3;
            west=2'd3;
            end
        w_g:
            begin
            north=2'd3;
            south=2'd3;
            east=2'd3;
            west=2'd1;
            end
        w_y:
            begin
            north=2'd3;
            south=2'd3;
            east=2'd3;
            west=2'd2;
            end
         endcase
       end 
endmodule