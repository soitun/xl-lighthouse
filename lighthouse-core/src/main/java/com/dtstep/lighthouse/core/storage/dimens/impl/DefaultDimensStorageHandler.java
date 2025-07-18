package com.dtstep.lighthouse.core.storage.dimens.impl;
/*
 * Copyright (C) 2022-2025 XueLing.雪灵
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import com.dtstep.lighthouse.common.constant.StatConst;
import com.dtstep.lighthouse.common.constant.SysConst;
import com.dtstep.lighthouse.common.entity.event.DimensBucket;
import com.dtstep.lighthouse.common.hash.HashUtil;
import com.dtstep.lighthouse.common.modal.Group;
import com.dtstep.lighthouse.common.util.Md5Util;
import com.dtstep.lighthouse.common.util.StringUtil;
import com.dtstep.lighthouse.core.rowkey.KeyGenerator;
import com.dtstep.lighthouse.core.rowkey.impl.DefaultKeyGenerator;
import com.dtstep.lighthouse.core.storage.common.LdpPut;
import com.dtstep.lighthouse.core.storage.common.LdpResult;
import com.dtstep.lighthouse.core.storage.dimens.DimensStorageHandler;
import com.dtstep.lighthouse.core.storage.warehouse.WarehouseStorageEngineProxy;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class DefaultDimensStorageHandler implements DimensStorageHandler<DimensBucket, String> {

    private static final Logger logger = LoggerFactory.getLogger(DefaultDimensStorageHandler.class);

    private static final KeyGenerator keyGenerator = new DefaultKeyGenerator();

    private static final String dimensColumnName = "v";

    @Override
    public void put(List<DimensBucket> list) throws Exception {
        if(CollectionUtils.isEmpty(list)){
            return;
        }
        Set<String> uniqueSet = new HashSet<>();
        List<LdpPut> putList = new ArrayList<>();
        for(DimensBucket quartet : list){
            String rowKey = keyGenerator.dimensKey(quartet.getGroup(),quartet.getDimens(),quartet.getDimensValue());
            if(logger.isTraceEnabled()){
                logger.trace("save dimens,token:{},dimens:{},dimensValue:{},rowKey:{}",quartet.getGroup().getToken(),quartet.getDimens(),quartet.getDimensValue(),rowKey);
            }
            LdpPut ldpPut = LdpPut.with(rowKey,dimensColumnName,quartet.getDimensValue(),quartet.getTtl());
            if(!uniqueSet.contains(rowKey)){
                putList.add(ldpPut);
                uniqueSet.add(rowKey);
            }
        }
        WarehouseStorageEngineProxy.getInstance().puts(StatConst.DIMENS_STORAGE_TABLE,putList);
    }

    @Override
    public List<String> query(Group group, String dimens, String lastDimensValue, int limit) throws Exception {
        String baseKey = group.getRandomId() + "_" + group.getDataVersion() + "_" + dimens;
        int startIndex = Math.abs((int) (HashUtil.BKDRHash(baseKey) % SysConst._DBKeyPrefixArray.length));
        List<String> dimensList = new ArrayList<>();
        String startRow = null;
        if(!StringUtil.isEmpty(lastDimensValue)){
            startRow = keyGenerator.dimensKey(group,dimens,lastDimensValue);
        }
        String finalStartRow = startRow;
        List<Integer> indexList = new ArrayList<>();
        for(int part = 0;part <SysConst._DIMENS_STORAGE_PRE_PARTITIONS_SIZE;part ++){
            int current = startIndex + part ;
            while (current >= SysConst._DBKeyPrefixArray.length){
                current = current - SysConst._DBKeyPrefixArray.length;
            }
            indexList.add(current);
        }
        List<Integer> sortedIndexList = indexList.stream().sorted().collect(Collectors.toList());
        for (int current : sortedIndexList) {
            if (dimensList.size() >= limit) {
                break;
            }
            String prefix = SysConst._DBKeyPrefixArray[current];
            String partStartRow = prefix + Md5Util.getMD5(baseKey) + ".";
            String partEndRow = prefix + Md5Util.getMD5(baseKey) + "|";
            if (finalStartRow != null && finalStartRow.compareTo(partEndRow) > 0) {
                continue;
            } else if (finalStartRow != null && finalStartRow.compareTo(partStartRow) > 0) {
                partStartRow = finalStartRow;
            }
            try {
                while (true) {
                    int requireSize = limit - dimensList.size();
                    List<LdpResult<String>> dbResults = WarehouseStorageEngineProxy.getInstance().scan(StatConst.DIMENS_STORAGE_TABLE, partStartRow, partEndRow, requireSize, String.class);
                    if (CollectionUtils.isEmpty(dbResults)) {
                        break;
                    }
                    for (LdpResult<String> ldpResult : dbResults) {
                        String dimensValue = ldpResult.getData();
                        if (StringUtil.isNotEmpty(dimensValue) && dimensList.size() < limit) {
                            partStartRow = ldpResult.getKey();
                            dimensList.add(dimensValue);
                        }
                    }
                    if (dimensList.size() >= limit || dbResults.size() < requireSize) {
                        break;
                    }
                }
            } catch (Exception ex) {
                logger.error("load dimens error!", ex);
            }
        }
        return dimensList;
    }
}
