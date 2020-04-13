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

/**
 * 统计操作系统 硬件信息
 */
@RestController
@RequestMapping("/monitor/os")
public class OSMonitorController extends XController {
    public OSMonitorController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }

    private static boolean isWindows() {
        return System.getProperty("os.name").toLowerCase().contains("windows");
    }

    private static boolean isLinux() {
        return System.getProperty("os.name").toLowerCase().contains("linux");
    }

    public static boolean isMacOS() {
        String os = System.getProperty("os.name").toLowerCase();
        return os.contains("mac") && os.indexOf("os") > 0 && !os.contains("x");
    }

    /**
     * 当前运行参数
     *
     * @return
     */
    @GetMapping("/currentJvmRunningState")
    public R running() {
        return data(OSMonitor.getJvmRunningState());
    }

    @GetMapping("/currentOSRunningState")
    public R currentOSRunningState() {
        return data(OSMonitor.getOSInfo());
    }

    @GetMapping("/currentNetworkState")
    public R currentNetworkState() {
        if (isLinux() || isMacOS()) {
            return data(OSMonitor.getNetworkState());
        }
        return data(0);
    }


    @GetMapping("/osRunning24h")
    public R osRunning24h() {
        // 时间轴
        List<String> timeList = new ArrayList<>();
        // 数据轴
        List<Double> physicalFree = new ArrayList<>();
        List<Double> physicalTotal = new ArrayList<>();
        List<Double> physicalUse = new ArrayList<>();
        //
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("time", timeList);
        result.put("physicalFree", physicalFree);
        result.put("physicalTotal", physicalTotal);
        result.put("physicalUse", physicalUse);
        return data(result);
    }

    /**
     * 24小时的数据
     *
     * @return
     */
    @GetMapping("/jvmRunning24h")
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

    /**
     * 网卡24小时数据
     *
     * @return
     */
    @GetMapping("/networkRunning24h")
    public R networkRunning24h() {
        List<String> timeList = new ArrayList<>();
        Map<String, Object> result = new LinkedHashMap<>();

        List<Double> netWorkIn = new ArrayList<>();
        List<Double> netWorkOut = new ArrayList<>();
        result.put("time", timeList);
        result.put("netWorkIn", netWorkIn);
        result.put("netWorkOut", netWorkOut);
        return data(result);

    }
}
