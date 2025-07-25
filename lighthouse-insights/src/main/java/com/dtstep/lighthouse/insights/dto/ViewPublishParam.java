package com.dtstep.lighthouse.insights.dto;

import java.util.List;

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
public class ViewPublishParam {

    private Integer id;

    private Integer version;

    private boolean externalLinkEnabled;

    private List<ResourceParam> applyResources;

    private Integer callerId;

    private String reason;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public boolean isExternalLinkEnabled() {
        return externalLinkEnabled;
    }

    public void setExternalLinkEnabled(boolean externalLinkEnabled) {
        this.externalLinkEnabled = externalLinkEnabled;
    }

    public List<ResourceParam> getApplyResources() {
        return applyResources;
    }

    public void setApplyResources(List<ResourceParam> applyResources) {
        this.applyResources = applyResources;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getCallerId() {
        return callerId;
    }

    public void setCallerId(Integer callerId) {
        this.callerId = callerId;
    }
}
