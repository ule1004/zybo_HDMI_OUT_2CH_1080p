#Definitional proc to organize widgets for parameters.

proc init_gui { IPINST } {

	set Component_Name [ ipgui::add_param  $IPINST  -parent  $IPINST  -name Component_Name ]
	
        set Page0 [ ipgui::add_page $IPINST  -name "Page0" -layout horizontal]
        ipgui::add_row $IPINST -parent $Page0
        set data_width [ipgui::add_param $IPINST -parent $Page0 -name data_width -widget comboBox]
        set_property display_name "Video Component Width" $data_width
        ipgui::add_static_text $IPINST -parent $Page0 -name Blnk0 -text "\t\t"
        ipgui::add_row $IPINST -parent $Page0
        set Optional_Features_grp [ipgui::add_group $IPINST -parent $Page0 -name Optional_Features_grp]
        set_property display_name "Optional Features" $Optional_Features_grp
        ipgui::add_static_text $IPINST -parent $Optional_Features_grp -name Blnk1 -text " "
        set has_axi4_lite [ipgui::add_param $IPINST -parent $Optional_Features_grp -name has_axi4_lite]
        set_property display_name "AXI4-Lite Register Interface" $has_axi4_lite
        set has_axi4s_slave [ipgui::add_param $IPINST -parent $Optional_Features_grp -name has_axi4s_slave]
        set_property display_name "Enable AXI4-Stream Slave Interface" $has_axi4s_slave
        set has_vtiming [ipgui::add_param $IPINST -parent $Optional_Features_grp -name has_vtiming -widget checkBox]
        set_property display_name "Enable Video Timing Interface" $has_vtiming
        set has_intc_if [ipgui::add_param $IPINST -parent $Optional_Features_grp -name has_intc_if -widget checkBox]
        set_property display_name "Enable INTC Ports" $has_intc_if
        set Correction_option_grp [ipgui::add_group $IPINST -parent $Page0 -name Correction_option_grp]
        set_property display_name "Test Pattern Generator Options" $Correction_option_grp
        set s_video_format [ipgui::add_param $IPINST -parent $Correction_option_grp -name s_video_format -widget comboBox]
        set_property display_name "Input Video Format" $s_video_format
        set m_video_format [ipgui::add_param $IPINST -parent $Correction_option_grp -name m_video_format -widget comboBox]
        set_property display_name "Output Video Format" $m_video_format
        set enable_motion [ipgui::add_param $IPINST -parent $Correction_option_grp -name enable_motion]
        set_property display_name "Enable Motion" $enable_motion
        set motion_speed [ipgui::add_param $IPINST -parent $Correction_option_grp -name motion_speed]
        set_property display_name "Motion Speed" $motion_speed
        set pattern_control [ipgui::add_param $IPINST -parent $Correction_option_grp -name pattern_control -widget comboBox]
        set_property display_name "Test Pattern" $pattern_control
        set bayer_phase [ipgui::add_param $IPINST -parent $Correction_option_grp -name bayer_phase -widget comboBox]
        set_property display_name "Bayer Phase" $bayer_phase

        ipgui::add_row $IPINST -parent $Page0
        set Input_Frame_Dimension_grp [ipgui::add_group $IPINST -parent $Page0 -name Input_Frame_Dimension_grp]
        set_property display_name "Input Frame Dimensions" $Input_Frame_Dimension_grp
        set active_cols [ipgui::add_param $IPINST -parent $Input_Frame_Dimension_grp -name active_cols ]
        set_property display_name "Number of Pixels per Scanline (Default)" $active_cols
        set active_rows [ipgui::add_param $IPINST -parent $Input_Frame_Dimension_grp -name active_rows ]
        set_property display_name "Number of Scanlines per Frame (Default)" $active_rows
        
        set_property enabled false $has_axi4s_slave
        set_property enabled false $m_video_format
        set_property enabled false $motion_speed
        set_property enabled false $bayer_phase

        set_property tooltip "Specifies the number of bits in each pixel component." $data_width
        set_property tooltip "Selecting this checkbox adds a memory mapped register interface to the core instance." $has_axi4_lite
        set_property tooltip "Selecting this checkbox adds the AXI4-Stream Slave interface.  Deselecting will remove \r\n the AXI4-Stream Slave interface relying on the Test Pattern Generator to create the video stream patterns." $has_axi4s_slave
        set_property tooltip "Selecting this checkbox adds a group of output signals to the core interface which can be connected to an external Interrupt Controller instance." $has_intc_if
        set_property tooltip "Selecting this checkbox enables motion for the ramp and zone plate test patterns." $enable_motion
        set_property tooltip "The rate of pixel value change per frame." $motion_speed
        set_property tooltip "When monochrome is selected for the output, you have the option to\r\nBayer sub-sample an RGB input or the test patterns on the output \r\nof the Test Pattern Generator." $bayer_phase
        set_property tooltip "Default video test pattern that the Test Pattern Generator will produce.  When the AXI4-Lite interface is deselected, this will be the only test pattern that will be produced.  When the AXI4-Lite interface is enabled, this will be the test pattern that will be produced when the Test Pattern Generator comes out of a reset condition." $pattern_control
        set_property tooltip "Sets the number of horizontal pixels in the active video portion of the frame when the AXI4-Lite Register Interface is disabled. Sets the default value for Active Pixels per scanline in the ACTIVE_SIZE register and can be changed through the AXI4-Lite Register Interface." $active_cols
        set_property tooltip "Sets the default number of rows in the active video portion of the frame when the AXI4-Lite Register Interface is disabled. Sets the default value for Active Lines per frame in the ACTIVE_SIZE register and can be changed through the AXI4-Lite Register Interface." $active_rows
        set_property tooltip "Sets the AXI4-Stream slave side video format.  This is a static value that cannot be modified through the AXI4-Lite register interface." $s_video_format
        set_property tooltip "Sets the AXI4-Stream master side video format.  This is a static value that cannot be modified through the AXI4-Lite register interface." $m_video_format
}
##############################
# Validate procs
##############################
proc validate_PARAM_VALUE.Component_Name { PARAM_VALUE.Component_Name} {

  set errStr [ipgui::component_validate [get_property value  ${PARAM_VALUE.Component_Name} ] ]
  if  { $errStr == "" } { 
    return true 
  } else { 
    set_property errmsg $errStr   ${PARAM_VALUE.Component_Name} 
    return false 
  }

}


proc validate_PARAM_VALUE.pattern_control { PARAM_VALUE.has_axi4s_slave PARAM_VALUE.has_axi4_lite PARAM_VALUE.pattern_control} {

  set pattern_control  ${PARAM_VALUE.pattern_control} 
    if {(([ get_property value ${PARAM_VALUE.has_axi4s_slave} ] == false) || ([ get_property value ${PARAM_VALUE.has_axi4_lite} ] == false)) && ([ get_property value ${PARAM_VALUE.pattern_control} ] == 0)} {
    set_property errmsg "Test Pattern cannot be Passthrough when the AXI4-Lite or AXI4-Stream Slave interfaces are disabled." $pattern_control
    return false
  } else {
    return true
  }

}


###################################
# updated section
###################################
proc update_PARAM_VALUE.has_axi4s_slave { PARAM_VALUE.has_axi4s_slave PARAM_VALUE.has_axi4_lite} {

        set has_axi4s_slave  ${PARAM_VALUE.has_axi4s_slave} 
	if {[ get_property value ${PARAM_VALUE.has_axi4_lite} ] == true} {
		set_property enabled true $has_axi4s_slave
	} else {
		set_property enabled false $has_axi4s_slave
		set_property value false $has_axi4s_slave
  }

}

proc update_PARAM_VALUE.s_video_format { PARAM_VALUE.has_axi4s_slave PARAM_VALUE.s_video_format} {

	set s_video_format  ${PARAM_VALUE.s_video_format} 
	if {[ get_property value ${PARAM_VALUE.has_axi4s_slave} ] == false} {
    	set_property enabled false $s_video_format
	} else {
    	set_property enabled true $s_video_format
  }

}

proc update_PARAM_VALUE.m_video_format { PARAM_VALUE.has_axi4s_slave PARAM_VALUE.m_video_format PARAM_VALUE.s_video_format} {

	set m_video_format  ${PARAM_VALUE.m_video_format} 
	if {[ get_property value ${PARAM_VALUE.has_axi4s_slave} ] == false } {
		set_property enabled true $m_video_format
		set_property range "12,2,0,1" $m_video_format
	} elseif {[ get_property value ${PARAM_VALUE.s_video_format} ] == 2} {
                set_property enabled true $m_video_format
                set_property range "2,12" $m_video_format
        } else {
		set_property range "12,2,0,1" $m_video_format
		set_property enabled false $m_video_format
		set_property value [ get_property value ${PARAM_VALUE.s_video_format} ] $m_video_format
  }

}

proc update_PARAM_VALUE.motion_speed { PARAM_VALUE.enable_motion PARAM_VALUE.motion_speed} {

	set motion_speed  ${PARAM_VALUE.motion_speed} 
	if {[ get_property value ${PARAM_VALUE.enable_motion} ] == false} {
    	set_property enabled false $motion_speed
	} else {
    	set_property enabled true $motion_speed
  }

}

proc update_PARAM_VALUE.bayer_phase { PARAM_VALUE.bayer_phase PARAM_VALUE.m_video_format} {

    set bayer_phase  ${PARAM_VALUE.bayer_phase} 
    if {[ get_property value ${PARAM_VALUE.m_video_format} ] == 12} {
        set_property enabled true $bayer_phase
    } else {
        set_property enabled false $bayer_phase
        set_property value 4 $bayer_phase
    }

}

###################################
# updateModel section
###################################
proc update_MODELPARAM_VALUE.C_ACTIVE_COLS { MODELPARAM_VALUE.C_ACTIVE_COLS PARAM_VALUE.active_cols} {

	set_property value [ get_property value ${PARAM_VALUE.active_cols} ]  ${MODELPARAM_VALUE.C_ACTIVE_COLS} 

}

proc update_MODELPARAM_VALUE.C_ACTIVE_ROWS { MODELPARAM_VALUE.C_ACTIVE_ROWS PARAM_VALUE.active_rows} {

	set_property value [ get_property value ${PARAM_VALUE.active_rows} ]  ${MODELPARAM_VALUE.C_ACTIVE_ROWS} 

}

proc update_MODELPARAM_VALUE.C_HAS_AXI4_LITE { MODELPARAM_VALUE.C_HAS_AXI4_LITE PARAM_VALUE.has_axi4_lite} {

	 if { [ get_property value ${PARAM_VALUE.has_axi4_lite} ] == "true" } {
		 set val 1
	 } else {
		 set val 0
	 }
	 set_property value $val  ${MODELPARAM_VALUE.C_HAS_AXI4_LITE} 

}

proc update_MODELPARAM_VALUE.C_MOTION_SPEED { MODELPARAM_VALUE.C_MOTION_SPEED PARAM_VALUE.motion_speed} {

	set_property value [ get_property value ${PARAM_VALUE.motion_speed} ]  ${MODELPARAM_VALUE.C_MOTION_SPEED} 

}

proc update_MODELPARAM_VALUE.C_M_AXIS_VIDEO_DATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_VIDEO_DATA_WIDTH PARAM_VALUE.data_width} {

	set_property value [ get_property value ${PARAM_VALUE.data_width} ]  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_DATA_WIDTH} 

}

proc update_MODELPARAM_VALUE.C_HAS_INTC_IF { MODELPARAM_VALUE.C_HAS_INTC_IF PARAM_VALUE.has_intc_if} {

	 if {[ get_property value ${PARAM_VALUE.has_intc_if} ] == true} {
		  set val 1
	 } else {
		 set val 0
	 }
	 set_property value $val  ${MODELPARAM_VALUE.C_HAS_INTC_IF} 

}

proc update_MODELPARAM_VALUE.C_S_AXIS_VIDEO_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_VIDEO_DATA_WIDTH PARAM_VALUE.data_width} {

    set_property value [ get_property value ${PARAM_VALUE.data_width} ]  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_DATA_WIDTH} 

}

proc update_MODELPARAM_VALUE.C_S_AXIS_VIDEO_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_VIDEO_TDATA_WIDTH PARAM_VALUE.data_width PARAM_VALUE.s_video_format} {

    if { [ get_property value ${PARAM_VALUE.s_video_format} ] == 0} {
        set s_tdata_width [expr {int(int(int(2*[ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $s_tdata_width  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_TDATA_WIDTH} 
    } elseif { [ get_property value ${PARAM_VALUE.s_video_format} ] == 12} {
        set s_tdata_width [expr {int(int(int([ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $s_tdata_width  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_TDATA_WIDTH} 
    } else {
        set s_tdata_width [expr {int(int(int(3*[ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $s_tdata_width  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_TDATA_WIDTH} 
    }

}

proc update_MODELPARAM_VALUE.C_M_AXIS_VIDEO_FORMAT { MODELPARAM_VALUE.C_M_AXIS_VIDEO_FORMAT PARAM_VALUE.m_video_format} {

    set_property value [ get_property value ${PARAM_VALUE.m_video_format} ]  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_FORMAT} 

}

proc update_MODELPARAM_VALUE.C_M_AXIS_VIDEO_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_VIDEO_TDATA_WIDTH PARAM_VALUE.data_width PARAM_VALUE.m_video_format} {

    if { [ get_property value ${PARAM_VALUE.m_video_format} ] == 0} {
        set m_tdata_width [expr {int(int(int(2*[ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $m_tdata_width  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_TDATA_WIDTH} 
    } elseif { [ get_property value ${PARAM_VALUE.m_video_format} ] == 12} {
        set m_tdata_width [expr {int(int(int([ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $m_tdata_width  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_TDATA_WIDTH} 
    } else {
        set m_tdata_width [expr {int(int(int(3*[ get_property value ${PARAM_VALUE.data_width} ]+7)/8))*8}]
        set_property value $m_tdata_width  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_TDATA_WIDTH} 
    }

}

proc update_MODELPARAM_VALUE.C_S_AXIS_VIDEO_FORMAT { MODELPARAM_VALUE.C_S_AXIS_VIDEO_FORMAT PARAM_VALUE.s_video_format} {

    set_property value [ get_property value ${PARAM_VALUE.s_video_format} ]  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_FORMAT} 

}

proc update_MODELPARAM_VALUE.C_M_AXIS_VIDEO_TUSER_WIDTH { MODELPARAM_VALUE.C_M_AXIS_VIDEO_TUSER_WIDTH} {

    set_property value 1  ${MODELPARAM_VALUE.C_M_AXIS_VIDEO_TUSER_WIDTH} 

}

proc update_MODELPARAM_VALUE.C_PATTERN_CONTROL { MODELPARAM_VALUE.C_PATTERN_CONTROL PARAM_VALUE.enable_motion PARAM_VALUE.pattern_control} {

    if { [ get_property value ${PARAM_VALUE.enable_motion} ] == true} {
        set_property value [expr {4096 + [ get_property value ${PARAM_VALUE.pattern_control} ]}]  ${MODELPARAM_VALUE.C_PATTERN_CONTROL} 
    } else {
        set_property value [ get_property value ${PARAM_VALUE.pattern_control} ]  ${MODELPARAM_VALUE.C_PATTERN_CONTROL} 
    }

}

proc update_MODELPARAM_VALUE.C_S_AXIS_VIDEO_TUSER_WIDTH { MODELPARAM_VALUE.C_S_AXIS_VIDEO_TUSER_WIDTH PARAM_VALUE.has_axi4s_slave} {

    if { [ get_property value ${PARAM_VALUE.has_axi4s_slave} ] == false} {	
        set_property value 0  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_TUSER_WIDTH} 
    } else {
        set_property value 1  ${MODELPARAM_VALUE.C_S_AXIS_VIDEO_TUSER_WIDTH} 
    }

}

proc update_MODELPARAM_VALUE.C_BAYER_PHASE { MODELPARAM_VALUE.C_BAYER_PHASE PARAM_VALUE.bayer_phase} {

    set_property value [ get_property value ${PARAM_VALUE.bayer_phase} ]  ${MODELPARAM_VALUE.C_BAYER_PHASE} 

}

proc update_MODELPARAM_VALUE.C_HAS_VTIMING {MODELPARAM_VALUE.C_HAS_VTIMING PARAM_VALUE.has_vtiming} {

	 if {[ get_property value ${PARAM_VALUE.has_vtiming} ] == true} {
		  set val 1
	 } else {
		 set val 0
	 }
	 set_property value $val  ${MODELPARAM_VALUE.C_HAS_VTIMING} 
} 
