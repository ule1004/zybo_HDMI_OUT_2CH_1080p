/*
 * tpg.c
 *
 *  Created on: 2018. 9. 27.
 *      Author: alice
 */


#include "xv_tpg.h"
#include <stdio.h>

XV_tpg tpg;

int tpg_init(u16 DeviceID)
{
	int status;

	status = XV_tpg_Initialize(&tpg, DeviceID);
	if(status != XST_SUCCESS){
		printf("Tpg Init Error!!\n");
		return FALSE;
	}

	return TRUE;
}

void tpg_start(void)
{
	XV_tpg_Start(&tpg);
}

u32 get_tpg_width(void)
{
	return XV_tpg_Get_width(&tpg);
}

u32 get_tpg_height(void)
{
	return XV_tpg_Get_height(&tpg);
}

u32 get_tpg_colorforma(void)
{
	return XV_tpg_Get_colorFormat(&tpg);
}


void set_tpg_width(u32 Data)
{
	XV_tpg_Set_width(&tpg, Data);
}

void set_tpg_height(u32 Data)
{
	XV_tpg_Set_height(&tpg, Data);
}

void set_tpg_colorformat(u32 Data)
{
	XV_tpg_Set_colorFormat(&tpg, Data);
}

void tpg_enable_restart(void)
{
	XV_tpg_EnableAutoRestart(&tpg);
}

void tpg_disable_restart(void)
{
	XV_tpg_DisableAutoRestart(&tpg);
}

void set_tpg_bckgndId(u32 Data)
{
	XV_tpg_Set_bckgndId(&tpg, Data);
}

void set_tpg_overlayId(u32 Data)
{
	XV_tpg_Set_ovrlayId(&tpg, Data);
}
