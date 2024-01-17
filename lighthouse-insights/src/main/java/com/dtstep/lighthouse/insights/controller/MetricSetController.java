package com.dtstep.lighthouse.insights.controller;

import com.dtstep.lighthouse.common.util.JsonUtil;
import com.dtstep.lighthouse.commonv2.insights.ListData;
import com.dtstep.lighthouse.commonv2.insights.ResultCode;
import com.dtstep.lighthouse.insights.dto_bak.*;
import com.dtstep.lighthouse.insights.enums.RelationTypeEnum;
import com.dtstep.lighthouse.insights.modal.MetricSet;
import com.dtstep.lighthouse.insights.service.MetricSetService;
import com.dtstep.lighthouse.insights.service.RelationService;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@ControllerAdvice
public class MetricSetController {

    @Autowired
    private MetricSetService metricSetService;

    @Autowired
    private RelationService relationService;

    @RequestMapping("/metricset/create")
    public ResultData<Integer> create(@Validated @RequestBody MetricSetCreateParam createParam) {
        System.out.println("createParam is:" + JsonUtil.toJSONString(createParam));
        MetricSet metricSet = new MetricSet();
        metricSet.setDesc(createParam.getDesc());
        metricSet.setTitle(createParam.getTitle());
        metricSet.setPrivateType(createParam.getPrivateType());
        int id = metricSetService.create(metricSet);
        if(id > 0){
            metricSetService.grantAccessPermissions(id, createParam.getInitUsersPermission(),createParam.getInitDepartmentsPermission());
            return ResultData.success(id);
        }else{
            return ResultData.result(ResultCode.systemError);
        }
    }

    @RequestMapping("/metricset/update")
    public ResultData<Integer> update(@Validated @RequestBody MetricSetUpdateParam updateParam) {
        Integer id = updateParam.getId();
        MetricSet metricSet = metricSetService.queryById(id);
        Validate.notNull(metricSet);
        metricSet.setDesc(updateParam.getDesc());
        metricSet.setTitle(updateParam.getTitle());
        metricSet.setId(updateParam.getId());
        metricSet.setPrivateType(updateParam.getPrivateType());
        int result = metricSetService.update(metricSet);
        if(result > 0){
            return ResultData.success(result);
        }else{
            return ResultData.result(ResultCode.systemError);
        }
    }

    @RequestMapping("/metricset/queryById")
    public ResultData<MetricSet> queryById(@Validated @RequestBody IDParam idParam) throws Exception{
        Integer id = idParam.getId();
        MetricSetDto metricSet = metricSetService.queryById(id);
        List<TreeNode> structure = metricSetService.getStructure(metricSet);
        System.out.println("metricSet structure:" + JsonUtil.toJSONString(structure));
        metricSet.setStructure(structure);
        return ResultData.success(metricSet);
    }

    @RequestMapping("/metricset/binded")
    public ResultData<MetricSet> binded(@Validated @RequestBody MetricBindParam bindParam) {
        System.out.println("metricSet:" + JsonUtil.toJSONString(bindParam));
        int result = metricSetService.binded(bindParam);
        return ResultData.success();
    }

    @RequestMapping("/metricset/bindlist")
    public ResultData<List<RelationDto>> bindedList(@Validated @RequestBody IDParam idParam) {
        Integer id = idParam.getId();
        List<RelationDto> relationDtos = relationService.queryList(id, RelationTypeEnum.MetricSetBindRelation);
        System.out.println("relationDtos is:" + JsonUtil.toJSONString(relationDtos));
        return ResultData.success(relationDtos);
    }


    @RequestMapping("/metricset/list")
    public ResultData<ListData<MetricSet>> list(@Validated @RequestBody ListSearchObject<MetricSetQueryParam> searchObject) {
        MetricSetQueryParam queryParam = searchObject.getQueryParams();
        Pagination pagination = searchObject.getPagination();
        ListData<MetricSet> listData = metricSetService.queryList(queryParam, pagination.getPageNum(), pagination.getPageSize());
        return ResultData.success(listData);
    }

}
