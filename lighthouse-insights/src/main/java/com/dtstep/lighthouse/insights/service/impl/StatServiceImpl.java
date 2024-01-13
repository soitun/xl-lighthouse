package com.dtstep.lighthouse.insights.service.impl;

import com.dtstep.lighthouse.common.entity.stat.TemplateEntity;
import com.dtstep.lighthouse.common.enums.stat.StatStateEnum;
import com.dtstep.lighthouse.common.util.JsonUtil;
import com.dtstep.lighthouse.commonv2.insights.ListData;
import com.dtstep.lighthouse.core.wrapper.DimensDBWrapper;
import com.dtstep.lighthouse.insights.controller.annotation.RecordAnnotation;
import com.dtstep.lighthouse.insights.dao.GroupDao;
import com.dtstep.lighthouse.insights.dao.ProjectDao;
import com.dtstep.lighthouse.insights.dao.StatDao;
import com.dtstep.lighthouse.insights.dto.PermissionInfo;
import com.dtstep.lighthouse.insights.dto.StatDto;
import com.dtstep.lighthouse.insights.dto.StatQueryParam;
import com.dtstep.lighthouse.insights.dto.TreeNode;
import com.dtstep.lighthouse.insights.enums.ComponentTypeEnum;
import com.dtstep.lighthouse.insights.enums.RecordTypeEnum;
import com.dtstep.lighthouse.insights.enums.ResourceTypeEnum;
import com.dtstep.lighthouse.insights.enums.RoleTypeEnum;
import com.dtstep.lighthouse.insights.modal.*;
import com.dtstep.lighthouse.insights.service.*;
import com.dtstep.lighthouse.insights.template.TemplateContext;
import com.dtstep.lighthouse.insights.template.TemplateParser;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatDao statDao;

    @Autowired
    private GroupDao groupDao;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private BaseService baseService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private ComponentService componentService;

    @Override
    public int create(Stat stat) {
        int groupId = stat.getGroupId();
        Group group = groupDao.queryById(groupId);
        String template = stat.getTemplate();
        String timeParam = stat.getTimeparam();
        try{
            TemplateEntity templateEntity = TemplateParser.parse(new TemplateContext(template,timeParam, group.getColumns()));
            stat.setTitle(templateEntity.getTitle());
        }catch (Exception ex){
            ex.printStackTrace();
        }
        LocalDateTime localDateTime = LocalDateTime.now();
        stat.setUpdateTime(localDateTime);
        stat.setCreateTime(localDateTime);
        stat.setState(StatStateEnum.RUNNING);
        stat.setRandomId(UUID.randomUUID().toString());
        statDao.insert(stat);
        int id = stat.getId();
        resourceService.addResourceCallback(Resource.newResource(ResourceTypeEnum.Stat,id,stat.getGroupId()));
        return id;
    }

    @Override
    @RecordAnnotation(recordType = RecordTypeEnum.UPDATE_STAT)
    public int update(Stat stat) {
        int groupId = stat.getGroupId();
        Group group = groupDao.queryById(groupId);
        String template = stat.getTemplate();
        String timeParam = stat.getTimeparam();
        try{
            TemplateEntity templateEntity = TemplateParser.parse(new TemplateContext(template,timeParam, group.getColumns()));
            stat.setTitle(templateEntity.getTitle());
        }catch (Exception ex){
            ex.printStackTrace();
        }
        LocalDateTime localDateTime = LocalDateTime.now();
        stat.setUpdateTime(localDateTime);
        int result = statDao.update(stat);
        resourceService.updateResourcePidCallback(Resource.newResource(ResourceTypeEnum.Stat,stat.getId(),stat.getGroupId()));
        return result;
    }


    @Override
    public int delete(Stat stat) {
        Integer id = stat.getId();
        return statDao.deleteById(id);
    }

    private StatDto translate(Stat stat){
        int userId = baseService.getCurrentUserId();
        StatDto statDto = new StatDto(stat);
        Group group = groupDao.queryById(stat.getGroupId());
        Project project = projectDao.queryById(stat.getProjectId());
        Role manageRole = roleService.queryRole(RoleTypeEnum.STAT_MANAGE_PERMISSION,stat.getId());
        Role accessRole = roleService.queryRole(RoleTypeEnum.STAT_ACCESS_PERMISSION,stat.getId());
        if(permissionService.checkUserPermission(userId, manageRole.getId())){
            statDto.addPermission(PermissionInfo.PermissionEnum.ManageAble);
        }else if(permissionService.checkUserPermission(userId,accessRole.getId())){
            statDto.addPermission(PermissionInfo.PermissionEnum.AccessAble);
        }
        List<User> admins = projectService.cacheQueryAdmins(project.getId());
        statDto.setAdmins(admins);
        statDto.setGroup(group);
        statDto.setProject(project);
        return statDto;
    }

    @Override
    public ListData<StatDto> queryList(StatQueryParam queryParam, Integer pageNum, Integer pageSize) {
        List<Stat> list = statDao.queryList(queryParam,pageNum,pageSize);
        List<StatDto> dtoList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(list)){
            for(Stat stat : list){
                StatDto statDto = translate(stat);
                dtoList.add(statDto);
            }
        }
        ListData<StatDto> listData = new ListData<>();
        listData.setList(dtoList);
        return listData;
    }


    @Override
    public StatDto queryById(Integer id) {
        Stat stat = statDao.queryById(id);
        String template = stat.getTemplate();
        String timeParam = stat.getTimeparam();
        Group group = groupDao.queryById(stat.getGroupId());
        List<Column> columnList = group.getColumns();
        try{
            TemplateEntity templateEntity = TemplateParser.parse(new TemplateContext(template,timeParam, columnList));
            stat.setTemplateEntity(templateEntity);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return translate(stat);
    }

    @Override
    public List<Stat> queryByProjectId(Integer projectId) {
        return statDao.queryByProjectId(projectId);
    }

    @Override
    public RenderConfig getStatRenderConfig(Stat stat) {
        RenderConfig renderConfig = stat.getRenderConfig();
        List<String> defaultDimensList = new ArrayList<>();
        HashMap<String,RenderFilterConfig> filtersConfigMap = new HashMap<>();
        if(renderConfig == null || CollectionUtils.isEmpty(renderConfig.getFilters())){
            TemplateEntity templateEntity = stat.getTemplateEntity();
            String[] dimensArray = templateEntity.getDimensArr();
            if(dimensArray != null){
                defaultDimensList = Arrays.asList(dimensArray);
            }
        }else{
            List<RenderFilterConfig> filterConfigs = renderConfig.getFilters();
            for(RenderFilterConfig filterConfig : filterConfigs){
                Integer componentId = filterConfig.getComponentId();
                ComponentTypeEnum componentTypeEnum = filterConfig.getComponentType();
                if(componentId != 0){
                    Component component = componentService.queryById(componentId);
                    RenderFilterConfig renderFilterConfig = new RenderFilterConfig();
                    renderFilterConfig.setComponentType(ComponentTypeEnum.FILTER_SELECT);
                    renderFilterConfig.setComponentId(componentId);
                    renderFilterConfig.setDimens(filterConfig.getDimens());
                    renderFilterConfig.setTitle(component.getTitle());
                    renderFilterConfig.setLabel(filterConfig.getLabel());
                    renderFilterConfig.setConfigData(component.getConfiguration());
                    filtersConfigMap.put(filterConfig.getDimens(),renderFilterConfig);
                }else{
                    defaultDimensList.add(filterConfig.getDimens());
                }
            }
        }
        for(String dimens : defaultDimensList){
            List<TreeNode> dimensValueList = new ArrayList<>();
            for(int i=0;i<3;i++){
                dimensValueList.add(new TreeNode("dimens_" + i,"dimens_" + i));
            }
            RenderFilterConfig renderFilterConfig = new RenderFilterConfig();
            renderFilterConfig.setComponentType(ComponentTypeEnum.FILTER_SELECT);
            renderFilterConfig.setComponentId(0);
            renderFilterConfig.setLabel(dimens);
            renderFilterConfig.setDimens(dimens);
            renderFilterConfig.setConfigData(dimensValueList);
            filtersConfigMap.put(dimens,renderFilterConfig);
        }
        List<RenderFilterConfig> configList = new ArrayList<>();
        for(String key : filtersConfigMap.keySet()){
            configList.add(filtersConfigMap.get(key));
        }
        if(renderConfig == null){
            renderConfig = new RenderConfig();
        }
        renderConfig.setFilters(configList);
        System.out.println("renderConfig is:" + JsonUtil.toJSONString(renderConfig));
        return renderConfig;
    }
}
