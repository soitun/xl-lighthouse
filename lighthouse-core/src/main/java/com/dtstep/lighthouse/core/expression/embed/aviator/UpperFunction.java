package com.dtstep.lighthouse.core.expression.embed.aviator;
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
import com.googlecode.aviator.runtime.function.AbstractFunction;
import com.googlecode.aviator.runtime.type.AviatorNil;
import com.googlecode.aviator.runtime.type.AviatorObject;
import com.googlecode.aviator.runtime.type.AviatorString;
import com.dtstep.lighthouse.core.expression.embed.EmbedFunction;
import com.dtstep.lighthouse.common.util.StringUtil;

import java.util.Map;


public class UpperFunction extends AbstractFunction{

    private static final long serialVersionUID = 6100343842733761710L;

    public AviatorObject call(Map<String,Object> env, AviatorObject arg1){
        String a = String.valueOf(arg1.getValue(env));
        if(StringUtil.isEmpty(a)){
            return AviatorNil.NIL;
        }
        return new AviatorString(EmbedFunction.upper(a));
    }

    @Override
    public String getName() {
        return "toUpper";
    }
}
