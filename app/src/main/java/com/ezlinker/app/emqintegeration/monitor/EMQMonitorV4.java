package com.ezlinker.app.emqintegeration.monitor;

import cn.hutool.http.HttpRequest;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ezlinker.app.common.exception.BizException;
import com.ezlinker.app.modules.systemconfig.model.EmqxConfig;

public class EMQMonitorV4 {
    /**
     * 获取节点基本信息¶
     * API 定义:
     * <p>
     * GET api/v4/brokers/${node}
     * 请求示例:
     * <p>
     * GET api/v4/brokers/emqx@127.0.0.1
     * 返回数据:
     * <p>
     * {
     * "code": 0,
     * "data": {
     * "datetime": "2019-12-18 10:57:40",
     * "node_status": "Running",
     * "otp_release": "R21/10.3.2",
     * "sysdescr": "EMQ X Broker",
     * "uptime": "7 minutes, 16 seconds",
     * "version": "v4.0.0"
     * }
     * }
     *  http(s)://host:8081/api/v4/
     * @return
     */
    public static JSONObject getBrokersInfo(EmqxConfig emqxConfig) throws BizException {
        try {
            String body = HttpRequest.get("http://" + emqxConfig.getIp() + ":" + emqxConfig.getPort() + "/api/v4/brokers/" + emqxConfig.getNodeName())
                    .basicAuth(emqxConfig.getAppId(), emqxConfig.getSecret())
                    .execute()
                    .body();
            if (body != null) {
                JSONObject data = JSON.parseObject(body);
                if (data.getIntValue("state") == 0) {
                    return data.getJSONObject("data");
                }
            }

        } catch (Exception e) {
            throw new BizException("EMQX节点:" + emqxConfig.getNodeName() + " 连接失败!", "Node:" + emqxConfig.getNodeName() + " connect failure!");

        }
        throw new BizException("EMQX节点:" + emqxConfig.getNodeName() + " 连接失败!", "Node:" + emqxConfig.getNodeName() + " connect failure!");

    }

}
