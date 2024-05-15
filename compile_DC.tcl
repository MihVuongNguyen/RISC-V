
# these can be also set in .synopsys_dc.setup file in working directory
# always keep the asterisk in link_library
set RISC_V_Design [list ADD_4.v ALU_decoder.v ALU.v Branch_comp.v Branch_decoder.v Control_Unit.v Data_Memory.v Data_Path.v Imm_GEN.v Instruction_Memory.v load_decoder.v mux4.v mux.v PC.v Reg_file.v RISC_V.v]
set target_library  {../ref/db_nldm/saed14rvt_tt0p8v25c.db   }
set link_library    {* ../ref/db_nldm/saed14rvt_tt0p8v25c.db }



read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/ADD_4.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/ALU_decoder.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/ALU.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Branch_comp.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Branch_decoder.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Control_Unit.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Data_Memory.v 
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Data_Path.v 
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Imm_GEN.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/load_decoder.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/mux4.v 
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/mux.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/PC.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/Reg_file.v
read_verilog  /home/dtvlsi/Desktop/RISC_V_Processor/RISC_V.v
#read_verilog $RISC_V_Design

## read command can be replaced with:
#analyze -library WORK -format verilog {../source/johnson.v}
#elaborate Johnson_count -architecture verilog -library DEFAULT

link
check_design

read_sdc ../RISC_V.sdc		
compile -exact_map

report_area  > /home/dtvlsi/Desktop/RISC_V_Processor/Report/rpt.area.report
report_constraint > /home/dtvlsi/Desktop/RISC_V_Processor/Report/rpt.constraints.report
report_timing > /home/dtvlsi/Desktop/RISC_V_Processor/Report/rpt.timing.report
report_qor > /home/dtvlsi/Desktop/RISC_V_Processor/Report/rpt.qor.report

change_names -rule verilog
write -hierarchy -format verilog -output /home/dtvlsi/Desktop/RISC_V_Processor/Report/RISC_V_compiled.v
write -hierarchy -format ddc  -output /home/dtvlsi/Desktop/RISC_V_Processor/Report/RISC_V_compiled.ddc

gui_start
