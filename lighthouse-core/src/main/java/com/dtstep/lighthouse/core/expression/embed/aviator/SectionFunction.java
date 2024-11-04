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

import com.google.common.base.Splitter;
import com.googlecode.aviator.runtime.function.AbstractFunction;
import com.googlecode.aviator.runtime.type.AviatorNil;
import com.googlecode.aviator.runtime.type.AviatorObject;
import com.googlecode.aviator.runtime.type.AviatorString;
import com.dtstep.lighthouse.common.util.StringUtil;

import java.util.Iterator;
import java.util.Map;


public class SectionFunction extends AbstractFunction{

    private static final long serialVersionUID = 4224037045519835494L;

    public AviatorObject call(Map<String,Object> env, AviatorObject arg1, AviatorObject arg2){
        String a = String.valueOf(arg1.getValue(env));
        String b = String.valueOf(arg2.getValue(env));
        if(StringUtil.isEmpty(a) || StringUtil.isEmpty(b)){
            return AviatorNil.NIL;
        }
        if(!StringUtil.isNumber(a)){
            return AviatorNil.NIL;
        }
        return new AviatorString(getSection(Double.parseDouble(a),b));
    }

    public String getSection(double compA,String sections){
        Iterator<String> iterator = Splitter.on(",").split(sections).iterator();
        String pre = "-E";
        while (iterator.hasNext()){
            String compB = iterator.next();
            if(!StringUtil.isNumber(compB)){
                return "[-E ~ +E]";
            }
            if(!pre.equals("-E") && Double.parseDouble(pre) >= Double.parseDouble(compB)){
                return "[-E ~ +E]";
            }
            if(compA < Double.parseDouble(compB)){
                return "[" + pre + " ~ " + compB + "]";
            }else{
                pre = compB;
            }
        }
        return "[" + pre + " ~ +E]";
    }

    @Override
    public String getName() {
        return "section";
    }
}

