package com.dtstep.lighthouse.insights.dao;

import com.dtstep.lighthouse.common.modal.AlarmTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlarmTemplateDao {

    int insert(AlarmTemplate caller);

    int update(AlarmTemplate caller);

    int deleteById(Integer id);

    AlarmTemplate queryById(Integer id);

    List<AlarmTemplate> queryByUserId(Integer userId);

    int countByUserId(Integer userId);
}
