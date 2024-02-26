package com.dtstep.lighthouse.insights.service;

import com.dtstep.lighthouse.common.modal.TreeNode;
import com.dtstep.lighthouse.common.entity.ListData;
import com.dtstep.lighthouse.common.entity.ResultCode;
import com.dtstep.lighthouse.insights.dto.PermissionGrantParam;
import com.dtstep.lighthouse.insights.dto.PermissionReleaseParam;
import com.dtstep.lighthouse.insights.dto.ProjectQueryParam;
import com.dtstep.lighthouse.common.modal.Project;
import com.dtstep.lighthouse.insights.vo.ProjectVO;
import com.dtstep.lighthouse.insights.vo.ServiceResult;

import java.util.List;

public interface ProjectService {

    ServiceResult<Integer> create(Project project);

    int update(Project project);

    ProjectVO queryById(Integer id);

    ServiceResult<Integer> deleteById(Integer id);

    ProjectVO cacheQueryById(Integer id);

    TreeNode getStructure(Project project) throws Exception;

    ListData<ProjectVO> queryList(ProjectQueryParam queryParam, Integer pageNum, Integer pageSize);

    List<ProjectVO> queryByIds(List<Integer> ids);

    int count(ProjectQueryParam queryParam);

    ResultCode batchGrantPermissions(PermissionGrantParam grantParam) throws Exception;

    ResultCode releasePermission(PermissionReleaseParam releaseParam) throws Exception;

    ResultCode star(Project project);

    ResultCode unStar(Project project);

    List<ProjectVO> queryStarList();
}
