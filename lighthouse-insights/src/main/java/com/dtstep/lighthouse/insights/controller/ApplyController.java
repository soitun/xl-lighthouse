package com.dtstep.lighthouse.insights.controller;

import com.dtstep.lighthouse.common.modal.ListSearchObject;
import com.dtstep.lighthouse.common.modal.Pagination;
import com.dtstep.lighthouse.insights.vo.ResultData;
import com.dtstep.lighthouse.common.entity.ListData;
import com.dtstep.lighthouse.common.entity.ResultCode;
import com.dtstep.lighthouse.insights.dto.ApplyOrderQueryParam;
import com.dtstep.lighthouse.insights.dto.OrderCreateParam;
import com.dtstep.lighthouse.common.modal.User;
import com.dtstep.lighthouse.insights.service.BaseService;
import com.dtstep.lighthouse.insights.service.OrderService;
import com.dtstep.lighthouse.insights.service.UserService;
import com.dtstep.lighthouse.insights.vo.OrderVO;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ControllerAdvice
public class ApplyController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private BaseService baseService;

    @RequestMapping("/apply/create")
    public ResultData<Integer> create(@Validated @RequestBody OrderCreateParam createParam) throws Exception {
        int currentUserId = baseService.getCurrentUserId();
        Validate.isTrue(currentUserId == createParam.getUserId());
        User user = userService.queryById(currentUserId);
        ResultCode resultCode = orderService.submit(user,createParam.getOrderType(),createParam.getReason(),createParam.getExtendConfig());
        return ResultData.result(resultCode);
    }

    @RequestMapping("/apply/list")
    public ResultData<ListData<OrderVO>> list(@Validated @RequestBody ListSearchObject<ApplyOrderQueryParam> searchObject) {
        ApplyOrderQueryParam queryParam = searchObject.getQueryParamOrDefault(new ApplyOrderQueryParam());
        Pagination pagination = searchObject.getPagination();
        ListData<OrderVO> listData = orderService.queryApplyList(queryParam, pagination.getPageNum(), pagination.getPageSize());
        return ResultData.success(listData);
    }
}
