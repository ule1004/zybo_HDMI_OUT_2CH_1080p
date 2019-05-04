/*
 * vdma_api.h
 *
 *  Created on: 2016. 5. 30.
 *      Author: Bill_Kim
 */

#ifndef VDMA_API_H_
#define VDMA_API_H_

#include "xparameters.h"
//#include <sys/mman.h>
//#include <sysLib.h>
//#include <vmLib.h>
//#include "intLib.h"
//#include "iv.h"
//#include "semLib.h"
#include "pthread.h"

#include "xaxivdma_hw.h"
#include "xaxivdma_i.h"
#include "xaxivdma.h"

#define WRITE_FRST		0

typedef struct vdma_handle
{
	/* The device ID of the VDMA */
	unsigned int device_id;
	/* The state variable to keep track if the initialization is done*/
	unsigned int init_done;
	/** The XAxiVdma driver instance data. */
	XAxiVdma* InstancePtr;
	/* The XAxiVdma_DmaSetup structure contains all the necessary information to
	 * start a frame write or read. */
	XAxiVdma_DmaSetup ReadCfg;
	XAxiVdma_DmaSetup WriteCfg;
	/* Horizontal size of frame */
	unsigned int hsize;
	/* Vertical size of frame */
	unsigned int vsize;
	/* Buffer address from where read and write will be done by VDMA */
	unsigned int Read_buffer_address;
	unsigned int Write_buffer_address;
	/* Flag to tell VDMA to interrupt on frame completion*/
	unsigned int enable_frm_cnt_intr;
	/* The counter to tell VDMA on how many frames the interrupt should happen*/
	unsigned int number_of_frame_count;
	/* Interrupt ID */
	int WRTIE_INTR_ID;
//	SEM_ID sem;
	XAxiVdma_Config *Config;
}vdma_handle;

vdma_handle vdma_context[XPAR_XAXIVDMA_NUM_INSTANCES];

int run_triple_frame_buffer(XAxiVdma* InstancePtr, int DeviceId, int hsize,
		int vsize, int read_buf_base_addr, int write_buf_base_addr, int number_frame_count,
		int enable_frm_cnt_intr, int write_init_id);

#endif /* VDMA_API_H_ */
