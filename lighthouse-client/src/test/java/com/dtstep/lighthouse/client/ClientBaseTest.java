package com.dtstep.lighthouse.client;

public class ClientBaseTest {

    static {
        try{
            LightHouse.init("10.206.6.20:4061,10.206.6.25:4061");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
