package com.dtstep.lighthouse.common.modal;

import com.dtstep.lighthouse.common.enums.LimitingStrategyEnum;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.HashMap;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class GroupExtendConfig implements Serializable {

    private HashMap<LimitingStrategyEnum,Integer> limitingConfig = new HashMap<>();

    private DebugConfig debugConfig;

    public DebugConfig getDebugConfig() {
        return debugConfig;
    }

    public void setDebugConfig(DebugConfig debugConfig) {
        this.debugConfig = debugConfig;
    }

    public HashMap<LimitingStrategyEnum, Integer> getLimitingConfig() {
        return limitingConfig;
    }

    public void setLimitingConfig(HashMap<LimitingStrategyEnum, Integer> limitingConfig) {
        this.limitingConfig = limitingConfig;
    }
}
