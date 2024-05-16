package com.dtstep.lighthouse.core.test.stat;

import com.dtstep.lighthouse.client.LightHouse;
import com.dtstep.lighthouse.common.enums.RunningMode;
import org.junit.Test;

import java.util.HashMap;

public class TestClient {

    static {
        try{
            //修改rpc服务地址,一主一从，默认为部署集群的前两个节点
            LightHouse.init("127.0.0.1:4061", RunningMode.STANDALONE);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    @Test
    public void testStandalone() throws Exception{
        System.out.println("init standalone.");
        String token = "Gjd:feed_behavior_stat";
        System.out.println("ok.");
        for(int i = 0;i<1000;i++){
            HashMap<String,Object> paramMap = new HashMap<>();
            paramMap.put("province","p1");
            paramMap.put("city","c1");
            LightHouse.stat(token,"9oyIXK9XQEiysrMBCoAvTq2pyPjMlTjznmPVXWCe",paramMap,System.currentTimeMillis());
        }
        Thread.sleep(500000);
    }
}