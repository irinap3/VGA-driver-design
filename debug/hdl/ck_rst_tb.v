//------------------------------------------------------------------------------
// RTL Summer Practice
// Proiect     : VGA Driver
// Modul       : ck_rst_tb
// Autor       : Popa Maria-Irina
// Data        : Iul. 11, 2024
//------------------------------------------------------------------------------
`timescale 1ns/1ns
module ck_rst_tb #(
parameter CK_SEMIPERIOD = 'd10       // semi-perioada semnalului de ceas 
)(
output reg              clk         , // ceas
output reg              rst_n        ,// reset asincron activ 0
output reg              en
);  
initial 
begin
  clk = 1'b0;             // valoare initiala 0
  forever #CK_SEMIPERIOD  // valoare complementata la fiecare semi-perioada
    clk = ~clk;
end

initial begin
  //initial, rst and en are both 0
  rst_n <= 1'b1;    
  en   <= 1'b0;
  // wait 5 clock period => rst = 1
  repeat (5) @(posedge clk);
  rst_n <= 1'b0;
  // wait 5 clock period => rst = 0
  repeat (5) @(posedge clk);
  rst_n <= 1'b1;
  // wait 5 clock period => en = 1
  repeat (5) @(posedge clk);
  en   <= 1'b1;
  @(posedge clk);
end

endmodule // ck_rst_tb
