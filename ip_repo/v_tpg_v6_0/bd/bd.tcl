# IP Integrator call-backs

# HACK: Recreate XGUI/XIT source_subcore_ipfile and source_ipfile
source -notrace [file join [file dirname [get_property XML_FILE_NAME [get_ipdefs -all -quiet xilinx.com:ip:xbip_utils:3.0]]] "common_tcl/common.tcl"]
common_tcl::gen_procs xilinx.com:ip:v_tpg:5.0

source_subcore_ipfile xilinx.com:ip:xbip_utils:3.0 "common_tcl/vip.tcl"

proc init {cellpath otherInfo } {
  set cellobj [get_bd_cells $cellpath]
  
  vip_set_datatype_file "bd/v_tpg_v6_0_datatype.tcl" ;# Override default location
  
  vip $cellobj puts_debug "INIT ..............." ;# This will create the Virtual IP object
  
  # Specify how the parameters updated in propagate should be displayed in the GUI. i.e. greyed out but overridable
  bd::mark_propagate_overrideable $cellobj [list data_width s_video_format m_video_format]
}

proc post_config_ip {cellpath otherInfo } {
   # Any updates to interface properties based on user configuration
  set cellobj [get_bd_cells $cellpath]

  vip $cellobj puts_debug "POST_CONFIG_IP Starting..............."
  
  vip $cellobj update_busparams true
  vip $cellobj update_datatypes
  
  vip $cellobj puts_debug "...........POST_CONFIG_IP Complete"
}

proc propagate { cellpath otherInfo } {
  set cellobj [get_bd_cells $cellpath]
  
  vip $cellobj puts_debug "$cellpath: PROPAGATE Starting..............."

  # Video domain specific #######
  # Check to see if we've been passed a video type
  set prop_type [vip $cellobj get_datatype video_in TDATA PROP]
  if { [vip $cellobj vf_v1_0_is_vf_type $prop_type] } {
    
    # This checks strength before setting the value (if final arg true then it forces set) 
    vip $cellobj set_param_value s_video_format [vip $cellobj video_in_get_video_format $prop_type] false
    vip $cellobj set_param_value data_width [vip $cellobj vf_v1_0_get_video_data_width $prop_type] false
  }
  vip $cellobj set_param_value m_video_format [vip $cellobj get_param_value s_video_format] false
  
  # Re-evaluate bus params, inc data type defs
  vip $cellobj update_busparams
  vip $cellobj update_datatypes
}

proc post_propagate { cellpath otherInfo } {
  set cellobj [get_bd_cells $cellpath]

  vip $cellobj puts_debug "POST_PROPAGATE Starting..............."
  vip $cellobj validate_datatypes
  vip $cellobj puts_debug "...........POST_PROPAGATE Complete"
}
