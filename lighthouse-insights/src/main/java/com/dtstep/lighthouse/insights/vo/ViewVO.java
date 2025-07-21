package com.dtstep.lighthouse.insights.vo;
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
import com.dtstep.lighthouse.common.modal.PermissionEnum;
import com.dtstep.lighthouse.common.modal.TreeNode;
import com.dtstep.lighthouse.common.modal.User;
import com.dtstep.lighthouse.common.modal.View;
import com.dtstep.lighthouse.common.util.BeanCopyUtil;

import java.util.*;

public class ViewVO extends View {

    private List<User> admins;

    private Object config;

    private Map<String,List<TreeNode>> filtersData;

    private List<ResourceVO> resourceList = new ArrayList<>();

    private Integer currentVersion;

    public Map<String, List<TreeNode>> getFiltersData() {
        return filtersData;
    }

    public void setFiltersData(Map<String, List<TreeNode>> filtersData) {
        this.filtersData = filtersData;
    }

    private Set<PermissionEnum> permissions = new HashSet<>();

    public Set<PermissionEnum> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<PermissionEnum> permissions) {
        this.permissions = permissions;
    }

    public void addPermission(PermissionEnum permission){
        if(permission != null){
            permissions.add(permission);
        }
    }

    public ViewVO(View view){
        assert view != null;
        BeanCopyUtil.copy(view,this);
    }

    public List<User> getAdmins() {
        return admins;
    }

    public void setAdmins(List<User> admins) {
        this.admins = admins;
    }

    public Object getConfig() {
        return config;
    }

    public void setConfig(Object config) {
        this.config = config;
    }

    public List<ResourceVO> getResourceList() {
        return resourceList;
    }

    public void setResourceList(List<ResourceVO> resourceList) {
        this.resourceList = resourceList;
    }

    public Integer getCurrentVersion() {
        return currentVersion;
    }

    public void setCurrentVersion(Integer currentVersion) {
        this.currentVersion = currentVersion;
    }
}
