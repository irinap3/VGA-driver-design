onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/H_VA
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/H_FP
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/H_SYNC
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/H_BP
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/H_TOTAL
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/V_VA
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/V_FP
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/V_SYNC
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/V_BP
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/V_TOTAL
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/clk
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/rst
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/en
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/red
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/green
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/blue
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/pixel_cnt
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/line_cnt
add wave -noupdate /vga_driver_tb/SCREEN/expected_hsync
add wave -noupdate /vga_driver_tb/SCREEN/expected_vsync
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/h_sync
add wave -noupdate -radix unsigned /vga_driver_tb/DUT/v_sync
add wave -noupdate -radix unsigned /vga_driver_tb/SCREEN/cnt_h
add wave -noupdate -radix unsigned /vga_driver_tb/SCREEN/cnt_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13746710 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {13746678 ns} {13746733 ns}
