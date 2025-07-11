package com.dtstep.lighthouse.common.entity.view;

import java.io.Serializable;

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
public class LimitValue implements Serializable {

    private String dimensValue;

    private String displayDimensValue;

    private Object score;

    public LimitValue(){}

    public LimitValue(String dimensValue,Object score){
        this.dimensValue = dimensValue;
        this.score = score;
    }

    public String getDisplayDimensValue() {
        return displayDimensValue;
    }

    public void setDisplayDimensValue(String displayDimensValue) {
        this.displayDimensValue = displayDimensValue;
    }

    public String getDimensValue() {
        return dimensValue;
    }

    public void setDimensValue(String dimensValue) {
        this.dimensValue = dimensValue;
    }

    public Object getScore() {
        return score;
    }

    public void setScore(Object score) {
        this.score = score;
    }
}
