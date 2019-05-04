namespace eval v_tpg_v6_0_utils {

  proc upgrade_from_v_tpg_v5_0 {xciValues} {
 
    namespace import ::xcoUpgradeLib::*
 
    upvar $xciValues valueArray
 
    addParameter    has_vtiming   0 valueArray

    namespace forget ::xcoUpgradeLib::*
  }

} ;# end namespace
