onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/zl_uart/io_in
add wave -noupdate /tb/zl_uart/io_out
add wave -noupdate /tb/zl_uart/clk
add wave -noupdate /tb/zl_uart/reset
add wave -noupdate /tb/zl_uart/rx
add wave -noupdate /tb/zl_uart/tx
add wave -noupdate -radix hexadecimal -childformat {{{/tb/zl_uart/txbuf[8]} -radix hexadecimal} {{/tb/zl_uart/txbuf[7]} -radix hexadecimal} {{/tb/zl_uart/txbuf[6]} -radix hexadecimal} {{/tb/zl_uart/txbuf[5]} -radix hexadecimal} {{/tb/zl_uart/txbuf[4]} -radix hexadecimal} {{/tb/zl_uart/txbuf[3]} -radix hexadecimal} {{/tb/zl_uart/txbuf[2]} -radix hexadecimal} {{/tb/zl_uart/txbuf[1]} -radix hexadecimal} {{/tb/zl_uart/txbuf[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb/zl_uart/txbuf[8]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[7]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[6]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[5]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[4]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[3]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[2]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[1]} {-height 15 -radix hexadecimal} {/tb/zl_uart/txbuf[0]} {-height 15 -radix hexadecimal}} /tb/zl_uart/txbuf
add wave -noupdate /tb/zl_uart/addr
add wave -noupdate /tb/zl_uart/obuffer
add wave -noupdate /tb/zl_uart/state
add wave -noupdate -radix hexadecimal /tb/zl_uart/cnt
add wave -noupdate /tb/zl_uart/uart_d
add wave -noupdate -radix hexadecimal /tb/zl_uart/reg1
add wave -noupdate -radix hexadecimal /tb/zl_uart/led_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {336764 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {141019 ps} {404736 ps}
