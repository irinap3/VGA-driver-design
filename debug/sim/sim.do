vlib work
vmap work work

vlog  ../../hdl/vga_driver.v
vlog  ../hdl/ck_rst_tb.v
vlog  ../hdl/vga_driver_tb.v
vlog  ../hdl/vga_monitor.v


vsim -novopt work.vga_driver_tb
 
do wave.do

add log -r /*
run -all

