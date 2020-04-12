package com.ezlinker.app.modules.analyse.controller;

import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.utils.SystemPropertiesUtil;
import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.modules.device.service.IDeviceService;
import com.ezlinker.app.modules.product.service.IProductService;
import com.ezlinker.app.modules.project.service.IProjectService;
import com.ezlinker.app.modules.user.service.IUserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 数据统计
 *
 * @author wangwenhai
 */
@RestController
@RequestMapping("/analyse")
public class AnalyseController extends CurdController {
    public AnalyseController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }

    @Resource
    IProjectService iProjectService;

    @Resource
    IProductService iProductService;

    @Resource
    IUserService iUserService;
    @Resource
    IDeviceService iDeviceService;

    /**
     * 获取一些统计数据
     * TODO: 后期会加入更多统计数据
     *
     * @return
     */
    @GetMapping("/data")
    public R data() {
        Map<String, Object> data = new HashMap<>();
        data.put("projects", iProjectService.count());
        data.put("users", iUserService.count());
        data.put("products", iProductService.count());
        data.put("devices", iDeviceService.count());

        return data(data);
    }

    /**
     * 系统参数
     *
     * @return
     */
    @GetMapping("/properties")
    public R getSystemProperties() {
        return data(SystemPropertiesUtil.getSystemProperties());
    }


    /**
     * 运行参数
     *
     * @return
     */
    @GetMapping("/running")
    public R running() {
        return data(SystemPropertiesUtil.getRunning());
    }

    /**
     * 24小时的数据
     * 24*60*60条
     * {
     * "physicalFree": 13028,
     * "vmUse": 66,
     * "physicalTotal": 32699,
     * "physicalUse": 19671,
     * "vmMax": 8176,
     * "vmFree": 446,
     * "vmTotal": 512
     * }
     * <p>
     * {
     * time:[t1,t2,t3,.....],
     * value:{
     * vmMax: [111111111],
     * vmFree: [1111111111111111]
     * }
     * }
     * 24*60 = 1440
     *
     * @return
     */
    @GetMapping("/running24h")
    public R running24h() {
        // 时间轴
        List<String> timeList = new ArrayList<>();
        Map<String, Object> valueList = new HashMap<>();

        // 数据轴
        List<Double> physicalFree = new ArrayList<>();
        List<Double> vmUse = new ArrayList<>();
        List<Double> physicalTotal = new ArrayList<>();
        List<Double> physicalUse = new ArrayList<>();
        List<Double> vmMax = new ArrayList<>();
        List<Double> vmFree = new ArrayList<>();
        List<Double> vmTotal = new ArrayList<>();
        List<Double> netWorkIn = new ArrayList<>();
        List<Double> netWorkOut = new ArrayList<>();

        double lastValue = 0;
        for (double i = 0; i < 1440; i++) {
            double temp = lastValue + (Math.round(i * 100) / 100.0);
            physicalFree.add(temp);
            vmUse.add(temp);
            physicalTotal.add(temp);
            physicalUse.add(temp);
            vmMax.add(temp);
            vmFree.add(temp);
            vmTotal.add(temp);
            netWorkIn.add(temp);
            netWorkOut.add(temp);
            lastValue = temp;
            timeList.add(new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(new Date()));
        }
        //
        valueList.put("physicalFree", physicalFree);
        valueList.put("physicalTotal", physicalTotal);
        valueList.put("physicalUse", physicalUse);
        valueList.put("vmMax", vmMax);
        valueList.put("vmFree", vmFree);
        valueList.put("vmTotal", vmTotal);
        valueList.put("netWorkIn", netWorkIn);
        valueList.put("netWorkOut", netWorkOut);
        //
        Map<String, Object> result = new HashMap<>();
        result.put("time", timeList);
        result.put("values", valueList);
        return data(result);
    }


}
