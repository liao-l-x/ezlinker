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
@RequestMapping("/monitor/network")
public class NetworkMonitorController extends XController {
    public NetworkMonitorController(HttpServletRequest httpServletRequest) {
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


    @GetMapping("/currentState")
    public R currentNetworkState() {
        if (isLinux() || isMacOS()) {
            return data(OSMonitor.getNetworkState());
        }
        return data(0);
    }

    /**
     * 网卡24小时数据
     *
     * @return
     */
    @GetMapping("/running24h")
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
