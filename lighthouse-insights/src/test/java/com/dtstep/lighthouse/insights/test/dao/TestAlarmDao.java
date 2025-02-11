package com.dtstep.lighthouse.insights.test.dao;

import com.dtstep.lighthouse.common.enums.NumberCompareType;
import com.dtstep.lighthouse.common.modal.AlarmCondition;
import com.dtstep.lighthouse.common.modal.AlarmQueryParam;
import com.dtstep.lighthouse.common.util.JsonUtil;
import com.dtstep.lighthouse.insights.LightHouseInsightsApplication;
import com.dtstep.lighthouse.insights.dao.AlarmDao;
import com.dtstep.lighthouse.common.modal.Alarm;
import com.dtstep.lighthouse.insights.test.listener.SpringTestExecutionListener;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = LightHouseInsightsApplication.class,properties = {"spring.config.location=classpath:lighthouse-insights.yml"})
@TestExecutionListeners(listeners = SpringTestExecutionListener.class, mergeMode = TestExecutionListeners.MergeMode.MERGE_WITH_DEFAULTS)
public class TestAlarmDao {

    @Autowired
    private AlarmDao alarmDao;

    @Test
    public void testInsert() throws Exception {
        Alarm alarm = new Alarm();
        alarm.setDivide(false);
        alarm.setDelay(23);
        AlarmCondition alarmCondition = new AlarmCondition();
        alarmCondition.setCompare(NumberCompareType.EQ);
        alarmCondition.setIndicator(1);
        AlarmCondition.ThresholdConfig thresholdConfig = new AlarmCondition.ThresholdConfig();
        thresholdConfig.setThreshold(1.0d);
        thresholdConfig.setState(true);
        alarmCondition.setOverall(thresholdConfig);
        List<AlarmCondition> conditionList = new ArrayList<>();
        conditionList.add(alarmCondition);
        alarm.setConditions(conditionList);
        alarm.setCreateTime(LocalDateTime.now());
        alarm.setTitle("tttssss");
        alarm.setDesc("ssswewe");
        alarm.setTemplateId(111);
        alarmDao.insert(alarm);
    }

    @Test
    public void queryById() throws Exception {
        int id = 3;
        Alarm alarm = alarmDao.queryById(id);
        System.out.println("alarm is:" + JsonUtil.toJSONString(alarm));
    }

    @Test
    public void testUpdate() throws Exception {
        String s = "{\"id\":39,\"title\":\"asdagasg333\",\"uniqueCode\":\"default.gEXMbC\",\"divide\":false,\"resourceId\":1100617,\"resourceType\":6,\"state\":false,\"match\":1,\"conditions\":[{\"key\":\"Condition-uvFzV\",\"indicator\":0,\"last\":1,\"compare\":\"GE\",\"divide\":false,\"overall\":{\"threshold\":0,\"state\":true},\"p0\":{\"threshold\":0,\"state\":false},\"p1\":{\"threshold\":0,\"state\":false},\"p2\":{\"threshold\":0,\"state\":false},\"p3\":{\"threshold\":0,\"state\":false}}],\"templateId\":0,\"silent\":300,\"recover\":false,\"delay\":60,\"desc\":\"asdgag\",\"dimens\":\"asdasgd\",\"createTime\":1730978049000,\"updateTime\":1730978049000}";
        Alarm alarm = JsonUtil.toJavaObject(s,Alarm.class);
        alarm.setUpdateTime(LocalDateTime.now());
        System.out.println("alarm is:" + JsonUtil.toJSONString(alarm));
        alarmDao.update(alarm);
    }

    @Test
    public void testCountByParam() throws Exception {
        String uniqueCode = "default.j3L5L52";
        AlarmQueryParam queryParam = new AlarmQueryParam();
        queryParam.setUniqueCode(uniqueCode);
        int size = alarmDao.countByParam(queryParam);
        System.out.println("size:" + size);
    }

    @Test
    public void testQueryList() throws Exception {
        AlarmQueryParam queryParam = new AlarmQueryParam();
        queryParam.setUserId(110239);
        List<Alarm> alarmList = alarmDao.queryList(queryParam);
        for(Alarm alarm : alarmList){
            System.out.println("alarm is:" + JsonUtil.toJSONString(alarm));
        }
    }
}
