package com.dtstep.lighthouse.test.impl;
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
import com.dtstep.lighthouse.client.LightHouse;
import com.dtstep.lighthouse.common.util.DateUtil;
import com.dtstep.lighthouse.test.config.TestConfigContext;
import com.dtstep.lighthouse.test.entity.BehaviorSampleEntity;
import com.dtstep.lighthouse.test.entity.SampleEntity;
import com.dtstep.lighthouse.test.mode.ModalSample;
import com.dtstep.lighthouse.test.util.BeanUtil;

import java.util.concurrent.TimeUnit;

public class OnceModeTestImpl implements TestModel {

    @Override
    public void send(TestConfigContext testConfigContext) throws Exception {
        long t1 = System.currentTimeMillis();
        long batchTime = DateUtil.batchTime(1, TimeUnit.MINUTES,System.currentTimeMillis());
        String token = testConfigContext.getToken();
        String secretKey = testConfigContext.getSecretKey();
        ModalSample<BehaviorSampleEntity> modalSample = testConfigContext.getModalSample();
        int size = testConfigContext.getMessageSize();
        for(int i=0;i<size;i++){
            SampleEntity sampleEntity = modalSample.generateSample();
            sampleEntity.setTimestamp(batchTime);
            LightHouse.stat(token,secretKey, BeanUtil.beanToMap(sampleEntity),batchTime);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("send success,batchTime:" + DateUtil.formatTimeStamp(batchTime,"yyyy-MM-dd HH:mm:ss")
                + ",execute time:" + DateUtil.formatTimeStamp(t1,"yyyy-MM-dd HH:mm:ss") + ",cost:" + (t2 - t1));
    }
}
