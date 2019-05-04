
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z010clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: pix_clk_reset
proc create_hier_cell_pix_clk_reset { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pix_clk_reset() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst per_pix_aresetn150
  create_bd_pin -dir I -type clk pix_clk150
  create_bd_pin -dir I -type clk slowest_sync_clk
  create_bd_pin -dir I -type clk slowest_sync_clk1

  # Create instance: proc_sys_reset_150M, and set properties
  set proc_sys_reset_150M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_150M ]

  # Create instance: proc_sys_reset_200M, and set properties
  set proc_sys_reset_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_200M ]

  # Create instance: proc_sys_reset_250M, and set properties
  set proc_sys_reset_250M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_250M ]

  # Create port connections
  connect_bd_net -net clk_150_200_150_clk_out1 [get_bd_pins pix_clk150] [get_bd_pins proc_sys_reset_150M/slowest_sync_clk]
  connect_bd_net -net clk_150_200_150_clk_out2 [get_bd_pins slowest_sync_clk] [get_bd_pins proc_sys_reset_200M/slowest_sync_clk]
  connect_bd_net -net clk_150_200_150_clk_out3 [get_bd_pins slowest_sync_clk1] [get_bd_pins proc_sys_reset_250M/slowest_sync_clk]
  connect_bd_net -net proc_sys_reset_150M_peripheral_aresetn [get_bd_pins per_pix_aresetn150] [get_bd_pins proc_sys_reset_150M/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_150M/ext_reset_in] [get_bd_pins proc_sys_reset_200M/ext_reset_in] [get_bd_pins proc_sys_reset_250M/ext_reset_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: pix_clk
proc create_hier_cell_pix_clk { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pix_clk() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk_in1
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst per_pix_aresetn150
  create_bd_pin -dir O -type clk pix_clk150

  # Create instance: clk_150_200_150, and set properties
  set clk_150_200_150 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_150_200_150 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {139.594} \
   CONFIG.CLKOUT1_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {150.000} \
   CONFIG.CLKOUT2_JITTER {132.221} \
   CONFIG.CLKOUT2_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {122.522} \
   CONFIG.CLKOUT3_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {300.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {6.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {3} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {2} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.USE_LOCKED {false} \
   CONFIG.USE_RESET {false} \
 ] $clk_150_200_150

  # Create instance: pix_clk_reset
  create_hier_cell_pix_clk_reset $hier_obj pix_clk_reset

  # Create port connections
  connect_bd_net -net clk_150_200_150_clk_out1 [get_bd_pins pix_clk150] [get_bd_pins clk_150_200_150/clk_out1] [get_bd_pins pix_clk_reset/pix_clk150]
  connect_bd_net -net clk_150_200_150_clk_out2 [get_bd_pins clk_150_200_150/clk_out2] [get_bd_pins pix_clk_reset/slowest_sync_clk]
  connect_bd_net -net clk_150_200_150_clk_out3 [get_bd_pins clk_150_200_150/clk_out3] [get_bd_pins pix_clk_reset/slowest_sync_clk1]
  connect_bd_net -net proc_sys_reset_150M_peripheral_aresetn [get_bd_pins per_pix_aresetn150] [get_bd_pins pix_clk_reset/per_pix_aresetn150]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk_in1] [get_bd_pins clk_150_200_150/clk_in1]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ext_reset_in] [get_bd_pins pix_clk_reset/ext_reset_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: vdma_out_mm2s_user
proc create_hier_cell_vdma_out_mm2s_user { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_vdma_out_mm2s_user() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk Interconnect_ACLK
  create_bd_pin -dir I -type rst Interconnect_ARESETN
  create_bd_pin -dir I -type rst axi_resetn
  create_bd_pin -dir I -from 5 -to 0 -type intr mm2s_frame_ptr_in
  create_bd_pin -dir I -type rst periphera_ARESETN
  create_bd_pin -dir I -type clk pix_clk
  create_bd_pin -dir I -type clk s_axi_lite_aclk

  # Create instance: axi_mm2s_interconnect, and set properties
  set axi_mm2s_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mm2s_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_mm2s_interconnect

  # Create instance: axi_vdma_mm2s, and set properties
  set axi_vdma_mm2s [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_mm2s ]
  set_property -dict [ list \
   CONFIG.c_addr_width {32} \
   CONFIG.c_include_mm2s {1} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_m_axis_mm2s_tdata_width {32} \
   CONFIG.c_mm2s_genlock_mode {3} \
   CONFIG.c_mm2s_linebuffer_depth {2048} \
   CONFIG.c_mm2s_max_burst_length {32} \
   CONFIG.c_num_fstores {1} \
   CONFIG.c_s2mm_genlock_mode {0} \
 ] $axi_vdma_mm2s

  # Create instance: mm2s_ila, and set properties
  set mm2s_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 mm2s_ila ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {2} \
   CONFIG.C_PROBE1_WIDTH {6} \
 ] $mm2s_ila

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_vdma_mm2s/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_mm2s_interconnect_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_mm2s_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net axi_vdma_mm2s_M_AXIS_MM2S [get_bd_intf_pins M_AXIS_MM2S] [get_bd_intf_pins axi_vdma_mm2s/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_vdma_mm2s_M_AXI_MM2S [get_bd_intf_pins axi_mm2s_interconnect/S00_AXI] [get_bd_intf_pins axi_vdma_mm2s/M_AXI_MM2S]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins Interconnect_ACLK] [get_bd_pins axi_mm2s_interconnect/ACLK] [get_bd_pins axi_mm2s_interconnect/M00_ACLK] [get_bd_pins axi_mm2s_interconnect/S00_ACLK] [get_bd_pins axi_vdma_mm2s/m_axi_mm2s_aclk]
  connect_bd_net -net ARESETN_1 [get_bd_pins Interconnect_ARESETN] [get_bd_pins axi_mm2s_interconnect/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins periphera_ARESETN] [get_bd_pins axi_mm2s_interconnect/M00_ARESETN] [get_bd_pins axi_mm2s_interconnect/S00_ARESETN]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_vdma_mm2s/axi_resetn]
  connect_bd_net -net axi_vdma_mm2s_mm2s_frame_ptr_out [get_bd_pins axi_vdma_mm2s/mm2s_frame_ptr_out] [get_bd_pins mm2s_ila/probe1]
  connect_bd_net -net axi_vdma_mm2s_mm2s_introut [get_bd_pins axi_vdma_mm2s/mm2s_introut] [get_bd_pins mm2s_ila/probe0]
  connect_bd_net -net m_axis_mm2s_aclk_1 [get_bd_pins pix_clk] [get_bd_pins axi_vdma_mm2s/m_axis_mm2s_aclk] [get_bd_pins mm2s_ila/clk]
  connect_bd_net -net mm2s_frame_ptr_in_1 [get_bd_pins mm2s_frame_ptr_in] [get_bd_pins axi_vdma_mm2s/mm2s_frame_ptr_in]
  connect_bd_net -net s_axi_lite_aclk_1 [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_mm2s/s_axi_lite_aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: vdma_out_mm2s
proc create_hier_cell_vdma_out_mm2s { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_vdma_out_mm2s() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk Interconnect_ACLK
  create_bd_pin -dir I -type rst Interconnect_ARESETN
  create_bd_pin -dir I -type rst axi_resetn
  create_bd_pin -dir I -from 5 -to 0 -type intr mm2s_frame_ptr_in
  create_bd_pin -dir I -type rst periphera_ARESETN
  create_bd_pin -dir I -type clk pix_clk
  create_bd_pin -dir I -type clk s_axi_lite_aclk

  # Create instance: axi_mm2s_interconnect, and set properties
  set axi_mm2s_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mm2s_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_mm2s_interconnect

  # Create instance: axi_vdma_mm2s, and set properties
  set axi_vdma_mm2s [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_mm2s ]
  set_property -dict [ list \
   CONFIG.c_addr_width {32} \
   CONFIG.c_include_mm2s {1} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_m_axis_mm2s_tdata_width {32} \
   CONFIG.c_mm2s_genlock_mode {3} \
   CONFIG.c_mm2s_linebuffer_depth {2048} \
   CONFIG.c_mm2s_max_burst_length {32} \
   CONFIG.c_num_fstores {1} \
   CONFIG.c_s2mm_genlock_mode {0} \
 ] $axi_vdma_mm2s

  # Create instance: mm2s_ila, and set properties
  set mm2s_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 mm2s_ila ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {2} \
   CONFIG.C_PROBE1_WIDTH {6} \
 ] $mm2s_ila

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_vdma_mm2s/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_mm2s_interconnect_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_mm2s_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net axi_vdma_mm2s_M_AXIS_MM2S [get_bd_intf_pins M_AXIS_MM2S] [get_bd_intf_pins axi_vdma_mm2s/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_vdma_mm2s_M_AXI_MM2S [get_bd_intf_pins axi_mm2s_interconnect/S00_AXI] [get_bd_intf_pins axi_vdma_mm2s/M_AXI_MM2S]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins Interconnect_ACLK] [get_bd_pins axi_mm2s_interconnect/ACLK] [get_bd_pins axi_mm2s_interconnect/M00_ACLK] [get_bd_pins axi_mm2s_interconnect/S00_ACLK] [get_bd_pins axi_vdma_mm2s/m_axi_mm2s_aclk]
  connect_bd_net -net ARESETN_1 [get_bd_pins Interconnect_ARESETN] [get_bd_pins axi_mm2s_interconnect/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins periphera_ARESETN] [get_bd_pins axi_mm2s_interconnect/M00_ARESETN] [get_bd_pins axi_mm2s_interconnect/S00_ARESETN]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_vdma_mm2s/axi_resetn]
  connect_bd_net -net axi_vdma_mm2s_mm2s_frame_ptr_out [get_bd_pins axi_vdma_mm2s/mm2s_frame_ptr_out] [get_bd_pins mm2s_ila/probe1]
  connect_bd_net -net axi_vdma_mm2s_mm2s_introut [get_bd_pins axi_vdma_mm2s/mm2s_introut] [get_bd_pins mm2s_ila/probe0]
  connect_bd_net -net m_axis_mm2s_aclk_1 [get_bd_pins pix_clk] [get_bd_pins axi_vdma_mm2s/m_axis_mm2s_aclk] [get_bd_pins mm2s_ila/clk]
  connect_bd_net -net mm2s_frame_ptr_in_1 [get_bd_pins mm2s_frame_ptr_in] [get_bd_pins axi_vdma_mm2s/mm2s_frame_ptr_in]
  connect_bd_net -net s_axi_lite_aclk_1 [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_mm2s/s_axi_lite_aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: vdma_in_s2mm
proc create_hier_cell_vdma_in_s2mm { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_vdma_in_s2mm() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk Interconnect_ACLK
  create_bd_pin -dir I -type rst Interconnect_ARESETN
  create_bd_pin -dir I -type rst axi_resetn
  create_bd_pin -dir I -type rst periphera_ARESETN
  create_bd_pin -dir I -type clk pix_clk
  create_bd_pin -dir O -from 5 -to 0 s2mm_frame_ptr_out
  create_bd_pin -dir O -type intr s2mm_interrupt
  create_bd_pin -dir I -type clk s_axi_lite_aclk

  # Create instance: axi_s2mm_interconnect, and set properties
  set axi_s2mm_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_s2mm_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_s2mm_interconnect

  # Create instance: axi_vdma_s2mm, and set properties
  set axi_vdma_s2mm [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_s2mm ]
  set_property -dict [ list \
   CONFIG.c_include_mm2s {0} \
   CONFIG.c_mm2s_genlock_mode {0} \
   CONFIG.c_num_fstores {1} \
   CONFIG.c_s2mm_linebuffer_depth {2048} \
   CONFIG.c_s2mm_max_burst_length {64} \
 ] $axi_vdma_s2mm

  # Create instance: s2mm_ila, and set properties
  set s2mm_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 s2mm_ila ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {2} \
   CONFIG.C_PROBE1_WIDTH {6} \
 ] $s2mm_ila

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS_S2MM] [get_bd_intf_pins axi_vdma_s2mm/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_vdma_s2mm/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_s2mm_interconnect_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_s2mm_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net axi_vdma_s2mm_M_AXI_S2MM [get_bd_intf_pins axi_s2mm_interconnect/S00_AXI] [get_bd_intf_pins axi_vdma_s2mm/M_AXI_S2MM]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins Interconnect_ACLK] [get_bd_pins axi_s2mm_interconnect/ACLK] [get_bd_pins axi_s2mm_interconnect/M00_ACLK] [get_bd_pins axi_s2mm_interconnect/S00_ACLK] [get_bd_pins axi_vdma_s2mm/m_axi_s2mm_aclk]
  connect_bd_net -net ARESETN_1 [get_bd_pins Interconnect_ARESETN] [get_bd_pins axi_s2mm_interconnect/ARESETN]
  connect_bd_net -net S00_ARESETN_1 [get_bd_pins periphera_ARESETN] [get_bd_pins axi_s2mm_interconnect/M00_ARESETN] [get_bd_pins axi_s2mm_interconnect/S00_ARESETN]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_vdma_s2mm/axi_resetn]
  connect_bd_net -net axi_vdma_s2mm_s2mm_frame_ptr_out [get_bd_pins s2mm_frame_ptr_out] [get_bd_pins axi_vdma_s2mm/s2mm_frame_ptr_out] [get_bd_pins s2mm_ila/probe1]
  connect_bd_net -net axi_vdma_s2mm_s2mm_introut [get_bd_pins s2mm_interrupt] [get_bd_pins axi_vdma_s2mm/s2mm_introut] [get_bd_pins s2mm_ila/probe0]
  connect_bd_net -net s_axi_lite_aclk_1 [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_s2mm/s_axi_lite_aclk]
  connect_bd_net -net s_axis_s2mm_aclk_1 [get_bd_pins pix_clk] [get_bd_pins axi_vdma_s2mm/s_axis_s2mm_aclk] [get_bd_pins s2mm_ila/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Zynq_system
proc create_hier_cell_Zynq_system { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Zynq_system() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M04_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M05_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M06_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_HP0
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_HP1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_HP2

  # Create pins
  create_bd_pin -dir O -type clk HP_Interconnect_ACLK
  create_bd_pin -dir O -from 0 -to 0 -type rst HP_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst HP_peripheral_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst axi_lite_ARESETN
  create_bd_pin -dir O -type clk axi_lite_CLK
  create_bd_pin -dir I -from 0 -to 0 intr_0
  create_bd_pin -dir I -from 0 -to 0 intr_1
  create_bd_pin -dir I -from 0 -to 0 intr_2
  create_bd_pin -dir O -from 0 -to 0 -type rst per_pix_aresetn150
  create_bd_pin -dir O -type clk pix_clk150

  # Create instance: PL2PS_IRQ, and set properties
  set PL2PS_IRQ [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PL2PS_IRQ ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $PL2PS_IRQ

  # Create instance: pix_clk
  create_hier_cell_pix_clk $hier_obj pix_clk

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {250.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {50000000} \
   CONFIG.PCW_CLK1_FREQ {100000000} \
   CONFIG.PCW_CLK2_FREQ {250000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x3FFFFFFF} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {1} \
   CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_EN_CLK1_PORT {1} \
   CONFIG.PCW_EN_CLK2_PORT {1} \
   CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_SDIO0 {1} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_EN_USB0 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {4} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
   CONFIG.PCW_FCLK_CLK2_BUF {TRUE} \
   CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {250} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_I2C_RESET_ENABLE {1} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_IRQ_F2P_INTR {1} \
   CONFIG.PCW_MIO_0_DIRECTION {inout} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {enabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {enabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {enabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {inout} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {enabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {inout} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {enabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {enabled} \
   CONFIG.PCW_MIO_16_SLEW {slow} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {enabled} \
   CONFIG.PCW_MIO_17_SLEW {slow} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {enabled} \
   CONFIG.PCW_MIO_18_SLEW {slow} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {enabled} \
   CONFIG.PCW_MIO_19_SLEW {slow} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {enabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {enabled} \
   CONFIG.PCW_MIO_20_SLEW {slow} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {enabled} \
   CONFIG.PCW_MIO_21_SLEW {slow} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {enabled} \
   CONFIG.PCW_MIO_22_SLEW {slow} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {enabled} \
   CONFIG.PCW_MIO_23_SLEW {slow} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {enabled} \
   CONFIG.PCW_MIO_24_SLEW {slow} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {enabled} \
   CONFIG.PCW_MIO_25_SLEW {slow} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {enabled} \
   CONFIG.PCW_MIO_26_SLEW {slow} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {enabled} \
   CONFIG.PCW_MIO_27_SLEW {slow} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_28_PULLUP {enabled} \
   CONFIG.PCW_MIO_28_SLEW {slow} \
   CONFIG.PCW_MIO_29_DIRECTION {in} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_29_PULLUP {enabled} \
   CONFIG.PCW_MIO_29_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_30_DIRECTION {out} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_30_PULLUP {enabled} \
   CONFIG.PCW_MIO_30_SLEW {slow} \
   CONFIG.PCW_MIO_31_DIRECTION {in} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_31_PULLUP {enabled} \
   CONFIG.PCW_MIO_31_SLEW {slow} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_32_PULLUP {enabled} \
   CONFIG.PCW_MIO_32_SLEW {slow} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_33_PULLUP {enabled} \
   CONFIG.PCW_MIO_33_SLEW {slow} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_34_PULLUP {enabled} \
   CONFIG.PCW_MIO_34_SLEW {slow} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_35_PULLUP {enabled} \
   CONFIG.PCW_MIO_35_SLEW {slow} \
   CONFIG.PCW_MIO_36_DIRECTION {in} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_36_PULLUP {enabled} \
   CONFIG.PCW_MIO_36_SLEW {slow} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_37_PULLUP {enabled} \
   CONFIG.PCW_MIO_37_SLEW {slow} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_38_PULLUP {enabled} \
   CONFIG.PCW_MIO_38_SLEW {slow} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_39_PULLUP {enabled} \
   CONFIG.PCW_MIO_39_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_40_PULLUP {enabled} \
   CONFIG.PCW_MIO_40_SLEW {slow} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_41_PULLUP {enabled} \
   CONFIG.PCW_MIO_41_SLEW {slow} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_42_PULLUP {enabled} \
   CONFIG.PCW_MIO_42_SLEW {slow} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_43_PULLUP {enabled} \
   CONFIG.PCW_MIO_43_SLEW {slow} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_44_PULLUP {enabled} \
   CONFIG.PCW_MIO_44_SLEW {slow} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_45_PULLUP {enabled} \
   CONFIG.PCW_MIO_45_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {out} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {enabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {in} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {enabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {out} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_48_PULLUP {enabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {in} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_49_PULLUP {enabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {enabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {enabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {enabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {enabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {slow} \
   CONFIG.PCW_MIO_9_DIRECTION {inout} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {enabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#Quad SPI Flash#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#USB Reset#SD 0#UART 1#UART 1#GPIO#GPIO#Enet 0#Enet 0} \
   CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#gpio[7]#qspi_fbclk#gpio[9]#gpio[10]#gpio[11]#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#reset#cd#tx#rx#gpio[50]#gpio[51]#mdc#mdio} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_NAND_IO {<Select>} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
   CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
   CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333333} \
   CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3 (Low Voltage)} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.75} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB0_RESET_ENABLE {1} \
   CONFIG.PCW_USB0_RESET_IO {MIO 46} \
   CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {1} \
   CONFIG.PCW_USB_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
   CONFIG.PCW_USE_S_AXI_HP1 {1} \
   CONFIG.PCW_USE_S_AXI_HP2 {1} \
   CONFIG.PCW_USE_S_AXI_HP3 {0} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {7} \
 ] $ps7_0_axi_periph

  # Create instance: rst_ps7_0_100M1, and set properties
  set rst_ps7_0_100M1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_100M1 ]

  # Create instance: rst_ps7_0_250M, and set properties
  set rst_ps7_0_250M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_250M ]

  # Create instance: rst_ps7_0_50M, and set properties
  set rst_ps7_0_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_50M ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_HP2] [get_bd_intf_pins processing_system7_0/S_AXI_HP2]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M04_AXI] [get_bd_intf_pins ps7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M05_AXI] [get_bd_intf_pins ps7_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins M06_AXI] [get_bd_intf_pins ps7_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net S_AXI_HP0_1 [get_bd_intf_pins S_AXI_HP0] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net S_AXI_HP1_1 [get_bd_intf_pins S_AXI_HP1] [get_bd_intf_pins processing_system7_0/S_AXI_HP1]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins M01_AXI] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M02_AXI [get_bd_intf_pins M02_AXI] [get_bd_intf_pins ps7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M03_AXI [get_bd_intf_pins M03_AXI] [get_bd_intf_pins ps7_0_axi_periph/M03_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins rst_ps7_0_50M/interconnect_aresetn]
  connect_bd_net -net In1_1 [get_bd_pins intr_1] [get_bd_pins PL2PS_IRQ/In1]
  connect_bd_net -net In2_1 [get_bd_pins intr_2] [get_bd_pins PL2PS_IRQ/In2]
  connect_bd_net -net PL2PS_IRQ_dout [get_bd_pins PL2PS_IRQ/dout] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net PL_Switch_ip2intc_irpt [get_bd_pins intr_0] [get_bd_pins PL2PS_IRQ/In0]
  connect_bd_net -net clk_150_200_150_clk_out1 [get_bd_pins pix_clk150] [get_bd_pins pix_clk/pix_clk150] [get_bd_pins ps7_0_axi_periph/M03_ACLK] [get_bd_pins ps7_0_axi_periph/M06_ACLK]
  connect_bd_net -net proc_sys_reset_150M_peripheral_aresetn [get_bd_pins per_pix_aresetn150] [get_bd_pins pix_clk/per_pix_aresetn150] [get_bd_pins ps7_0_axi_periph/M03_ARESETN] [get_bd_pins ps7_0_axi_periph/M06_ARESETN]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_lite_CLK] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/M02_ACLK] [get_bd_pins ps7_0_axi_periph/M04_ACLK] [get_bd_pins ps7_0_axi_periph/M05_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps7_0_50M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins pix_clk/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins rst_ps7_0_100M1/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK2 [get_bd_pins HP_Interconnect_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK2] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP2_ACLK] [get_bd_pins rst_ps7_0_250M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins pix_clk/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_100M1/ext_reset_in] [get_bd_pins rst_ps7_0_250M/ext_reset_in] [get_bd_pins rst_ps7_0_50M/ext_reset_in]
  connect_bd_net -net rst_ps7_0_250M_interconnect_aresetn [get_bd_pins HP_interconnect_aresetn] [get_bd_pins rst_ps7_0_250M/interconnect_aresetn]
  connect_bd_net -net rst_ps7_0_250M_peripheral_aresetn [get_bd_pins HP_peripheral_aresetn] [get_bd_pins rst_ps7_0_250M/peripheral_aresetn]
  connect_bd_net -net rst_ps7_0_50M_peripheral_aresetn [get_bd_pins axi_lite_ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/M02_ARESETN] [get_bd_pins ps7_0_axi_periph/M04_ARESETN] [get_bd_pins ps7_0_axi_periph/M05_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_50M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: TPG
proc create_hier_cell_TPG { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_TPG() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_TPG
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_CTRL

  # Create pins
  create_bd_pin -dir I -type clk pix_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst pix_rst_n

  # Create instance: axis_24to32_converter, and set properties
  set axis_24to32_converter [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_24to32_converter ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {3} \
   CONFIG.TDATA_REMAP {8'b00000000,tdata[23:0]} \
 ] $axis_24to32_converter

  # Create instance: v_tpg, and set properties
  set v_tpg [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tpg:8.0 v_tpg ]
  set_property -dict [ list \
   CONFIG.FOREGROUND {1} \
   CONFIG.HAS_AXI4S_SLAVE {0} \
   CONFIG.MAX_COLS {1920} \
   CONFIG.MAX_DATA_WIDTH {8} \
   CONFIG.MAX_ROWS {1080} \
   CONFIG.SAMPLES_PER_CLOCK {1} \
 ] $v_tpg

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins AXIS_TPG] [get_bd_intf_pins axis_24to32_converter/M_AXIS]
  connect_bd_intf_net -intf_net s_axi_CTRL_1 [get_bd_intf_pins s_axi_CTRL] [get_bd_intf_pins v_tpg/s_axi_CTRL]
  connect_bd_intf_net -intf_net v_tpg_m_axis_video [get_bd_intf_pins axis_24to32_converter/S_AXIS] [get_bd_intf_pins v_tpg/m_axis_video]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins pix_clk] [get_bd_pins axis_24to32_converter/aclk] [get_bd_pins v_tpg/ap_clk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins pix_rst_n] [get_bd_pins axis_24to32_converter/aresetn] [get_bd_pins v_tpg/ap_rst_n]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: HDMI_OUT1
proc create_hier_cell_HDMI_OUT1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_HDMI_OUT1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 TMDS

  # Create pins
  create_bd_pin -dir I -type rst pix_aresetn
  create_bd_pin -dir I -type clk pix_clk

  # Create instance: axis_32to24_converter, and set properties
  set axis_32to24_converter [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_32to24_converter ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {3} \
   CONFIG.S_TDATA_NUM_BYTES {4} \
   CONFIG.TDATA_REMAP {tdata[23:0]} \
 ] $axis_32to24_converter

  # Create instance: hdmi_high, and set properties
  set hdmi_high [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 hdmi_high ]

  # Create instance: hdmi_vid_out, and set properties
  set hdmi_vid_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 hdmi_vid_out ]
  set_property -dict [ list \
   CONFIG.C_VTG_MASTER_SLAVE {0} \
 ] $hdmi_vid_out

  # Create instance: ila_video_out, and set properties
  set ila_video_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_video_out ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {1024} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {11} \
   CONFIG.C_PROBE1_WIDTH {24} \
 ] $ila_video_out

  # Create instance: rgb2dvi, and set properties
  set rgb2dvi [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.4 rgb2dvi ]

  # Create instance: util_vector_logic_and, and set properties
  set util_vector_logic_and [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_and ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_and

  # Create instance: util_vector_logic_not, and set properties
  set util_vector_logic_not [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_not ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_not

  # Create instance: v_tc, and set properties
  set v_tc [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc ]
  set_property -dict [ list \
   CONFIG.GEN_F0_VBLANK_HEND {1920} \
   CONFIG.GEN_F0_VBLANK_HSTART {1920} \
   CONFIG.GEN_F0_VFRAME_SIZE {1125} \
   CONFIG.GEN_F0_VSYNC_HEND {1920} \
   CONFIG.GEN_F0_VSYNC_HSTART {1920} \
   CONFIG.GEN_F0_VSYNC_VEND {1088} \
   CONFIG.GEN_F0_VSYNC_VSTART {1083} \
   CONFIG.GEN_F1_VBLANK_HEND {1920} \
   CONFIG.GEN_F1_VBLANK_HSTART {1920} \
   CONFIG.GEN_F1_VFRAME_SIZE {1125} \
   CONFIG.GEN_F1_VSYNC_HEND {1920} \
   CONFIG.GEN_F1_VSYNC_HSTART {1920} \
   CONFIG.GEN_F1_VSYNC_VEND {1088} \
   CONFIG.GEN_F1_VSYNC_VSTART {1083} \
   CONFIG.GEN_HACTIVE_SIZE {1920} \
   CONFIG.GEN_HFRAME_SIZE {2200} \
   CONFIG.GEN_HSYNC_END {2052} \
   CONFIG.GEN_HSYNC_START {2008} \
   CONFIG.GEN_VACTIVE_SIZE {1080} \
   CONFIG.HAS_AXI4_LITE {false} \
   CONFIG.HAS_INTC_IF {false} \
   CONFIG.VIDEO_MODE {1080p} \
   CONFIG.enable_detection {false} \
   CONFIG.enable_generation {true} \
 ] $v_tc

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins TMDS] [get_bd_intf_pins rgb2dvi/TMDS]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_32to24_converter/S_AXIS]
  connect_bd_intf_net -intf_net axis_32to24_converter_M_AXIS [get_bd_intf_pins axis_32to24_converter/M_AXIS] [get_bd_intf_pins hdmi_vid_out/video_in]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins pix_clk] [get_bd_pins axis_32to24_converter/aclk] [get_bd_pins hdmi_vid_out/aclk] [get_bd_pins ila_video_out/clk] [get_bd_pins rgb2dvi/PixelClk] [get_bd_pins v_tc/clk]
  connect_bd_net -net Net1 [get_bd_pins pix_aresetn] [get_bd_pins axis_32to24_converter/aresetn] [get_bd_pins hdmi_vid_out/aresetn] [get_bd_pins util_vector_logic_and/Op2] [get_bd_pins util_vector_logic_not/Op1] [get_bd_pins v_tc/resetn]
  connect_bd_net -net hdmi_high_dout [get_bd_pins hdmi_high/dout] [get_bd_pins hdmi_vid_out/vid_io_out_ce] [get_bd_pins util_vector_logic_and/Op1]
  connect_bd_net -net hdmi_vid_out_locked [get_bd_pins hdmi_vid_out/locked] [get_bd_pins ila_video_out/probe8]
  connect_bd_net -net hdmi_vid_out_overflow [get_bd_pins hdmi_vid_out/overflow] [get_bd_pins ila_video_out/probe9]
  connect_bd_net -net hdmi_vid_out_underflow [get_bd_pins hdmi_vid_out/underflow] [get_bd_pins ila_video_out/probe10]
  connect_bd_net -net hdmi_vid_out_vid_active_video [get_bd_pins hdmi_vid_out/vid_active_video] [get_bd_pins ila_video_out/probe0] [get_bd_pins rgb2dvi/vid_pVDE]
  connect_bd_net -net hdmi_vid_out_vid_data [get_bd_pins hdmi_vid_out/vid_data] [get_bd_pins ila_video_out/probe1] [get_bd_pins rgb2dvi/vid_pData]
  connect_bd_net -net hdmi_vid_out_vid_field_id [get_bd_pins hdmi_vid_out/vid_field_id] [get_bd_pins ila_video_out/probe2]
  connect_bd_net -net hdmi_vid_out_vid_hblank [get_bd_pins hdmi_vid_out/vid_hblank] [get_bd_pins ila_video_out/probe3]
  connect_bd_net -net hdmi_vid_out_vid_hsync [get_bd_pins hdmi_vid_out/vid_hsync] [get_bd_pins ila_video_out/probe4] [get_bd_pins rgb2dvi/vid_pHSync]
  connect_bd_net -net hdmi_vid_out_vid_vblank [get_bd_pins hdmi_vid_out/vid_vblank] [get_bd_pins ila_video_out/probe5]
  connect_bd_net -net hdmi_vid_out_vid_vsync [get_bd_pins hdmi_vid_out/vid_vsync] [get_bd_pins ila_video_out/probe6] [get_bd_pins rgb2dvi/vid_pVSync]
  connect_bd_net -net hdmi_vid_out_vtg_ce [get_bd_pins hdmi_vid_out/vtg_ce] [get_bd_pins ila_video_out/probe7] [get_bd_pins v_tc/gen_clken]
  connect_bd_net -net util_vector_logic_and_Res [get_bd_pins hdmi_vid_out/aclken] [get_bd_pins util_vector_logic_and/Res] [get_bd_pins v_tc/clken]
  connect_bd_net -net util_vector_logic_not_Res [get_bd_pins rgb2dvi/aRst] [get_bd_pins util_vector_logic_not/Res]
  connect_bd_net -net v_tc_active_video_out [get_bd_pins hdmi_vid_out/vtg_active_video] [get_bd_pins v_tc/active_video_out]
  connect_bd_net -net v_tc_hblank_out [get_bd_pins hdmi_vid_out/vtg_hblank] [get_bd_pins v_tc/hblank_out]
  connect_bd_net -net v_tc_hsync_out [get_bd_pins hdmi_vid_out/vtg_hsync] [get_bd_pins v_tc/hsync_out]
  connect_bd_net -net v_tc_vblank_out [get_bd_pins hdmi_vid_out/vtg_vblank] [get_bd_pins v_tc/vblank_out]
  connect_bd_net -net v_tc_vsync_out [get_bd_pins hdmi_vid_out/vtg_vsync] [get_bd_pins v_tc/vsync_out]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: HDMI_OUT
proc create_hier_cell_HDMI_OUT { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_HDMI_OUT() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 TMDS

  # Create pins
  create_bd_pin -dir I -type rst pix_aresetn
  create_bd_pin -dir I -type clk pix_clk

  # Create instance: axis_32to24_converter, and set properties
  set axis_32to24_converter [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_32to24_converter ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {3} \
   CONFIG.S_TDATA_NUM_BYTES {4} \
   CONFIG.TDATA_REMAP {tdata[23:0]} \
 ] $axis_32to24_converter

  # Create instance: hdmi_high, and set properties
  set hdmi_high [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 hdmi_high ]

  # Create instance: hdmi_vid_out, and set properties
  set hdmi_vid_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 hdmi_vid_out ]
  set_property -dict [ list \
   CONFIG.C_VTG_MASTER_SLAVE {0} \
 ] $hdmi_vid_out

  # Create instance: ila_video_out, and set properties
  set ila_video_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_video_out ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {1024} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {11} \
   CONFIG.C_PROBE1_WIDTH {24} \
 ] $ila_video_out

  # Create instance: rgb2dvi, and set properties
  set rgb2dvi [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.4 rgb2dvi ]

  # Create instance: util_vector_logic_and, and set properties
  set util_vector_logic_and [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_and ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_and

  # Create instance: util_vector_logic_not, and set properties
  set util_vector_logic_not [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_not ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_not

  # Create instance: v_tc, and set properties
  set v_tc [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc ]
  set_property -dict [ list \
   CONFIG.GEN_F0_VBLANK_HEND {1920} \
   CONFIG.GEN_F0_VBLANK_HSTART {1920} \
   CONFIG.GEN_F0_VFRAME_SIZE {1125} \
   CONFIG.GEN_F0_VSYNC_HEND {1920} \
   CONFIG.GEN_F0_VSYNC_HSTART {1920} \
   CONFIG.GEN_F0_VSYNC_VEND {1088} \
   CONFIG.GEN_F0_VSYNC_VSTART {1083} \
   CONFIG.GEN_F1_VBLANK_HEND {1920} \
   CONFIG.GEN_F1_VBLANK_HSTART {1920} \
   CONFIG.GEN_F1_VFRAME_SIZE {1125} \
   CONFIG.GEN_F1_VSYNC_HEND {1920} \
   CONFIG.GEN_F1_VSYNC_HSTART {1920} \
   CONFIG.GEN_F1_VSYNC_VEND {1088} \
   CONFIG.GEN_F1_VSYNC_VSTART {1083} \
   CONFIG.GEN_HACTIVE_SIZE {1920} \
   CONFIG.GEN_HFRAME_SIZE {2200} \
   CONFIG.GEN_HSYNC_END {2052} \
   CONFIG.GEN_HSYNC_START {2008} \
   CONFIG.GEN_VACTIVE_SIZE {1080} \
   CONFIG.HAS_AXI4_LITE {false} \
   CONFIG.HAS_INTC_IF {false} \
   CONFIG.VIDEO_MODE {1080p} \
   CONFIG.enable_detection {false} \
   CONFIG.enable_generation {true} \
 ] $v_tc

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins TMDS] [get_bd_intf_pins rgb2dvi/TMDS]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_32to24_converter/S_AXIS]
  connect_bd_intf_net -intf_net axis_32to24_converter_M_AXIS [get_bd_intf_pins axis_32to24_converter/M_AXIS] [get_bd_intf_pins hdmi_vid_out/video_in]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins pix_clk] [get_bd_pins axis_32to24_converter/aclk] [get_bd_pins hdmi_vid_out/aclk] [get_bd_pins ila_video_out/clk] [get_bd_pins rgb2dvi/PixelClk] [get_bd_pins v_tc/clk]
  connect_bd_net -net Net1 [get_bd_pins pix_aresetn] [get_bd_pins axis_32to24_converter/aresetn] [get_bd_pins hdmi_vid_out/aresetn] [get_bd_pins util_vector_logic_and/Op2] [get_bd_pins util_vector_logic_not/Op1] [get_bd_pins v_tc/resetn]
  connect_bd_net -net hdmi_high_dout [get_bd_pins hdmi_high/dout] [get_bd_pins hdmi_vid_out/vid_io_out_ce] [get_bd_pins util_vector_logic_and/Op1]
  connect_bd_net -net hdmi_vid_out_locked [get_bd_pins hdmi_vid_out/locked] [get_bd_pins ila_video_out/probe8]
  connect_bd_net -net hdmi_vid_out_overflow [get_bd_pins hdmi_vid_out/overflow] [get_bd_pins ila_video_out/probe9]
  connect_bd_net -net hdmi_vid_out_underflow [get_bd_pins hdmi_vid_out/underflow] [get_bd_pins ila_video_out/probe10]
  connect_bd_net -net hdmi_vid_out_vid_active_video [get_bd_pins hdmi_vid_out/vid_active_video] [get_bd_pins ila_video_out/probe0] [get_bd_pins rgb2dvi/vid_pVDE]
  connect_bd_net -net hdmi_vid_out_vid_data [get_bd_pins hdmi_vid_out/vid_data] [get_bd_pins ila_video_out/probe1] [get_bd_pins rgb2dvi/vid_pData]
  connect_bd_net -net hdmi_vid_out_vid_field_id [get_bd_pins hdmi_vid_out/vid_field_id] [get_bd_pins ila_video_out/probe2]
  connect_bd_net -net hdmi_vid_out_vid_hblank [get_bd_pins hdmi_vid_out/vid_hblank] [get_bd_pins ila_video_out/probe3]
  connect_bd_net -net hdmi_vid_out_vid_hsync [get_bd_pins hdmi_vid_out/vid_hsync] [get_bd_pins ila_video_out/probe4] [get_bd_pins rgb2dvi/vid_pHSync]
  connect_bd_net -net hdmi_vid_out_vid_vblank [get_bd_pins hdmi_vid_out/vid_vblank] [get_bd_pins ila_video_out/probe5]
  connect_bd_net -net hdmi_vid_out_vid_vsync [get_bd_pins hdmi_vid_out/vid_vsync] [get_bd_pins ila_video_out/probe6] [get_bd_pins rgb2dvi/vid_pVSync]
  connect_bd_net -net hdmi_vid_out_vtg_ce [get_bd_pins hdmi_vid_out/vtg_ce] [get_bd_pins ila_video_out/probe7] [get_bd_pins v_tc/gen_clken]
  connect_bd_net -net util_vector_logic_and_Res [get_bd_pins hdmi_vid_out/aclken] [get_bd_pins util_vector_logic_and/Res] [get_bd_pins v_tc/clken]
  connect_bd_net -net util_vector_logic_not_Res [get_bd_pins rgb2dvi/aRst] [get_bd_pins util_vector_logic_not/Res]
  connect_bd_net -net v_tc_active_video_out [get_bd_pins hdmi_vid_out/vtg_active_video] [get_bd_pins v_tc/active_video_out]
  connect_bd_net -net v_tc_hblank_out [get_bd_pins hdmi_vid_out/vtg_hblank] [get_bd_pins v_tc/hblank_out]
  connect_bd_net -net v_tc_hsync_out [get_bd_pins hdmi_vid_out/vtg_hsync] [get_bd_pins v_tc/hsync_out]
  connect_bd_net -net v_tc_vblank_out [get_bd_pins hdmi_vid_out/vtg_vblank] [get_bd_pins v_tc/vblank_out]
  connect_bd_net -net v_tc_vsync_out [get_bd_pins hdmi_vid_out/vtg_vsync] [get_bd_pins v_tc/vsync_out]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set TMDS [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 TMDS ]
  set TMDS_User [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 TMDS_User ]

  # Create ports

  # Create instance: HDMI_OUT
  create_hier_cell_HDMI_OUT [current_bd_instance .] HDMI_OUT

  # Create instance: HDMI_OUT1
  create_hier_cell_HDMI_OUT1 [current_bd_instance .] HDMI_OUT1

  # Create instance: TPG
  create_hier_cell_TPG [current_bd_instance .] TPG

  # Create instance: Zynq_system
  create_hier_cell_Zynq_system [current_bd_instance .] Zynq_system

  # Create instance: vdma_in_s2mm
  create_hier_cell_vdma_in_s2mm [current_bd_instance .] vdma_in_s2mm

  # Create instance: vdma_out_mm2s
  create_hier_cell_vdma_out_mm2s [current_bd_instance .] vdma_out_mm2s

  # Create instance: vdma_out_mm2s_user
  create_hier_cell_vdma_out_mm2s_user [current_bd_instance .] vdma_out_mm2s_user

  # Create interface connections
  connect_bd_intf_net -intf_net HDMI_OUT1_TMDS [get_bd_intf_ports TMDS_User] [get_bd_intf_pins HDMI_OUT1/TMDS]
  connect_bd_intf_net -intf_net HDMI_OUT_TMDS_0 [get_bd_intf_ports TMDS] [get_bd_intf_pins HDMI_OUT/TMDS]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins HDMI_OUT/S_AXIS] [get_bd_intf_pins vdma_out_mm2s/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net S_AXIS_2 [get_bd_intf_pins HDMI_OUT1/S_AXIS] [get_bd_intf_pins vdma_out_mm2s_user/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net S_AXIS_S2MM_1 [get_bd_intf_pins TPG/AXIS_TPG] [get_bd_intf_pins vdma_in_s2mm/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net S_AXI_HP2_1 [get_bd_intf_pins Zynq_system/S_AXI_HP2] [get_bd_intf_pins vdma_out_mm2s_user/M00_AXI]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins Zynq_system/M01_AXI] [get_bd_intf_pins vdma_in_s2mm/S_AXI_LITE]
  connect_bd_intf_net -intf_net S_AXI_LITE_3 [get_bd_intf_pins Zynq_system/M05_AXI] [get_bd_intf_pins vdma_out_mm2s_user/S_AXI_LITE]
  connect_bd_intf_net -intf_net Zynq_system_M02_AXI [get_bd_intf_pins Zynq_system/M02_AXI] [get_bd_intf_pins vdma_out_mm2s/S_AXI_LITE]
  connect_bd_intf_net -intf_net Zynq_system_M03_AXI [get_bd_intf_pins TPG/s_axi_CTRL] [get_bd_intf_pins Zynq_system/M03_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins Zynq_system/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins Zynq_system/FIXED_IO]
  connect_bd_intf_net -intf_net vdma_in_s2mm_M00_AXI [get_bd_intf_pins Zynq_system/S_AXI_HP0] [get_bd_intf_pins vdma_in_s2mm/M00_AXI]
  connect_bd_intf_net -intf_net vdma_out_mm2s_M00_AXI [get_bd_intf_pins Zynq_system/S_AXI_HP1] [get_bd_intf_pins vdma_out_mm2s/M00_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins Zynq_system/HP_interconnect_aresetn] [get_bd_pins vdma_in_s2mm/Interconnect_ARESETN] [get_bd_pins vdma_out_mm2s/Interconnect_ARESETN] [get_bd_pins vdma_out_mm2s_user/Interconnect_ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins Zynq_system/HP_peripheral_aresetn] [get_bd_pins vdma_in_s2mm/periphera_ARESETN] [get_bd_pins vdma_out_mm2s/periphera_ARESETN] [get_bd_pins vdma_out_mm2s_user/periphera_ARESETN]
  connect_bd_net -net Zynq_system_FCLK_CLK2 [get_bd_pins Zynq_system/HP_Interconnect_ACLK] [get_bd_pins vdma_in_s2mm/Interconnect_ACLK] [get_bd_pins vdma_out_mm2s/Interconnect_ACLK] [get_bd_pins vdma_out_mm2s_user/Interconnect_ACLK]
  connect_bd_net -net Zynq_system_peripheral_aresetn [get_bd_pins HDMI_OUT/pix_aresetn] [get_bd_pins HDMI_OUT1/pix_aresetn] [get_bd_pins TPG/pix_rst_n] [get_bd_pins Zynq_system/per_pix_aresetn150]
  connect_bd_net -net mm2s_frame_ptr_in_1 [get_bd_pins vdma_in_s2mm/s2mm_frame_ptr_out] [get_bd_pins vdma_out_mm2s/mm2s_frame_ptr_in]
  connect_bd_net -net pix_clk [get_bd_pins HDMI_OUT/pix_clk] [get_bd_pins HDMI_OUT1/pix_clk] [get_bd_pins TPG/pix_clk] [get_bd_pins Zynq_system/pix_clk150] [get_bd_pins vdma_in_s2mm/pix_clk] [get_bd_pins vdma_out_mm2s/pix_clk] [get_bd_pins vdma_out_mm2s_user/pix_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins Zynq_system/axi_lite_CLK] [get_bd_pins vdma_in_s2mm/s_axi_lite_aclk] [get_bd_pins vdma_out_mm2s/s_axi_lite_aclk] [get_bd_pins vdma_out_mm2s_user/s_axi_lite_aclk]
  connect_bd_net -net rst_ps7_0_50M_peripheral_aresetn [get_bd_pins Zynq_system/axi_lite_ARESETN] [get_bd_pins vdma_in_s2mm/axi_resetn] [get_bd_pins vdma_out_mm2s/axi_resetn] [get_bd_pins vdma_out_mm2s_user/axi_resetn]
  connect_bd_net -net vdma_in_s2mm_s2mm_introut [get_bd_pins Zynq_system/intr_1] [get_bd_pins vdma_in_s2mm/s2mm_interrupt]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x43010000 [get_bd_addr_spaces Zynq_system/processing_system7_0/Data] [get_bd_addr_segs vdma_out_mm2s/axi_vdma_mm2s/S_AXI_LITE/Reg] SEG_axi_vdma_mm2s_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43030000 [get_bd_addr_spaces Zynq_system/processing_system7_0/Data] [get_bd_addr_segs vdma_out_mm2s_user/axi_vdma_mm2s/S_AXI_LITE/Reg] SEG_axi_vdma_mm2s_Reg7
  create_bd_addr_seg -range 0x00010000 -offset 0x43000000 [get_bd_addr_spaces Zynq_system/processing_system7_0/Data] [get_bd_addr_segs vdma_in_s2mm/axi_vdma_s2mm/S_AXI_LITE/Reg] SEG_axi_vdma_s2mm_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces Zynq_system/processing_system7_0/Data] [get_bd_addr_segs TPG/v_tpg/s_axi_CTRL/Reg] SEG_v_tpg_Reg
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces vdma_in_s2mm/axi_vdma_s2mm/Data_S2MM] [get_bd_addr_segs Zynq_system/processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces vdma_out_mm2s/axi_vdma_mm2s/Data_MM2S] [get_bd_addr_segs Zynq_system/processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces vdma_out_mm2s_user/axi_vdma_mm2s/Data_MM2S] [get_bd_addr_segs Zynq_system/processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


