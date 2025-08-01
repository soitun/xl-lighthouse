package com.dtstep.lighthouse.client.rpc.ice;
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
import com.dtstep.lighthouse.common.ice.RemoteLightServerPrx;
import com.dtstep.lighthouse.common.random.RandomID;
import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.ObjectPrx;


public class ICEHandler {

    private static RemoteLightServerPrx remoteLightServerPrx;

    public static RemoteLightServerPrx getRemotePrx(Communicator ic){
        if(remoteLightServerPrx == null){
            ObjectPrx auxBasePrx = ic.stringToProxy("LightHouseServiceIdentity").ice_connectionId(RandomID.id(32)).ice_locatorCacheTimeout(1200);
            remoteLightServerPrx = RemoteLightServerPrx.checkedCast(auxBasePrx);
        }
        return remoteLightServerPrx;
    }
}
