package com.dtstep.lighthouse.insights.service.impl;

import com.dtstep.lighthouse.insights.dto.RolePair;
import com.dtstep.lighthouse.insights.enums.ResourceTypeEnum;
import com.dtstep.lighthouse.insights.enums.RoleTypeEnum;
import com.dtstep.lighthouse.insights.modal.Resource;
import com.dtstep.lighthouse.insights.modal.Role;
import com.dtstep.lighthouse.insights.service.ResourceService;
import com.dtstep.lighthouse.insights.service.RoleService;
import org.apache.commons.lang3.Validate;
import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private RoleService roleService;

    @Transactional
    @Override
    public RolePair addResourceCallback(Resource resource) {
        List<Role> roleList = new ArrayList<>();
        Role manageRole = null;
        Role accessRole = null;
        if(resource.getResourceType() == ResourceTypeEnum.Department){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Project){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.PROJECT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.PROJECT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Group){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.PROJECT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.PROJECT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.GROUP_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.GROUP_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Stat){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.GROUP_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.GROUP_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.STAT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.STAT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Metric){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.METRIC_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.METRIC_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }
        Validate.notNull(manageRole);
        Validate.notNull(accessRole);
        roleService.create(manageRole);
        roleService.create(accessRole);
        return new RolePair(manageRole.getId(),accessRole.getId());
    }

    @Transactional
    @Override
    public void updateResourcePidCallback(Resource resource) {
        List<Role> roleList = new ArrayList<>();
        Role manageRole = null;
        Role accessRole = null;
        if(resource.getResourceType() == ResourceTypeEnum.Department){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Project){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.PROJECT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.PROJECT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Group){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.PROJECT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.PROJECT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.GROUP_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.GROUP_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Stat){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.GROUP_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.GROUP_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.STAT_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.STAT_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }else if(resource.getResourceType() == ResourceTypeEnum.Metric){
            Role parentManageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getPid());
            Integer manageRolePid = parentManageRole.getId();
            Role parentAccessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getPid());
            Integer accessRolePid = parentAccessRole.getId();
            manageRole = new Role(RoleTypeEnum.METRIC_MANAGE_PERMISSION,resource.getResourceId(),manageRolePid);
            accessRole = new Role(RoleTypeEnum.METRIC_ACCESS_PERMISSION,resource.getResourceId(),accessRolePid);
        }
        Validate.notNull(manageRole);
        Validate.notNull(accessRole);
        roleService.update(manageRole);
        roleService.update(accessRole);
    }

    @Transactional
    @Override
    public void deleteResourceCallback(Resource resource) throws Exception {
        List<Role> roleList = new ArrayList<>();
        Role manageRole = null;
        Role accessRole = null;
        if(resource.getResourceType() == ResourceTypeEnum.Department){
            manageRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_MANAGE_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(manageRole.getId())){
                throw new Exception();
            }
            accessRole = roleService.queryRole(RoleTypeEnum.DEPARTMENT_ACCESS_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(accessRole.getId())){
                throw new Exception();
            }
        }else if(resource.getResourceType() == ResourceTypeEnum.Project){
            manageRole = roleService.queryRole(RoleTypeEnum.PROJECT_MANAGE_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(manageRole.getId())){
                throw new Exception();
            }
            accessRole = roleService.queryRole(RoleTypeEnum.PROJECT_ACCESS_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(accessRole.getId())){
                throw new Exception();
            }
        }else if(resource.getResourceType() == ResourceTypeEnum.Group){
            manageRole = roleService.queryRole(RoleTypeEnum.GROUP_MANAGE_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(manageRole.getId())){
                throw new Exception();
            }
            accessRole = roleService.queryRole(RoleTypeEnum.GROUP_ACCESS_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(accessRole.getId())){
                throw new Exception();
            }
        }else if(resource.getResourceType() == ResourceTypeEnum.Stat){
            manageRole = roleService.queryRole(RoleTypeEnum.STAT_MANAGE_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(manageRole.getId())){
                throw new Exception();
            }
            accessRole = roleService.queryRole(RoleTypeEnum.STAT_ACCESS_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(accessRole.getId())){
                throw new Exception();
            }
        }else if(resource.getResourceType() == ResourceTypeEnum.Metric){
            manageRole = roleService.queryRole(RoleTypeEnum.METRIC_MANAGE_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(manageRole.getId())){
                throw new Exception();
            }
            accessRole = roleService.queryRole(RoleTypeEnum.METRIC_ACCESS_PERMISSION,resource.getResourceId());
            if(roleService.isChildRoleExist(accessRole.getId())){
                throw new Exception();
            }
        }
        Validate.notNull(manageRole);
        Validate.notNull(accessRole);
        roleService.deleteById(manageRole.getId());
        roleService.deleteById(accessRole.getId());
    }
}
