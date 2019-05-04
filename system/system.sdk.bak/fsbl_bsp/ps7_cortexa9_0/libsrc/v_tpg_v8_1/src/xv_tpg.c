// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.3
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
//
// ==============================================================

/***************************** Include Files *********************************/
#include "xv_tpg.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XV_tpg_CfgInitialize(XV_tpg *InstancePtr,
                         XV_tpg_Config *ConfigPtr,
                         UINTPTR EffectiveAddr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);
    Xil_AssertNonvoid(EffectiveAddr != (UINTPTR)0x0);

    /* Setup the instance */
    InstancePtr->Config = *ConfigPtr;
    InstancePtr->Config.BaseAddress = EffectiveAddr;

    /* Set the flag to indicate the driver is ready */
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XV_tpg_Start(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL) & 0x80;
    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XV_tpg_IsDone(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XV_tpg_IsIdle(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XV_tpg_IsReady(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XV_tpg_EnableAutoRestart(XV_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0x80);
}

void XV_tpg_DisableAutoRestart(XV_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0);
}

void XV_tpg_Set_height(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_HEIGHT_DATA, Data);
}

u32 XV_tpg_Get_height(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_HEIGHT_DATA);
    return Data;
}

void XV_tpg_Set_width(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_WIDTH_DATA, Data);
}

u32 XV_tpg_Get_width(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_WIDTH_DATA);
    return Data;
}

void XV_tpg_Set_bckgndId(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BCKGNDID_DATA, Data);
}

u32 XV_tpg_Get_bckgndId(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BCKGNDID_DATA);
    return Data;
}

void XV_tpg_Set_ovrlayId(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_OVRLAYID_DATA, Data);
}

u32 XV_tpg_Get_ovrlayId(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_OVRLAYID_DATA);
    return Data;
}

void XV_tpg_Set_maskId(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_MASKID_DATA, Data);
}

u32 XV_tpg_Get_maskId(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_MASKID_DATA);
    return Data;
}

void XV_tpg_Set_motionSpeed(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_MOTIONSPEED_DATA, Data);
}

u32 XV_tpg_Get_motionSpeed(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_MOTIONSPEED_DATA);
    return Data;
}

void XV_tpg_Set_colorFormat(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_COLORFORMAT_DATA, Data);
}

u32 XV_tpg_Get_colorFormat(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_COLORFORMAT_DATA);
    return Data;
}

void XV_tpg_Set_crossHairX(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_CROSSHAIRX_DATA, Data);
}

u32 XV_tpg_Get_crossHairX(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_CROSSHAIRX_DATA);
    return Data;
}

void XV_tpg_Set_crossHairY(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_CROSSHAIRY_DATA, Data);
}

u32 XV_tpg_Get_crossHairY(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_CROSSHAIRY_DATA);
    return Data;
}

void XV_tpg_Set_ZplateHorContStart(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEHORCONTSTART_DATA, Data);
}

u32 XV_tpg_Get_ZplateHorContStart(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEHORCONTSTART_DATA);
    return Data;
}

void XV_tpg_Set_ZplateHorContDelta(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEHORCONTDELTA_DATA, Data);
}

u32 XV_tpg_Get_ZplateHorContDelta(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEHORCONTDELTA_DATA);
    return Data;
}

void XV_tpg_Set_ZplateVerContStart(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEVERCONTSTART_DATA, Data);
}

u32 XV_tpg_Get_ZplateVerContStart(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEVERCONTSTART_DATA);
    return Data;
}

void XV_tpg_Set_ZplateVerContDelta(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEVERCONTDELTA_DATA, Data);
}

u32 XV_tpg_Get_ZplateVerContDelta(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ZPLATEVERCONTDELTA_DATA);
    return Data;
}

void XV_tpg_Set_boxSize(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXSIZE_DATA, Data);
}

u32 XV_tpg_Get_boxSize(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXSIZE_DATA);
    return Data;
}

void XV_tpg_Set_boxColorR(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORR_DATA, Data);
}

u32 XV_tpg_Get_boxColorR(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORR_DATA);
    return Data;
}

void XV_tpg_Set_boxColorG(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORG_DATA, Data);
}

u32 XV_tpg_Get_boxColorG(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORG_DATA);
    return Data;
}

void XV_tpg_Set_boxColorB(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORB_DATA, Data);
}

u32 XV_tpg_Get_boxColorB(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_BOXCOLORB_DATA);
    return Data;
}

void XV_tpg_Set_enableInput(XV_tpg *InstancePtr, u32 Data) {
    u32 Reg;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Reg = XV_tpg_Get_fieldId(InstancePtr);
    Reg &= ~(XV_TPG_CTRL_ADDR_FIELDID_PASSTHR_MASK);
    Reg |= (1) << XV_TPG_CTRL_ADDR_FIELDID_PASSTHR_SHIFT;

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress,
			XV_TPG_CTRL_ADDR_FIELDID_DATA, Reg);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ENABLEINPUT_DATA, Data);
}

u32 XV_tpg_Get_enableInput(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ENABLEINPUT_DATA);
    return Data;
}

void XV_tpg_Set_passthruStartX(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUSTARTX_DATA, Data);
}

u32 XV_tpg_Get_passthruStartX(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUSTARTX_DATA);
    return Data;
}

void XV_tpg_Set_passthruStartY(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUSTARTY_DATA, Data);
}

u32 XV_tpg_Get_passthruStartY(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUSTARTY_DATA);
    return Data;
}

void XV_tpg_Set_passthruEndX(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUENDX_DATA, Data);
}

u32 XV_tpg_Get_passthruEndX(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUENDX_DATA);
    return Data;
}

void XV_tpg_Set_passthruEndY(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUENDY_DATA, Data);
}

u32 XV_tpg_Get_passthruEndY(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_PASSTHRUENDY_DATA);
    return Data;
}

void XV_tpg_Set_dpDynamicRange(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_DPDYNAMICRANGE_DATA, Data);
}

u32 XV_tpg_Get_dpDynamicRange(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_DPDYNAMICRANGE_DATA);
    return Data;
}

void XV_tpg_Set_dpYUVCoef(XV_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_DPYUVCOEF_DATA, Data);
}

u32 XV_tpg_Get_dpYUVCoef(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_DPYUVCOEF_DATA);
    return Data;
}

void XV_tpg_Set_Interlaced(XV_tpg *InstancePtr, _Bool Data) {
    u32 Reg;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Reg = XV_tpg_Get_fieldId(InstancePtr);
    Reg &= ~(XV_TPG_CTRL_ADDR_FIELDID_INTERLACED_MASK);
    Reg |= (Data) << XV_TPG_CTRL_ADDR_FIELDID_INTERLACED_SHIFT;

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_FIELDID_DATA, Reg);
}

void XV_tpg_Set_Polarity(XV_tpg *InstancePtr, _Bool Data) {
    u32 Reg;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Reg = XV_tpg_Get_fieldId(InstancePtr);
    Reg &= ~(XV_TPG_CTRL_ADDR_FIELDID_POLARITY_MASK);
    Reg |= (Data) << XV_TPG_CTRL_ADDR_FIELDID_POLARITY_SHIFT;

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress,
			XV_TPG_CTRL_ADDR_FIELDID_DATA, Reg);
}

u32 XV_tpg_Get_fieldId(XV_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XV_tpg_ReadReg(InstancePtr->Config.BaseAddress,
				XV_TPG_CTRL_ADDR_FIELDID_DATA);
    return Data;
}


void XV_tpg_InterruptGlobalEnable(XV_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_GIE, 1);
}

void XV_tpg_InterruptGlobalDisable(XV_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_GIE, 0);
}

void XV_tpg_InterruptEnable(XV_tpg *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_IER);
    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_IER, Register | Mask);
}

void XV_tpg_InterruptDisable(XV_tpg *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_IER);
    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_IER, Register & (~Mask));
}

void XV_tpg_InterruptClear(XV_tpg *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XV_tpg_WriteReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ISR, Mask);
}

u32 XV_tpg_InterruptGetEnabled(XV_tpg *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_IER);
}

u32 XV_tpg_InterruptGetStatus(XV_tpg *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XV_tpg_ReadReg(InstancePtr->Config.BaseAddress, XV_TPG_CTRL_ADDR_ISR);
}
