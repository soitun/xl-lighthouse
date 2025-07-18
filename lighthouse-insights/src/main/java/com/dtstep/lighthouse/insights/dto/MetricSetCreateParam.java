package com.dtstep.lighthouse.insights.dto;
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
import com.dtstep.lighthouse.common.enums.PrivateTypeEnum;

import javax.validation.constraints.NotNull;
import java.util.List;

public class MetricSetCreateParam {

    @NotNull
    private String title;

    @NotNull
    private PrivateTypeEnum privateType;

    @NotNull
    private String desc;

    private List<Integer> initUsersPermission;

    private List<Integer> initDepartmentsPermission;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public PrivateTypeEnum getPrivateType() {
        return privateType;
    }

    public void setPrivateType(PrivateTypeEnum privateType) {
        this.privateType = privateType;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List<Integer> getInitUsersPermission() {
        return initUsersPermission;
    }

    public void setInitUsersPermission(List<Integer> initUsersPermission) {
        this.initUsersPermission = initUsersPermission;
    }

    public List<Integer> getInitDepartmentsPermission() {
        return initDepartmentsPermission;
    }

    public void setInitDepartmentsPermission(List<Integer> initDepartmentsPermission) {
        this.initDepartmentsPermission = initDepartmentsPermission;
    }
}
