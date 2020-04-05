package com.ezlinker.app;

import com.ezlinker.app.modules.dataentry.model.DeviceData;
import com.ezlinker.app.modules.dataentry.service.DeviceDataService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@SpringBootTest

public class DataTest {
    @Resource
    DeviceDataService deviceDataService;

    @Test
    public void addData() {

        for (int i = 0; i < 1005; i++) {
            DeviceData deviceData = new DeviceData();
            deviceData.setDeviceId(3L);
            deviceData.setCreateTime(new Date());
            Map<String, Object> data = new HashMap<>();
            data.put("数值", new Random().nextDouble());
            data.put("备注", new Random().nextFloat());
            deviceData.setData(data);
            deviceDataService.save(1L, 3L, deviceData);

        }


    }
}
