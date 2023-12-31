package com.dtstep.lighthouse.insights.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

import java.util.stream.Stream;

public enum OrderStateEnum {

    PROCESSING(0),

    APPROVED(1),

    REJECTED(2),

    RETRACTED(3),

    ;

    @JsonValue
    private Integer state;

    OrderStateEnum(int state){
        this.state = state;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @JsonCreator
    public static OrderStateEnum forValue(int state){
        OrderStateEnum[] values = OrderStateEnum.values();
        return Stream.of(values).filter(it -> it.getState() == state).findAny().orElse(null);
    }
}
