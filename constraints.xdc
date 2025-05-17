## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset Button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Keypad Rows (input)
set_property PACKAGE_PIN T9 [get_ports {row[0]}]
set_property PACKAGE_PIN T10 [get_ports {row[1]}]
set_property PACKAGE_PIN T11 [get_ports {row[2]}]
set_property PACKAGE_PIN T14 [get_ports {row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[*]}]

## Keypad Columns (output)
set_property PACKAGE_PIN U14 [get_ports {col[0]}]
set_property PACKAGE_PIN V14 [get_ports {col[1]}]
set_property PACKAGE_PIN V13 [get_ports {col[2]}]
set_property PACKAGE_PIN V12 [get_ports {col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[*]}]

## 7-Segment Display (a to g)
set_property PACKAGE_PIN W7  [get_ports {seg[0]}]
set_property PACKAGE_PIN W6  [get_ports {seg[1]}]
set_property PACKAGE_PIN V6  [get_ports {seg[2]}]
set_property PACKAGE_PIN U8  [get_ports {seg[3]}]
set_property PACKAGE_PIN V8  [get_ports {seg[4]}]
set_property PACKAGE_PIN U5  [get_ports {seg[5]}]
set_property PACKAGE_PIN V5  [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

## Lock Status LEDs
set_property PACKAGE_PIN U16 [get_ports {lock_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {lock_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lock_led[*]}]