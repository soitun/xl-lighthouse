package com.dtstep.lighthouse.insights.service.impl;

import com.dtstep.lighthouse.insights.dao.RelationDao;
import com.dtstep.lighthouse.insights.modal.Relation;
import com.dtstep.lighthouse.insights.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    private RelationDao relationDao;

    @Override
    public int batchCreate(List<Relation> relationList) {
        return relationDao.batchCreate(relationList);
    }
}
