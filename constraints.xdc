create_clock -period 10.000 -name clk_100M -waveform {0.000 5.000} [get_ports clk]

set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN R1  IOSTANDARD LVCMOS33} [get_ports rst]
set_property -dict {PACKAGE_PIN P1  IOSTANDARD LVCMOS33} [get_ports set]
set_property -dict {PACKAGE_PIN P5  IOSTANDARD LVCMOS33} [get_ports check]
set_property -dict {PACKAGE_PIN P2  IOSTANDARD LVCMOS33} [get_ports confirm]

set_property -dict {PACKAGE_PIN C19  IOSTANDARD LVCMOS33} [get_ports led_en[0]]
set_property -dict {PACKAGE_PIN E19  IOSTANDARD LVCMOS33} [get_ports led_en[1]]
set_property -dict {PACKAGE_PIN D19  IOSTANDARD LVCMOS33} [get_ports led_en[2]]
set_property -dict {PACKAGE_PIN F18  IOSTANDARD LVCMOS33} [get_ports led_en[3]]
set_property -dict {PACKAGE_PIN E18  IOSTANDARD LVCMOS33} [get_ports led_en[4]]
set_property -dict {PACKAGE_PIN B20  IOSTANDARD LVCMOS33} [get_ports led_en[5]]
set_property -dict {PACKAGE_PIN A20  IOSTANDARD LVCMOS33} [get_ports led_en[6]]
set_property -dict {PACKAGE_PIN A18  IOSTANDARD LVCMOS33} [get_ports led_en[7]]
set_property -dict {PACKAGE_PIN F15  IOSTANDARD LVCMOS33} [get_ports led[0]]
set_property -dict {PACKAGE_PIN F13  IOSTANDARD LVCMOS33} [get_ports led[1]]
set_property -dict {PACKAGE_PIN F14  IOSTANDARD LVCMOS33} [get_ports led[2]]
set_property -dict {PACKAGE_PIN F16  IOSTANDARD LVCMOS33} [get_ports led[3]]
set_property -dict {PACKAGE_PIN E17  IOSTANDARD LVCMOS33} [get_ports led[4]]
set_property -dict {PACKAGE_PIN C14  IOSTANDARD LVCMOS33} [get_ports led[5]]
set_property -dict {PACKAGE_PIN C15  IOSTANDARD LVCMOS33} [get_ports led[6]]
set_property -dict {PACKAGE_PIN E13  IOSTANDARD LVCMOS33}  [get_ports led[7]]

set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {ledwrong[2]}]
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports {ledwrong[1]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {ledwrong[0]}]

set_property -dict {PACKAGE_PIN F21 IOSTANDARD LVCMOS33} [get_ports {ledwright}]

set_property -dict {PACKAGE_PIN K4 IOSTANDARD LVCMOS33} [get_ports {row[0]}]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {row[1]}]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {row[2]}]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {row[3]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {col[0]}]
set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports {col[1]}]
set_property -dict {PACKAGE_PIN J6 IOSTANDARD LVCMOS33} [get_ports {col[2]}]
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {col[3]}]

set_property -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS33} [get_ports {set_led}]

set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports {keyboard_num[0]}]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports {keyboard_num[1]}]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {keyboard_num[2]}]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {keyboard_num[3]}]

set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {keyboard_en}]

