package com.dtstep.lighthouse.core.preparing.pipe;
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
import org.apache.commons.collections.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

public class PreparingCollector<OUT> {

    private List<OUT> data = new ArrayList<>();

    public void add(OUT item){
        if(item != null){
            data.add(item);
        }
    }

    public void addAll(List<OUT> itemList){
        if(CollectionUtils.isNotEmpty(itemList)){
            data.addAll(itemList);
        }
    }

    public List<OUT> getData() {
        return data;
    }

    public void setData(List<OUT> data) {
        this.data = data;
    }
}
