vlib work 
vlog -f sourcefile.txt
vsim -voptargs=+accs work.FilterRTL_tb
add wave *
run -all