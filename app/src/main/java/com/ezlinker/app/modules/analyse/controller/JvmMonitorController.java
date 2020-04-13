package com.ezlinker.app.modules.analyse.controller;

import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.utils.OSMonitor;
import com.ezlinker.app.common.web.XController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/monitor/jvm")
public class JvmMonitorController extends XController {
    public JvmMonitorController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }

    /**
     * 当前运行参数
     *
     * @return
     */
    @GetMapping("/currentState")
    public R running() {
        return data(OSMonitor.getJvmRunningState());
    }

    /**
     * 24小时的数据
     *
     * @return
     */
    @GetMapping("/running24h")
    public R jvmRunning24h() {
        // 时间轴
        List<String> timeList = new ArrayList<>();

        List<Double> vmUse = new ArrayList<>();

        List<Double> vmMax = new ArrayList<>();
        List<Double> vmFree = new ArrayList<>();
        List<Double> vmTotal = new ArrayList<>();

        //
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("time", timeList);
        result.put("jvmUse", vmUse);
        result.put("jvmMax", vmMax);
        result.put("jvmFree", vmFree);
        result.put("jvmTotal", vmTotal);
        return data(result);
    }

}
