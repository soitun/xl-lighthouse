package com.dtstep.lighthouse.core.test.result;

import com.dtstep.lighthouse.common.entity.stat.StatExtEntity;
import com.dtstep.lighthouse.common.entity.view.StatValue;
import com.dtstep.lighthouse.common.util.DateUtil;
import com.dtstep.lighthouse.common.util.JsonUtil;
import com.dtstep.lighthouse.core.batch.BatchAdapter;
import com.dtstep.lighthouse.core.storage.common.IndicatorGet;
import com.dtstep.lighthouse.core.storage.result.impl.DefaultResultStorageHandler;
import com.dtstep.lighthouse.core.test.CoreBaseTest;
import com.dtstep.lighthouse.core.wrapper.StatDBWrapper;
import org.apache.spark.sql.sources.In;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResultStorageHandler extends CoreBaseTest {

    @Test
    public void testDataQuery() throws Exception {
        int statId = 1011;
        StatExtEntity statExtEntity = StatDBWrapper.queryById(statId);
        DefaultResultStorageHandler resultStorageHandler = new DefaultResultStorageHandler();
        long startTime = DateUtil.getDayStartTime(System.currentTimeMillis());
        long endTime = DateUtil.getDayEndTime(System.currentTimeMillis());
        List<Long> batchList = BatchAdapter.queryBatchTimeList(statExtEntity.getTimeparam(), startTime, endTime);
        Map<String,List<StatValue>> result = resultStorageHandler.queryWithDimensList(statExtEntity,null,batchList);
        System.out.println("result:" + JsonUtil.toJSONString(result));
    }

    @Test
    public void testDataQuery1() throws Exception {
        System.out.println("---Test");
        IndicatorGet indicatorGet = new IndicatorGet();
        indicatorGet.setIndicatorIndex(1);
        indicatorGet.setStatId(1100619);
        indicatorGet.setDimensValue("23");
        long batchTime = DateUtil.getCurrentHourTime(System.currentTimeMillis());
        indicatorGet.setBatchTime(batchTime);
        DefaultResultStorageHandler resultStorageHandler = new DefaultResultStorageHandler();
        HashMap<IndicatorGet,Object> result = resultStorageHandler.query(List.of(indicatorGet));
        System.out.println("result is:" + JsonUtil.toJSONString(result));
    }
}
