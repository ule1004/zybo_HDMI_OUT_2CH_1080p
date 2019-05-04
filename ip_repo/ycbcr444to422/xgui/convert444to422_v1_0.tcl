# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "coef_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "num_taps" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pad_val" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pixel_drop" -parent ${Page_0}


}

proc update_PARAM_VALUE.coef_width { PARAM_VALUE.coef_width } {
	# Procedure called to update coef_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.coef_width { PARAM_VALUE.coef_width } {
	# Procedure called to validate coef_width
	return true
}

proc update_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to update data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to validate data_width
	return true
}

proc update_PARAM_VALUE.num_taps { PARAM_VALUE.num_taps } {
	# Procedure called to update num_taps when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.num_taps { PARAM_VALUE.num_taps } {
	# Procedure called to validate num_taps
	return true
}

proc update_PARAM_VALUE.pad_val { PARAM_VALUE.pad_val } {
	# Procedure called to update pad_val when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pad_val { PARAM_VALUE.pad_val } {
	# Procedure called to validate pad_val
	return true
}

proc update_PARAM_VALUE.pixel_drop { PARAM_VALUE.pixel_drop } {
	# Procedure called to update pixel_drop when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pixel_drop { PARAM_VALUE.pixel_drop } {
	# Procedure called to validate pixel_drop
	return true
}


proc update_MODELPARAM_VALUE.num_taps { MODELPARAM_VALUE.num_taps PARAM_VALUE.num_taps } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.num_taps}] ${MODELPARAM_VALUE.num_taps}
}

proc update_MODELPARAM_VALUE.data_width { MODELPARAM_VALUE.data_width PARAM_VALUE.data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width}] ${MODELPARAM_VALUE.data_width}
}

proc update_MODELPARAM_VALUE.coef_width { MODELPARAM_VALUE.coef_width PARAM_VALUE.coef_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.coef_width}] ${MODELPARAM_VALUE.coef_width}
}

proc update_MODELPARAM_VALUE.pad_val { MODELPARAM_VALUE.pad_val PARAM_VALUE.pad_val } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pad_val}] ${MODELPARAM_VALUE.pad_val}
}

proc update_MODELPARAM_VALUE.pixel_drop { MODELPARAM_VALUE.pixel_drop PARAM_VALUE.pixel_drop } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pixel_drop}] ${MODELPARAM_VALUE.pixel_drop}
}

