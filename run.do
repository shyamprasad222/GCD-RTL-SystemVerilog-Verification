vlib work

vlog -sv tb.sv +acc

vsim -coverage -sv_seed random work.tb

onfinish stop

add wave -r *

run -all

coverage report -detail

