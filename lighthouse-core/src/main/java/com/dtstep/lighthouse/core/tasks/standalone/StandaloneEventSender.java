package com.dtstep.lighthouse.core.tasks.standalone;
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
import com.dtstep.lighthouse.common.entity.message.LightMessage;
import com.dtstep.lighthouse.common.enums.result.MessageCaptchaEnum;
import com.dtstep.lighthouse.common.util.StringUtil;
import com.dtstep.lighthouse.core.consumer.RealTimeProcessor;
import com.dtstep.lighthouse.core.preparing.handler.expand.ExpandEvent;
import com.dtstep.lighthouse.core.preparing.pipe.Pipeline;
import com.dtstep.lighthouse.core.preparing.pipe.PipelineBuilder;
import com.dtstep.lighthouse.core.preparing.pipe.stage.ExpandStageImpl;
import com.dtstep.lighthouse.core.preparing.pipe.stage.PreparingStage;
import com.dtstep.lighthouse.core.preparing.pipe.stage.TranslateStageImpl;
import com.dtstep.lighthouse.core.preparing.pipe.stage.ValidStageImpl;
import com.dtstep.lighthouse.core.tasks.EventSender;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.charset.StandardCharsets;
import java.util.List;

public class StandaloneEventSender implements EventSender {

    private static final Logger logger = LoggerFactory.getLogger(StandaloneEventSender.class);

    private static final Pipeline<byte[],ExpandEvent> pipeline;

    static {
        PreparingStage<byte[], LightMessage> translateStage = new TranslateStageImpl();
        PreparingStage<LightMessage, Pair<MessageCaptchaEnum,LightMessage>> validStage = new ValidStageImpl();
        PreparingStage<Pair<MessageCaptchaEnum,LightMessage>, ExpandEvent> expandStage = new ExpandStageImpl();
        pipeline = PipelineBuilder.create(translateStage).add(validStage).add(expandStage).build();
    }

    @Override
    public void send(String text) throws Exception {
        if(StringUtil.isEmpty(text)){
            return;
        }
        try{
            List<ExpandEvent> expandEventList = pipeline.process(text.getBytes(StandardCharsets.UTF_8));
            if(CollectionUtils.isNotEmpty(expandEventList)){
                for(ExpandEvent expandEvent : expandEventList){
                    RealTimeProcessor.onEvent(expandEvent);
                }
            }
        }catch (Exception ex){
            logger.error("send message failed!",ex);
        }
    }

    @Override
    public void syncSend(String text) throws Exception {}
}
