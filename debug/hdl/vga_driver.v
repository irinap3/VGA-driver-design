//------------------------------------------------------------------------------
// RTL Summer Practice
// Proiect     : VGA Driver
// Modul       : vga_driver
// Autor       : Popa Maria-Irina
// Data        : Iul. 11, 2024
//------------------------------------------------------------------------------
`timescale 1ns/1ns

module vga_driver(
input      clk   , // 50MHz
input      rst   , // asynchronous reset active high
input      en    ,
output reg h_sync,
output reg v_sync,
output reg red   ,
output reg green ,
output reg blue
);

//parameters for horizontal timing
localparam H_VA = 800;
localparam H_FP = 56;
localparam H_SYNC = 120;
localparam H_BP = 64;
localparam H_TOTAL = 1040; // H_TOTAL = H_FP + H_VA + H_BP + H_SYNC

//parameters for vertical timing
localparam V_VA = 600;
localparam V_FP = 37;
localparam V_SYNC = 6;
localparam V_BP = 23;
localparam V_TOTAL = 666; // V_TOTAL = V_FP + V_VA + V_BP + V_SYNC


reg [10:0] pixel_cnt;
reg [9:0] line_cnt;

always @ (posedge clk or posedge rst) begin
if (rst) 					    pixel_cnt <= 'd0; else
if (pixel_cnt == (H_TOTAL - 1)) pixel_cnt <= 'd0; else
if (en)  					    pixel_cnt <= pixel_cnt + 1; 
end

always @ (posedge clk or posedge rst) begin
if (rst) 					         line_cnt <= 'd0; else
if (line_cnt == V_TOTAL - 1)         line_cnt <= 'd0; else
if (en && (pixel_cnt == (H_TOTAL - 1)))line_cnt <= line_cnt + 1;
end

//display the visible area, else display black
always @ (posedge clk or posedge rst) begin
if (rst) begin
    red <= 'd0;
    green <= 'd0;
    blue <= 'd0;
end 
else if (en) begin
    if ((pixel_cnt >= H_FP) && (pixel_cnt < (H_FP + H_VA)) &&
        (line_cnt >= V_FP) && (line_cnt < (V_FP + V_VA))) begin
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
end

always @ (posedge clk or posedge rst) begin
if (rst) 				                                                 h_sync <= 'd1; else
if((pixel_cnt >=(H_TOTAL - H_SYNC - 1))  &&  (pixel_cnt<=(H_TOTAL - 1))) h_sync <= 'd0; else
													                     h_sync <= 'd1;
end

always @ (posedge clk or posedge rst) begin
if (rst)                                               					v_sync <= 'd1; else
if((line_cnt >=(V_TOTAL - V_SYNC - 1))  && (line_cnt <= (V_TOTAL - 1))) v_sync <= 'd0; else
													   					v_sync <= 'd1;
end

endmodule //vga_driver