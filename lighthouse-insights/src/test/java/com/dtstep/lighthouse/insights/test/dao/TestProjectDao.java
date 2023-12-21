package com.dtstep.lighthouse.insights.test.dao;

import com.dtstep.lighthouse.insights.LightHouseInsightsApplication;
import com.dtstep.lighthouse.insights.dao.ProjectDao;
import com.dtstep.lighthouse.insights.modal.Project;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = LightHouseInsightsApplication.class,properties = {"spring.config.location=classpath:lighthouse-insights.yml"})
public class TestProjectDao {

    @Autowired
    private ProjectDao projectDao;

    @Test
    public void testCreateProject() throws Exception {
        Project project = new Project();
        project.setTitle("title");
        project.setDepartmentId(1);
        project.setPrivateType(1);
        project.setDesc("desc");
        project.setCreateTime(new Date());
        project.setUpdateTime(new Date());
        projectDao.insert(project);
    }

}