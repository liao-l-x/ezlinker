package com.ezlinker.app.modules.systemconfig.controller;


import com.alibaba.fastjson.JSONObject;
import com.ezlinker.app.common.exception.BizException;
import com.ezlinker.app.common.exception.XException;
import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.emqintegeration.bean.NodeInfo;
import com.ezlinker.app.emqintegeration.monitor.EMQMonitorV4;
import com.ezlinker.app.modules.systemconfig.model.EmqxConfig;
import com.ezlinker.app.modules.systemconfig.service.IEmqxConfigService;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * EMQX配置表 ,用来管理EMQX
 * </p>
 *
 * @author wangwenhai
 * @since 2020-03-06
 */
@RestController
@RequestMapping("/systemConfig/emqxConfig")
public class EmqxConfigController extends CurdController<EmqxConfig> {

    @Resource
    IEmqxConfigService iEmqxConfigService;

    @Resource
    MongoTemplate mongoTemplate;

    public EmqxConfigController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }

    /**
     * 查询节点信息
     *
     * @param id
     * @return
     * @throws XException
     */
    @Override
    @GetMapping(value = "/{id}")
    protected R get(@PathVariable Long id) throws XException {
        EmqxConfig emqxConfig = iEmqxConfigService.getById(id);
        if (emqxConfig == null) {
            throw new BizException("节点不存在,请配置节点", "Node not exists,please configure node");
        }
        try {
            JSONObject data = EMQMonitorV4.getBrokersInfo(emqxConfig);
            // 如果是离线 就更新为在线
            if (data != null) {
                if (emqxConfig.getState() == EmqxConfig.OFFLINE) {
                    emqxConfig.setState(EmqxConfig.ONLINE);
                    iEmqxConfigService.updateById(emqxConfig);
                }
                return data(data);
            } else {
                throw new BizException("节点信息获取失败,请检查节点", "Node not connect,please check node");

            }

        } catch (Exception e) {
            //如果是在线 就更新为离线
            if (emqxConfig.getState() == EmqxConfig.ONLINE) {
                emqxConfig.setState(EmqxConfig.OFFLINE);
                iEmqxConfigService.updateById(emqxConfig);
            }
            throw new BizException("节点信息获取失败,请检查节点", "Node not connect,please check node");

        }

    }

    /**
     * 获取所有的EMQX配置
     * 这个接口采取HTTP轮训的形式 5秒请求一次
     *
     * @return
     */
    @GetMapping("/all")
    protected R all() {
        List<EmqxConfig> emqxConfigList = iEmqxConfigService.list();
        for (EmqxConfig config : emqxConfigList) {
            Query query = new Query();
            Criteria criteria = Criteria.where("node").is(config.getNodeName());
            query.addCriteria(criteria);
            query.with(Sort.by(Sort.Direction.DESC, "_id"));
            List<NodeInfo> dataList = mongoTemplate.find(query, NodeInfo.class, "emqx_running_log_" + config.getNodeName());
            /**
             *  "runningState": {
             *      "load1": "0.52",
             *      "load5": "0.58",
             *      "load15": "0.59"
             *      "process_available": 2097152,
             *      "process_used": 446,
             *      "memory_total": 172707840,
             *      "memory_used": 112341880,
             *      "createTime":
             *  }
             */
            HashMap<String, Object> historyRunningState = new HashMap<>();
            //
            List<Float> load1 = new ArrayList<>();
            List<Float> load5 = new ArrayList<>();
            List<Float> load15 = new ArrayList<>();
            List<Float> processAvailable = new ArrayList<>();
            List<Float> processUsed = new ArrayList<>();
            List<Float> memoryTotal = new ArrayList<>();
            List<Float> memoryUsed = new ArrayList<>();
            List<Object> createTime = new ArrayList<>();
            //
            for (NodeInfo info : dataList) {
                load1.add(info.getLoad1());
                load5.add(info.getLoad5());
                load15.add(info.getLoad15());
                processAvailable.add(info.getProcess_available());
                processUsed.add(info.getProcess_used());
                memoryTotal.add(info.getMemory_total());
                memoryUsed.add(info.getMemory_used());
                createTime.add(info.getCreateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            }
            historyRunningState.put("load1", load1);
            historyRunningState.put("load5", load5);
            historyRunningState.put("load15", load15);
            historyRunningState.put("processAvailable", processAvailable);
            historyRunningState.put("processUsed", processUsed);
            historyRunningState.put("memoryTotal", memoryTotal);
            historyRunningState.put("memoryUsed", memoryUsed);
            historyRunningState.put("createTime", createTime);
            //
            List<Object> currentRunningState = new ArrayList<>();
            JSONObject currentNodeInfo;
            try {
                currentNodeInfo = EMQMonitorV4.getNodeInfo(config);
                // 如果是离线 就更新为在线
                if (currentNodeInfo != null) {
                    currentRunningState.add(currentNodeInfo.getFloat("load1"));
                    currentRunningState.add(currentNodeInfo.getFloat("load5"));
                    currentRunningState.add(currentNodeInfo.getFloat("load15"));
                    currentRunningState.add(currentNodeInfo.getFloat("process_available"));
                    currentRunningState.add(currentNodeInfo.getFloat("process_used"));
                    currentRunningState.add(currentNodeInfo.getFloat("memory_total"));
                    currentRunningState.add(currentNodeInfo.getFloat("memory_used"));
                    currentRunningState.add(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
                }
                config.setCurrentRunningState(currentRunningState);

            } catch (Exception e) {
                config.setCurrentRunningState(null);

            }
            //
            config.setHistoryRunningState(historyRunningState);


        }
        return data(emqxConfigList);
    }


    /**
     * 添加节点配置
     *
     * @param emqxConfig
     * @return
     */
    @Override
    @PostMapping
    protected R add(@RequestBody @Valid EmqxConfig emqxConfig) {
        boolean ok = iEmqxConfigService.save(emqxConfig);
        return ok ? success() : fail();
    }

    /**
     * 更新节点配置
     *
     * @param id
     * @param emqxConfig
     * @return
     * @throws XException
     */
    @Override
    @PutMapping(value = "/{id}")
    protected R update(@PathVariable Long id, @RequestBody @Valid EmqxConfig emqxConfig) throws XException {
        EmqxConfig oldConfig = iEmqxConfigService.getById(id);
        if (oldConfig == null) {
            throw new BizException("更新失败,请目标节点不存在", "Node not exists,please check node");
        }

        iEmqxConfigService.updateById(emqxConfig);
        return success();
    }

    /**
     * 删除
     *
     * @param ids
     * @return
     * @throws XException
     */
    @Override
    @DeleteMapping("/")
    protected R delete(@RequestBody Integer[] ids) throws XException {
        boolean ok = iEmqxConfigService.removeByIds(Arrays.asList(ids));
        return ok ? success() : fail();
    }
}

