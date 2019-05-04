# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/P_2017/SEEDCORE/RTL/V16_4/mcb_4ch_dma_sdlc_interlace_170413/ip_repo/hdmi_tx_out/project_1.cache/wt [current_project]
set_property parent.project_path E:/P_2017/SEEDCORE/RTL/V16_4/mcb_4ch_dma_sdlc_interlace_170413/ip_repo/hdmi_tx_out/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths e:/P_2017/SEEDCORE/RTL/V16_4/mcb_4ch_dma_sdlc_interlace_170413/ip_repo/hdmi_tx_out [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib E:/P_2017/SEEDCORE/RTL/V16_4/mcb_4ch_dma_sdlc_interlace_170413/ip_repo/hdmi_tx_out/hdmi_tx_out.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top hdmi_tx_out -part xc7k325tffg900-2


write_checkpoint -force -noxdef hdmi_tx_out.dcp

catch { report_utilization -file hdmi_tx_out_utilization_synth.rpt -pb hdmi_tx_out_utilization_synth.pb }
