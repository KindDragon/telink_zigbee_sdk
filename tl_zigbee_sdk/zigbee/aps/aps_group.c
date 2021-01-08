/********************************************************************************************************
 * @file	aps_group.c
 *
 * @brief	This is the source file for aps_group
 *
 * @author	Zigbee Group
 * @date	2019
 *
 * @par     Copyright (c) 2019, Telink Semiconductor (Shanghai) Co., Ltd. ("TELINK")
 *          All rights reserved.
 *
 *          Redistribution and use in source and binary forms, with or without
 *          modification, are permitted provided that the following conditions are met:
 *
 *              1. Redistributions of source code must retain the above copyright
 *              notice, this list of conditions and the following disclaimer.
 *
 *              2. Unless for usage inside a TELINK integrated circuit, redistributions
 *              in binary form must reproduce the above copyright notice, this list of
 *              conditions and the following disclaimer in the documentation and/or other
 *              materials provided with the distribution.
 *
 *              3. Neither the name of TELINK, nor the names of its contributors may be
 *              used to endorse or promote products derived from this software without
 *              specific prior written permission.
 *
 *              4. This software, with or without modification, must only be used with a
 *              TELINK integrated circuit. All other usages are subject to written permission
 *              from TELINK and different commercial license may apply.
 *
 *              5. Licensee shall be solely responsible for any claim to the extent arising out of or
 *              relating to such deletion(s), modification(s) or alteration(s).
 *
 *          THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 *          ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 *          WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *          DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
 *          DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 *          (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *          LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *          ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *          (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 *          SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *******************************************************************************************************/
#include "../common/includes/zb_common.h"


#define APS_GROUP_EP_INVALID          0xff
#define	APS_INVALID_GRP_ADDR          0xffff


static u8 aps_group_entry_num = 0;  //number of group entry items in group table

_CODE_APS_ void aps_groupTblSave2Flash(void *arg){
#if NV_ENABLE
	nv_flashWriteNew(1, NV_MODULE_APS, 	NV_ITEM_APS_GROUP_TABLE, APS_GROUP_TABLE_SIZE * sizeof(aps_group_tbl_ent_t), (u8*)aps_group_tbl);
#endif
}

_CODE_APS_ u8 aps_groupTblNvInit(void){
	u8 ret = NV_ITEM_NOT_FOUND;
#if NV_ENABLE
	ret = nv_flashReadNew(1, NV_MODULE_APS, NV_ITEM_APS_GROUP_TABLE, APS_GROUP_TABLE_SIZE * sizeof(aps_group_tbl_ent_t), (u8*)aps_group_tbl);
#endif
	return ret;
}

_CODE_APS_ aps_group_tbl_ent_t *aps_group_search_by_addr(u16 group_addr)
{
	u8 i = 0;
	u8 index = 0;
	u8 findEmpty = FALSE;

	if (group_addr == APS_INVALID_GRP_ADDR) {
		findEmpty = TRUE;
	}
	while(i < aps_group_entry_num){
		if (aps_group_tbl[index].group_addr == APS_INVALID_GRP_ADDR){
			if(findEmpty){
				return &aps_group_tbl[index];
			}else{
				index++;
				continue;
			}
		}
		if(aps_group_tbl[index].group_addr == group_addr) {
			return &aps_group_tbl[index];
		}
		i++;
		index++;
	}

    if(findEmpty) {
        while(index < APS_GROUP_TABLE_SIZE) {
            if (aps_group_tbl[index].group_addr == APS_INVALID_GRP_ADDR) {
                return &aps_group_tbl[index];
            }
            index++;
        }
    }
	return NULL;
}

_CODE_APS_ u8 *aps_group_ep_info_get(u16 group_addr, u8 *epNum){
	aps_group_tbl_ent_t *ent = aps_group_search_by_addr(group_addr);
	if(ent){
		*epNum = ent->n_endpoints;
		return (&ent->endpoints[0]);
	}

	return NULL;
}

_CODE_APS_ u8 *aps_group_ep_find(aps_group_tbl_ent_t *entry, u8 endpoint)
{
	u8 i = 0;
	u8 index = 0;
	u8 findEmpty = FALSE;

	if (endpoint == APS_GROUP_EP_INVALID) {
		findEmpty = TRUE;
	}

	while (i < entry->n_endpoints) {
		if (entry->endpoints[index] == APS_GROUP_EP_INVALID) {
			if (findEmpty) {
				return &entry->endpoints[index];
			} else {
				index++;
				continue;
			}
		}
		if (entry->endpoints[index] == endpoint) {
			return &entry->endpoints[index];
		}
		i++;
		index++;
	}

    if(findEmpty) {
        while(index < APS_EP_NUM_IN_GROUP_TBL) {
            if(entry->endpoints[index] == APS_GROUP_EP_INVALID){
                return &entry->endpoints[index];
            }
            index++;
        }
    }

	return NULL;
}

_CODE_APS_ aps_group_tbl_ent_t *aps_group_search(u16 groupAddr, u8 endpoint)
{
	aps_group_tbl_ent_t *pEntry;
	u8* pEndpoint;

	pEntry = aps_group_search_by_addr(groupAddr);
	if (pEntry == NULL) {
		return NULL;
	}

	pEndpoint = aps_group_ep_find(pEntry, endpoint);
	if (pEndpoint == NULL) {
		return NULL;
	}

	return pEntry;
}

/*******************************************************************************************************************
 * @brief	This primitive is generated by the next higher layer when it wants to add
			membership in a particular group to an endpoint, so that frames addressed to the
			group will be delivered to that endpoint in the future.

 * @param	req: aps_add_group_req_t struct
 */
_CODE_APS_ aps_status_t aps_me_group_add_req(aps_add_group_req_t *req)
{
	aps_status_t status = APS_STATUS_SUCCESS;
	aps_group_tbl_ent_t *pEntry;
	u8 *pEndpoint;
	if((req->ep < 0x01) || (req->ep > 0xfe)){
		status = APS_STATUS_INVALID_PARAMETER;
		return status;
	}
	pEntry = aps_group_search_by_addr(req->group_addr);
	if(pEntry){//Group entry found
		//Add or update endpoint
		pEndpoint = aps_group_ep_find(pEntry, req->ep);
		if(pEndpoint == NULL) {//Endpoint not found
			pEndpoint = aps_group_ep_find(pEntry, APS_GROUP_EP_INVALID);
			if(pEndpoint == NULL) {
				return APS_STATUS_TABLE_FULL;
			}else{
				*pEndpoint = req->ep;
				pEntry->n_endpoints++;
			}
		}else{
			return APS_STATUS_DUPLICATE_ENTRY;
		}
	}else{// Group entry not found
		pEntry = aps_group_search_by_addr(APS_INVALID_GRP_ADDR);
		if (pEntry == NULL) {
			return APS_STATUS_TABLE_FULL;
		}
		pEntry->group_addr = req->group_addr;
		pEntry->endpoints[0] = req->ep;
		pEntry->n_endpoints++;
		aps_group_entry_num++;
	}//end if(pEntry)

	if(APS_STATUS_SUCCESS == status){
		TL_SCHEDULE_TASK(aps_groupTblSave2Flash,NULL);
	}

	return status;
}

_CODE_APS_ aps_status_t aps_me_group_delete_req(aps_delete_group_req_t *req){
	aps_status_t status = APS_STATUS_SUCCESS;
	aps_group_tbl_ent_t *pEntry;
	u8 *pEndpoint;
	if((req->ep < 0x01) || (req->ep > 0xfe)){
		status = APS_STATUS_INVALID_PARAMETER;
		return status;
	}
	pEntry = aps_group_search_by_addr(req->group_addr);

	if(pEntry == NULL){//Group address not found
		return APS_STATUS_INVALID_GROUP;
	}
	pEndpoint = aps_group_ep_find(pEntry, req->ep);
	if(pEndpoint == NULL){//Endpoint not found
		return APS_STATUS_INVALID_GROUP;
	}
	*pEndpoint = APS_GROUP_EP_INVALID;
	pEntry->n_endpoints--;
	if (pEntry->n_endpoints == 0) {
		//TODO: No endpoint in the group, delete the group
		pEntry->group_addr = APS_INVALID_GRP_ADDR;
		aps_group_entry_num--;
	}

	if(APS_STATUS_SUCCESS == status){
		TL_SCHEDULE_TASK(aps_groupTblSave2Flash,NULL);
	}
	return status;
}

_CODE_APS_ void aps_groupTblReset(void){
	aps_group_entry_num = 0;
	for (u8 i = 0; i < APS_GROUP_TABLE_SIZE; i++) {
		aps_group_tbl[i].group_addr = APS_INVALID_GRP_ADDR;
		aps_group_tbl[i].n_endpoints = 0;
		for(u8 j=0;j<APS_EP_NUM_IN_GROUP_TBL;j++){
			aps_group_tbl[i].endpoints[j] = APS_GROUP_EP_INVALID;
		}
	}
}

_CODE_APS_ aps_status_t aps_me_group_delete_all_req(u8 ep){
	aps_status_t status = APS_STATUS_SUCCESS;
	aps_group_tbl_ent_t *pEntry;
	u8 *pEndpoint;
	u8 i = 0;
	u8 index = 0;
	if((ep < 0x01) || (ep > 0xfe)){
		status = APS_STATUS_INVALID_PARAMETER;
		return status;
	}

	while(i <= aps_group_entry_num){
		//skip the empty group
		if(aps_group_tbl[index].group_addr == APS_INVALID_GRP_ADDR){
			index++;
			if (index >= APS_GROUP_TABLE_SIZE){
				i++;
				index = 0;
			}
			continue;
		}
		pEntry = &aps_group_tbl[index];
		pEndpoint = aps_group_ep_find(pEntry,ep);

		if(pEndpoint){
			*pEndpoint = APS_GROUP_EP_INVALID;
			pEntry->n_endpoints--;
		}

		//If the endpoints already empty, clear the group entry
		if(pEntry->n_endpoints == 0){
			//todo Before deleting a group, remove all associated scene entries.
			//zcl_scene_removeScenesWithGroup(pEntry->group_addr);
			pEntry->group_addr = APS_INVALID_GRP_ADDR;
			aps_group_entry_num--;
		}

		//search next group
		index++;
		i++;
	}//end while

	aps_groupTblReset();
	TL_SCHEDULE_TASK(aps_groupTblSave2Flash, NULL);
	return status;
}

_CODE_APS_ u8 aps_group_entry_num_get(void){
	return aps_group_entry_num;
}

_CODE_APS_ void aps_group_list_get(u8 *counter, u16 *group_list)
{
	u8 i = 0;

	if(!counter || !group_list){
		return;
	}
	*counter = 0;
	while (i < APS_GROUP_TABLE_SIZE) {
		if(aps_group_tbl[i].group_addr != APS_INVALID_GRP_ADDR){
			group_list[(*counter)++] = aps_group_tbl[i].group_addr;
		}
		i++;
	}
}

_CODE_APS_ void aps_init_group_num_set(void){
	for(u8 i=0; i<APS_GROUP_TABLE_SIZE; i++){
		if(aps_group_tbl[i].group_addr != APS_INVALID_GRP_ADDR){
			aps_group_entry_num++;
		}
	}
}

