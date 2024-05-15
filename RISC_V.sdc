###################################################################


set_max_area 1800
set_max_fanout 8
set_max_transition 5
## timing contstraints
# 500 MHz -> 2ns

create_clock [get_ports clk]  -period 2  -waveform {0 1}
set_clock_uncertainty 0.3  [get_clocks clk]

#set_propagated_clock [get_clocks clk]

set_clock_transition -rise 0.05 [get_clocks clk]
set_clock_transition -fall 0.05 [get_clocks clk]

set_input_delay -clock clk  1.2  [get_ports r]


set_output_delay -clock clk  1.2  [get_ports {out[7]}]
set_output_delay -clock clk  1.2  [get_ports {out[6]}]
set_output_delay -clock clk  1.2  [get_ports {out[5]}]
set_output_delay -clock clk  1.2  [get_ports {out[4]}]
set_output_delay -clock clk  1.2  [get_ports {out[3]}]
set_output_delay -clock clk  1.2  [get_ports {out[2]}]
set_output_delay -clock clk  1.2  [get_ports {out[1]}]
set_output_delay -clock clk  1.2  [get_ports {out[0]}]


set_driving_cell -lib_cell SAEDRVT14_BUF_10 -pin X [get_ports clk]
set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin Q [get_ports r]

set_load -pin_load 0.004 [get_ports {out[7]}]
set_load -pin_load 0.004 [get_ports {out[6]}]
set_load -pin_load 0.004 [get_ports {out[5]}]
set_load -pin_load 0.004 [get_ports {out[4]}]
set_load -pin_load 0.004 [get_ports {out[3]}]
set_load -pin_load 0.004 [get_ports {out[2]}]
set_load -pin_load 0.004 [get_ports {out[1]}]
set_load -pin_load 0.004 [get_ports {out[0]}]
