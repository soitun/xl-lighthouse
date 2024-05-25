package com.dtstep.lighthouse.standalone.rpc.provider;
/*
 * Copyright (C) 2022-2024 XueLing.雪灵
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
import com.dtstep.lighthouse.common.entity.group.GroupVerifyEntity;
import com.dtstep.lighthouse.common.entity.stat.StatVerifyEntity;
import com.dtstep.lighthouse.common.entity.view.LimitValue;
import com.dtstep.lighthouse.common.entity.view.StatValue;
import com.dtstep.lighthouse.common.ice.LightRpcException;
import com.dtstep.lighthouse.core.ipc.RPCServer;
import com.dtstep.lighthouse.core.ipc.impl.RPCServerImpl;
import com.dtstep.lighthouse.common.rpc.BasicRemoteLightServerPrx;
import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

public class StandaloneRemoteServiceImpl implements BasicRemoteLightServerPrx {

    private static final Logger logger = LoggerFactory.getLogger(StandaloneRemoteServiceImpl.class);

    private static final RPCServer rpc = new RPCServerImpl();

    @Override
    public void process(byte[] bytes) throws LightRpcException {
        try{
            rpc.process(bytes);
        }catch (Exception ex){
            logger.error("process message error!",ex);
            throw new LightRpcException(ex.getMessage());
        }
    }

    @Override
    public GroupVerifyEntity queryGroupInfo(String token) throws LightRpcException {
        try{
            return rpc.queryGroupInfo(token);
        }catch (Exception ex){
            logger.error("query group error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public StatVerifyEntity queryStatInfo(int id) throws LightRpcException {
        try{
            return rpc.queryStatInfo(id);
        }catch (Exception ex){
            logger.error("query stat error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public List<StatValue> dataQuery(int statId, String dimensValue, List<Long> batchTime) throws LightRpcException {
        try{
            return rpc.dataQuery(statId, dimensValue, batchTime);
        }catch (Exception ex){
            logger.error("call dataQuery error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public List<StatValue> dataDurationQuery(int statId, String dimensValue, long startTime, long endTime) throws LightRpcException {
        try{
            return rpc.dataDurationQuery(statId, dimensValue, startTime,endTime);
        }catch (Exception ex){
            logger.error("call dataDurationQuery error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public Map<String, List<StatValue>> dataQueryWithDimensList(int statId, List<String> dimensValueList, List<Long> batchTime) throws LightRpcException {
        try{
            return rpc.dataQueryWithDimensList(statId, dimensValueList, batchTime);
        }catch (Exception ex){
            logger.error("call dataQueryWithDimensList error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public Map<String, List<StatValue>> dataDurationQueryWithDimensList(int statId, List<String> dimensValueList, long startTime, long endTime) throws LightRpcException {
        try{
            return rpc.dataDurationQueryWithDimensList(statId, dimensValueList, startTime,endTime);
        }catch (Exception ex){
            logger.error("call dataDurationQueryWithDimensList error!",ex);
            throw new LightRpcException(ex);
        }
    }

    @Override
    public List<LimitValue> limitQuery(int statId, long batchTime) throws LightRpcException {
        try{
            return rpc.limitQuery(statId, batchTime);
        }catch (Exception ex){
            logger.error("call limitQuery error!",ex);
            throw new LightRpcException(ex);
        }
    }
}
