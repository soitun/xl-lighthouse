package com.dtstep.lighthouse.ice.servant.rpc.ice;

import com.dtstep.lighthouse.common.entity.group.GroupVerifyEntity;
import com.dtstep.lighthouse.common.ice.RemoteLightServer;
import com.dtstep.lighthouse.common.util.JsonUtil;
import com.dtstep.lighthouse.ice.servant.logic.RPCServer;
import com.dtstep.lighthouse.ice.servant.logic.impl.RPCServerImpl;
import com.zeroc.Ice.Current;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ICERemoteLightServerImpl implements RemoteLightServer {

    private static final Logger logger = LoggerFactory.getLogger(ICERemoteLightServerImpl.class);

    private static final RPCServer rpc = new RPCServerImpl();

    @Override
    public String process(byte[] message, Current current){
        try{
            rpc.process(message);
        }catch (Exception ex){
            logger.error("process message error!",ex);
            return "System Error!";
        }
        return "Success!";
    }

    @Override
    public String queryGroupInfo(String token, Current current){
        GroupVerifyEntity groupVerifyEntity;
        try{
            groupVerifyEntity = rpc.queryGroup(token);
        }catch (Exception ex){
            logger.error("query group info error!",ex);
            return "System Error!";
        }
        return JsonUtil.toJSONString(groupVerifyEntity);
    }
}
