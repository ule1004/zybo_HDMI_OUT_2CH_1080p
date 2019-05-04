/*
 * tpg.h
 *
 *  Created on: 2018. 9. 27.
 *      Author: alice
 */

#ifndef SRC_TPG_H_
#define SRC_TPG_H_

int tpg_init(u16 DeviceID);
void tpg_start(void);
u32 get_tpg_width(void);
u32 get_tpg_height(void);
u32 get_tpg_colorforma(void);
void set_tpg_width(u32 Data);
void set_tpg_height(u32 Data);
void set_tpg_colorformat(u32 Data);
void tpg_enable_restart(void);
void tpg_disable_restart(void);
void set_tpg_bckgndId(u32 Data);
void set_tpg_overlayId(u32 Data);

#endif /* SRC_TPG_H_ */
