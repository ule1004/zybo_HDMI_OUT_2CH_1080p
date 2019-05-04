# Data type definitions and update procs
source_subcore_ipfile xilinx.com:ip:v_tc:6.1 "bd/video_types_v1_0.tcl"

proc v_tpg_v6_0_datatype_def {} {
  variable vf_v1_0_typedefs
  set type_defs [list]
  
  # VIDEO_IN
  # - TDATA
  lappend type_defs video_in
  lappend type_defs TDATA
  lappend type_defs [lindex $vf_v1_0_typedefs 0] ;# Default type YCbCr 422
  
  # VIDEO_OUT
  # - TDATA
  lappend type_defs video_out
  lappend type_defs TDATA
  lappend type_defs [lindex $vf_v1_0_typedefs 0] ;# Default type YCbCr 422
  
  return $type_defs
}

########################################################################################
# Data type and bus parameter dependency functions
# - Use the helper functions in video_types_v1_0 to generate all the call back functions
# - Type map for this core
set v_tpg_v6_0_type_map [list 12 12 2 2 0 0 1 1]

# VIDEO_IN - TDATA
vf_v1_0_gen_type_cbs video_in s_video_format "" $v_tpg_v6_0_type_map "" data_width active_rows active_cols has_axi4_lite

# VIDEO_OUT - TDATA
vf_v1_0_gen_type_cbs video_out m_video_format "" $v_tpg_v6_0_type_map "" data_width active_rows active_cols has_axi4_lite

