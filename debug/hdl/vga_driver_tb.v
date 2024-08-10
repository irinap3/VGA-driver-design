//------------------------------------------------------------------------------
// RTL Summer Practice
// Proiect     : VGA Driver
// Modul       : vga_driver_tb
// Autor       : Popa Maria-Irina
// Data        : Iul. 11, 2024
//------------------------------------------------------------------------------
`timescale 1ns/1ns

module vga_driver_tb();
wire clk    ; 
wire rst    ; 
wire  en     ;
wire rst_n  ;
wire h_sync;
wire v_sync;
wire red;
wire green;
wire blue;

assign rst = ~rst_n;

ck_rst_tb #(
.CK_SEMIPERIOD ('d10)
) i_ck_rst_tb (
.clk    (clk   ),
.rst_n  (rst_n),
.en(en)
);

vga_driver DUT(
.clk(clk)		,					
.rst(rst)		,				    
.en(en)			,			
.h_sync(h_sync)	,                        
.v_sync(v_sync) ,            
.red(red)       ,
.green(green)   ,
.blue(blue)     
);

vga_monitor SCREEN(
.clk(clk),
.reset(rst),
.enable(en),
.hsync(h_sync),
.vsync(v_sync),
.r(red),
.g(green),
.b(blue)
);

initial begin
	repeat(500000000)@(posedge clk);
	$display("End simulation!");
    $stop;	
end
endmodule //vga_driver_tb