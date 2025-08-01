package com.dtstep.lighthouse.common.random;
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
import org.apache.commons.collections.CollectionUtils;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;


public final class RandomID {

    private RandomID(){}

    private static final char[] DIGITS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
            'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };


    public static String id(int size) {
        char[] cs = new char[size];
        for (int i = 0; i < cs.length; i++) {
            cs[i] = DIGITS[ThreadLocalRandom.current().nextInt(DIGITS.length)];
        }
        return new String(cs);
    }

    public static char[] idOfChar(int size) {
        char[] cs = new char[size];
        for (int i = 0; i < cs.length; i++) {
            cs[i] = DIGITS[ThreadLocalRandom.current().nextInt(DIGITS.length)];
        }
        return cs;
    }

    public static String id(int size, List<String> filterDuplicate){
        String result;
        if(CollectionUtils.isNotEmpty(filterDuplicate)){
            while (true){
                result = id(size);
                if(!filterDuplicate.contains(result)){
                    filterDuplicate.add(result);
                    break;
                }
            }
        }else {
            result = id(size);
        }
        return result;
    }


}
