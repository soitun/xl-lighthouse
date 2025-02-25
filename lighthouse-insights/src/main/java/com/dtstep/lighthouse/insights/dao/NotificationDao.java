package com.dtstep.lighthouse.insights.dao;

import com.dtstep.lighthouse.common.modal.Notification;
import com.dtstep.lighthouse.insights.dto.NotificationQueryParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationDao {

    int insert(Notification notification);

    List<Notification> queryList(@Param("queryParam")NotificationQueryParam queryParam);
}
