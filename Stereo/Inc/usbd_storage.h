/**
  ******************************************************************************
  * @file           : usbd_SDCard_if.h
  * @author         : MCD Application Team
  * @version        : V1.1.0
  * @date           : 19-March-2012
  * @brief          : header file for the usbd_SDCard_if.c file
  ******************************************************************************
  * COPYRIGHT(c) 2014 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  * 1. Redistributions of source code must retain the above copyright notice,
  * this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  * this list of conditions and the following disclaimer in the documentation
  * and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of its contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
*/

/* Define to prevent recursive inclusion -------------------------------------*/

#ifndef __USBD_SDCard_IF_H_
#define __USBD_SDCard_IF_H_

/* Includes ------------------------------------------------------------------*/
#include "usbd_msc.h"
#include "bsp_driver_sd.h"
#include "bsp_driver_sdram.h"
#include "exflash_diskio.h"
#include "diskio.h"

/** @addtogroup STM32_USB_OTG_DEVICE_LIBRARY
  * @{
  */
  
/** @defgroup USBD_SDCard
  * @brief header file for the USBD_SDCard.c file
  * @{
  */ 

/** @defgroup USBD_SDCard_Exported_Defines
  * @{
  */ 
/**
  * @}
  */ 

/** @defgroup USBD_SDCard_Exported_Types
  * @{
  */

/**
  * @}
  */ 

/** @defgroup USBD_SDCard_Exported_Macros
  * @{
  */ 

/**
  * @}
  */ 

/** @defgroup USBD_SDCard_Exported_Variables
  * @{
  */ 
extern USBD_StorageTypeDef  USBD_Storage_Interface_fops_FS;

extern DRESULT SD_read(BYTE *buff, DWORD sector, BYTE count);
extern DRESULT SD_write(const BYTE *buff, DWORD sector, BYTE count);
#define LUN_HAS_SDRAM 0

#if LUN_HAS_SDRAM
extern DRESULT SDRAMDISK_read(BYTE *buff, DWORD sector, BYTE count);
extern DRESULT SDRAMDISK_write(const BYTE *buff, DWORD sector, BYTE count);
#endif
/**
  * @}
  */ 

/** @defgroup USBD_SDCard_Exported_FunctionsPrototype
  * @{
  */ 

/**
  * @}
  */ 

#endif /* __USBD_SDCard_IF_H_ */

/**
  * @}
  */ 

/**
* @}
*/ 
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
