//------------------------------------------------------------------------------
// RTL Summer Practice
// Proiect     : VGA Driver
// Modul       : vga_driver
// Autor       : Popa Maria-Irina
// Data        : Iul. 11, 2024
//------------------------------------------------------------------------------
`timescale 1ns/1ns

module vga_driver # (
    parameter H_VA = 800,
    parameter H_FP = 56,
    parameter H_SYNC = 120,
    parameter H_BP = 64,
    parameter H_TOTAL = 1040, // H_TOTAL = H_FP + H_VA + H_BP + H_SYNC
    parameter V_VA = 600,
    parameter V_FP = 37,
    parameter V_SYNC = 6,
    parameter V_BP = 23,
    parameter V_TOTAL = 666, // V_TOTAL = V_FP + V_VA + V_BP + V_SYNC
    parameter RADIUS = 100,
    parameter RADIUS_1 = 50 //radius for the first circle
)(
input      clk   , // 50MHz
input      rst   , // asynchronous reset active high
input      en    ,
output reg h_sync,
output reg v_sync,
output reg red   ,
output reg green ,
output reg blue
);

reg [10:0] pixel_cnt;
reg [9:0] line_cnt;
reg [20:0] dist;

always @ (posedge clk or posedge rst) begin
if (rst) 					    pixel_cnt <= 'd0; else
if (~en)                        pixel_cnt <= 'd0; else
if (pixel_cnt == (H_TOTAL - 1)) pixel_cnt <= 'd0; else
  					            pixel_cnt <= pixel_cnt + 1; 
end

always @ (posedge clk or posedge rst) begin
if (rst) 					                                     line_cnt <= 'd0; else
if (~en)                                                         line_cnt <= 'd0; else
if ((line_cnt == (V_TOTAL - 1)) && (pixel_cnt == (H_TOTAL - 1))) line_cnt <= 'd0; else
if (pixel_cnt == (H_TOTAL - 1))                                  line_cnt <= line_cnt + 1;
end

//display the visible area, else display black
//block of code for display the green image - image_0
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else  if ((en) &&(pixel_cnt >= 0) && (pixel_cnt < (H_VA-1)) &&
         (line_cnt >= 0) && (line_cnt < (V_VA-1))) begin
            red <= 'd0;
            green <= 'd1;
            blue <= 'd0;
    end 
	else begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
    end
end
*/

//block of code for display the 1st image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if((en) &&(pixel_cnt >= 0) && (pixel_cnt < 266) && (line_cnt < (V_VA - 1))) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 266) && (pixel_cnt < 533) && (line_cnt < (V_VA - 1)) ) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd0;
end
else if( (en) && (pixel_cnt >= 533) && (pixel_cnt < (H_VA-1)) && (line_cnt < (V_VA - 1))) begin
    red <= 'd1;
    green <= 'd1;
    blue <= 'd0;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 2nd image - cyan-yellow-cyan
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt < 80) && (line_cnt < (V_VA - 1))) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end 
else if((en) && (pixel_cnt >= 80) && (pixel_cnt < 280) && (line_cnt < (V_VA - 1)) ) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end
else if( (en) && (pixel_cnt >= 280)  && (pixel_cnt < (H_VA-1)) && (line_cnt < (V_VA - 1))) begin
    red <= 'd0;
    green <= 'd1;
    blue <= 'd1;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 3rd image - red-pink-red
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt < 500) && (line_cnt < (V_VA - 1))) begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 500) && (pixel_cnt < 750) && (line_cnt < (V_VA - 1)) ) begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd1;
end
else if( (en)  && (pixel_cnt >= 750) && (pixel_cnt < (H_VA-1)) && (line_cnt < (V_VA - 1))) begin
    red <= 'd1;
    green <= 'd0;
    blue <= 'd0;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 4th image 
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt < 50) && (line_cnt < (V_VA - 1))) begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 50) && (pixel_cnt < 750) && (line_cnt < (V_VA - 1)) ) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end
else if( (en)  && (pixel_cnt >= 750) && (pixel_cnt < (H_VA-1)) && (line_cnt < (V_VA - 1))) begin
    red <= 'd1;
    green <= 'd0;
    blue <= 'd0;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 5th image 
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt <(H_VA - 1)) && (line_cnt >=0) && (line_cnt < 100)) begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=100) && (line_cnt < 500))  begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA-1)) && (line_cnt >=500) && (line_cnt < (V_VA - 1))) begin
    red <= 'd1;
    green <= 'd0;
    blue <= 'd0;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 6th image 
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt <(H_VA - 1)) && (line_cnt >=0) && (line_cnt < 400)) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=400) && (line_cnt < 500))  begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd0;
end
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA-1)) && (line_cnt >=500) && (line_cnt < (V_VA - 1))) begin
    red <= 'd0;
    green <= 'd1;
    blue <= 'd1;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 7th image 
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt <(H_VA - 1)) && (line_cnt >=0) && (line_cnt < 100)) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=100) && (line_cnt < 200))  begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA-1)) && (line_cnt >=200) && (line_cnt < (V_VA - 1))) begin
    red <= 'd1;
    green <= 'd1;
    blue <= 'd0;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 8th image 
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 0) && (pixel_cnt <(H_VA - 1)) && (line_cnt >=0) && (line_cnt < 200)) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=200) && (line_cnt < 400))  begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA-1)) && (line_cnt >=400) && (line_cnt < (V_VA - 1))) begin
    red <= 'd0;
    green <= 'd1;
    blue <= 'd1;
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 9th image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 200) && (pixel_cnt < 600) && (line_cnt >= 200) && (line_cnt < 400 )) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
     red <= 'd0;
     green <= 'd0;
     blue <= 'd1;
end
else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 10th image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 500) && (pixel_cnt < 700) && (line_cnt >= 200) && (line_cnt < 400 )) begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end
else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 11th image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 100) && (pixel_cnt < 300) && (line_cnt >= 200) && (line_cnt < 400 )) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd1;
end
else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 12th image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 100) && (pixel_cnt < 700) && (line_cnt >= 150) && (line_cnt < 450 )) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
     red <= 'd0;
     green <= 'd1;
     blue <= 'd1;
end
else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for display the 13th image
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en) && (pixel_cnt >= 300) && (pixel_cnt < 500) && (line_cnt >= 200) && (line_cnt < 400 )) begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
     red <= 'd1;
     green <= 'd0;
     blue <= 'd1;
end
else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//block of code for center-circle
/*always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if( (en)  && (pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1)))  begin
    dist <= (pixel_cnt - 400) * (pixel_cnt - 400) + (line_cnt - 300) * (line_cnt - 300);
    if (dist <= (RADIUS * RADIUS)) begin
     red <= 'd1;
     green <= 'd1;
     blue <= 'd1;
    end else begin
        red <= 'd1;
        green <= 'd0;
        blue <= 'd1;
    end
end else begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0; 
end
end
*/

//code for different shapes in the same image
/*reg [20:0] circle_1;
reg [20:0] circle_2;
reg [20:0] circle_3;
reg [20:0] circle_4;
reg [20:0] circle_5;
reg [20:0] circle_6;
reg [20:0] circle_7;
reg [20:0] circle_8;
reg [10:0] x_center = 100;
reg [9:0] y_center = 500;
reg [10:0] x_center1 = 700;
reg [9:0] y_center1 = 550;

always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if(en) begin
    if((pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1))) begin
        red <= 'd1;
        green <= 'd1;
        blue <='d1;
        circle_1 <= (pixel_cnt - 100) * (pixel_cnt - 100) + (line_cnt - 100) * (line_cnt - 100);
        circle_2 <= (pixel_cnt - 300) * (pixel_cnt - 300) + (line_cnt - 100) * (line_cnt - 100);
        circle_3 <= (pixel_cnt - 500) * (pixel_cnt - 500) + (line_cnt - 100) * (line_cnt - 100);
        circle_4 <= (pixel_cnt - 700) * (pixel_cnt - 700) + (line_cnt - 100) * (line_cnt - 100);
        circle_5 <= (pixel_cnt - 100) * (pixel_cnt - 100) + (line_cnt - 300) * (line_cnt - 300);
        circle_6 <= (pixel_cnt - 400) * (pixel_cnt - 400) + (line_cnt - 300) * (line_cnt - 300);
        circle_7 <= (pixel_cnt - 430) * (pixel_cnt - 430) + (line_cnt - 300) * (line_cnt - 300);
        circle_8 <= (pixel_cnt - 680) * (pixel_cnt - 680) + (line_cnt - 300) * (line_cnt - 300);

//first line 
//-- circles
        if ((circle_1 <= (RADIUS_1 * RADIUS_1)) || (circle_2 <= (RADIUS_1 * RADIUS_1))
            || (circle_3 <= (RADIUS_1 * RADIUS_1)) || (circle_4 <= (RADIUS_1 * RADIUS_1))) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
        end 
//second line 
//-- half of a circle left
        if(circle_5 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
            if ((pixel_cnt >= 0) && (pixel_cnt < 100) && (line_cnt >=200) && (line_cnt < 400)) begin
                red <= 'd1;
                green <= 'd1;
                blue <= 'd1;
            end else begin
                red <= 0;
                green <= 0;
                blue <= 0;
            end
        end
// -- half moon 
        if(circle_6 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
        end
        if(circle_7 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'd1;
            green <= 'd1;
            blue <= 'd1;
        end
//--half of a circle right
        if(circle_8 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
            if ((pixel_cnt >= 680) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=200) && (line_cnt < 400)) begin
                red <= 'd1;
                green <= 'd1;
                blue <= 'd1;
            end
        end
//3rd line 
//--diamond 
    if ((pixel_cnt >= x_center ? pixel_cnt - x_center : x_center - pixel_cnt) + 
        (line_cnt >= y_center ? line_cnt - y_center : y_center - line_cnt) <= 50) begin
                red <= 0;
                green <= 0;
                blue <= 0; 
    end
//--square

        if((pixel_cnt >= 250) && (pixel_cnt < 350) && (line_cnt >= 450) && (line_cnt < 550 )) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
        end
//--rectangle
        if((pixel_cnt >= 400) && (pixel_cnt < 600) && (line_cnt >= 450) && (line_cnt < 550 )) begin
            red <= 'd0;
            green <= 'd0;
            blue <= 'd0;
        end
//--triangle 
    if ((pixel_cnt >= x_center1 ? pixel_cnt - x_center1 : x_center1 - pixel_cnt) + 
        (line_cnt >= y_center1 ? line_cnt - y_center1 : y_center1 - line_cnt) <= 60) begin
                red <= 0;
                green <= 0;
                blue <= 0; 
            if((pixel_cnt >= 580) && (pixel_cnt < (H_VA - 1)) && (line_cnt >= 550) && (line_cnt < (V_VA - 1) )) begin
            red <= 'd1;
            green <= 'd1;
            blue <= 'd1;
        end
    end
    end
    else begin
        red <= 'd0;
        green <= 'd0;
        blue <= 'd0; 
    end
end
end
*/

//semafor: rosu - 10 secunde, galben - 5 secunde, verde- 20 secunde 
//traffic light

reg [31:0] time_cnt;
reg [1:0] light_state;
reg [20:0] traffic_light1;
reg [20:0] traffic_light2;
reg [20:0] traffic_light3;

localparam RED_STATE = 2'b00;
localparam YELLOW_STATE = 2'b01;
localparam GREEN_STATE = 2'b10;

localparam RED_TIME = 10 * 50000000; 
localparam YELLOW_TIME = 5 * 50000000;
localparam GREEN_TIME = 20 * 50000000;

// -- behaviour
always @(posedge clk or posedge rst) begin
    if(rst) begin
        time_cnt <= 'b0;
        light_state <= 'b0;
    end
    else begin
        case(light_state)
        RED_STATE: 
        if (time_cnt < RED_TIME)
            time_cnt <= time_cnt + 1;
        else begin
            time_cnt <= 0;
            light_state <= YELLOW_STATE;
        end
        YELLOW_STATE: 
        if(time_cnt < YELLOW_TIME)
            time_cnt <= time_cnt + 1;
        else begin
            time_cnt <= 0;
            light_state <= GREEN_STATE;
        end
        GREEN_STATE:
        if(time_cnt < GREEN_TIME)
            time_cnt <= time_cnt + 1;
        else begin
            time_cnt <= 0;
            light_state <= RED_STATE;
        end
        default: begin
            time_cnt <= 0;
            light_state <= RED_STATE;
        end
        endcase
    end
end

//displaying the colors
always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if(en) begin
        if((pixel_cnt >= 0) && (pixel_cnt < (H_VA - 1)) && (line_cnt >=0) && (line_cnt < (V_VA - 1))) begin
        red <= 'd1;
        green <= 'd1;
        blue <='d1;
        if ((pixel_cnt>=300) && (pixel_cnt<500) && (line_cnt>=100) && line_cnt<500) begin
        red <= 'd0;
        green <= 'd0;
        blue <='d0;
        traffic_light1 <= (pixel_cnt - 400) * (pixel_cnt - 400) + (line_cnt - 200) * (line_cnt - 200);
        traffic_light2 <= (pixel_cnt - 400) * (pixel_cnt - 400) + (line_cnt - 300) * (line_cnt - 300);
        traffic_light3 <= (pixel_cnt - 400) * (pixel_cnt - 400) + (line_cnt - 400) * (line_cnt - 400);
        case(light_state)
        RED_STATE: 
        if(traffic_light1 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'b1;
            green <= 'b0;
            blue <= 'b0;
        end
        YELLOW_STATE: 
        if (traffic_light2 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'b1;
            green <= 'b1;
            blue <= 'b0;
        end
        GREEN_STATE: 
        if (traffic_light3 <= (RADIUS_1 * RADIUS_1)) begin
            red <= 'b0;
            green <= 'b1;
            blue <= 'b0;
        end     
        endcase
    end
    end else begin
        red <= 'b0;
        green <= 'b0;
        blue <= 'b0;
    end   
end      
end

always @ (posedge clk or posedge rst) begin
if (rst) 				                                            h_sync <= 'd1; else
if((pixel_cnt >= H_VA+H_FP) &&(pixel_cnt < (H_VA + H_FP + H_SYNC))) h_sync <= 'd0; else
									                                h_sync <= 'd1;
end

always @ (posedge clk or posedge rst) begin
if (rst)                                                          v_sync <= 'd1; else
if((line_cnt >= V_VA+V_FP) &&(line_cnt < (V_VA + V_FP +V_SYNC)))  v_sync <= 'd0; else
									                              v_sync <= 'd1;
end

endmodule //vga_driver