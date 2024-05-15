####Run VCS
#!bin/bash
ls	/home/dtvlsi/Desktop/RISC_V_Processor | sort
read	-p"ENTER YOUR DESIGN  " DESIGN
read	-p"ENTER YOUR TESTBENCH " TESTBENCH
source	/home/eda/snps_setup
vcs -sverilog +v2k -kdb -R -full64 -debug_acc+all "/home/dtvlsi/Desktop/RISC_V_Processor/$DESIGN"  "/home/dtvlsi/Desktop/RISC_V_Processor/$TESTBENCH" -o sim_exe -gui
exit 0

