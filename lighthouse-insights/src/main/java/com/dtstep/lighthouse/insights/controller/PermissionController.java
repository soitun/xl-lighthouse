package com.dtstep.lighthouse.insights.controller;

import com.dtstep.lighthouse.common.modal.ListSearchObject;
import com.dtstep.lighthouse.common.modal.Pagination;
import com.dtstep.lighthouse.insights.vo.ResultData;
import com.dtstep.lighthouse.common.entity.ListData;
import com.dtstep.lighthouse.insights.dto.PermissionListQueryParam;
import com.dtstep.lighthouse.insights.dto.PermissionQueryParam;
import com.dtstep.lighthouse.common.enums.RoleTypeEnum;
import com.dtstep.lighthouse.common.modal.Role;
import com.dtstep.lighthouse.insights.service.PermissionService;
import com.dtstep.lighthouse.insights.service.RoleService;
import com.dtstep.lighthouse.insights.vo.PermissionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ControllerAdvice
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/permission/list")
    public ResultData<ListData<PermissionVO>> list(@Validated @RequestBody ListSearchObject<PermissionListQueryParam> searchObject) {
        PermissionListQueryParam listQueryParam = searchObject.getQueryParams();
        Integer resourceId = listQueryParam.getResourceId();
        RoleTypeEnum roleTypeEnum = listQueryParam.getRoleType();
        Role role = roleService.queryRole(roleTypeEnum,resourceId);
        Pagination pagination = searchObject.getPagination();
        PermissionQueryParam queryParam = new PermissionQueryParam();
        queryParam.setOwnerType(listQueryParam.getOwnerType());
        queryParam.setRoleId(role.getId());
        queryParam.setSearch(listQueryParam.getSearch());
        ListData<PermissionVO> listData = permissionService.queryList(queryParam, pagination.getPageNum(), pagination.getPageSize());
        return ResultData.success(listData);
    }


}
