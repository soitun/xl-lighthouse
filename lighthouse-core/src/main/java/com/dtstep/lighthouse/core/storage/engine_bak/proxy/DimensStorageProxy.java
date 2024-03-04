package com.dtstep.lighthouse.core.storage.engine_bak.proxy;
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
import com.dtstep.lighthouse.core.storage.engine_bak.impl.HBaseDimensStorageEngine;
import com.dtstep.lighthouse.common.entity.event.DimensBucket;
import com.dtstep.lighthouse.core.storage.engine_bak.DimensStorageEngine;

import java.util.List;

public class DimensStorageProxy {

    private static final DimensStorageEngine<DimensBucket, String> dimensStorageEngine = new HBaseDimensStorageEngine();

    public static void put(List<DimensBucket> list) throws Exception {
        dimensStorageEngine.put(list);
    }

    public static List<String> queryDimensList(String token, String dimens, String lastDimensValue, int limitSize) throws Exception {
        return dimensStorageEngine.queryDimensList(token,dimens,lastDimensValue,limitSize);
    }

}