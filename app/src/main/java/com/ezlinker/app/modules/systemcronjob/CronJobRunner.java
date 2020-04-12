package com.ezlinker.app.modules.systemcronjob;

import com.alibaba.fastjson.JSONObject;
import com.ezlinker.app.common.exception.BizException;
import com.ezlinker.app.common.utils.SystemPropertiesUtil;
import com.ezlinker.app.emqintegeration.monitor.EMQMonitorV4;
import com.ezlinker.app.modules.systemconfig.model.EmqxConfig;
import com.ezlinker.app.modules.systemconfig.service.IEmqxConfigService;
import com.ezlinker.app.modules.systemlog.model.SystemLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 系统的定时任务策略
 */
@Component
public class CronJobRunner {
    private static Logger logger = LoggerFactory.getLogger(CronJobRunner.class);
    @Resource
    MongoTemplate mongoTemplate;
    @Resource
    IEmqxConfigService iEmqxConfigService;

    /**
     * 定时在数据库插入系统内存状态
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void cronServerRunningData() {
        logger.info("Start cron system running data");
        Map<String, Object> running = SystemPropertiesUtil.getRunning();
        mongoTemplate.insert(running, LogTableName.SYSTEM_RUNNING_LOG);
        logger.info("Cron system running data finished");
    }

    /**
     * 数据库定时插入EMQ节点的运行数据
     * 目前是每个节点每一分钟一条
     */

    @Scheduled(cron = "0 0/1 * * * ?")
    @Async

    public void cronEmqNodeRunningData() {
        logger.info("Start cron EMQX node running data");
        List<EmqxConfig> emqxConfigList = iEmqxConfigService.list();
        for (EmqxConfig config : emqxConfigList) {
            JSONObject runningState;
            try {
                runningState = EMQMonitorV4.getNodeInfo(config);
                if (runningState != null) {
                    runningState.put("createTime", LocalDateTime.now());
                    mongoTemplate.insert(runningState, LogTableName.EMQX_RUNNING_LOG + "_" + config.getNodeName());
                }
            } catch (BizException e) {
                SystemLog systemLog = new SystemLog();
                systemLog.setType(SystemLog.SystemLogType.error);
                systemLog.setWho(CronJobRunner.class.getCanonicalName());
                systemLog.setMessage(e.getMessage());
                systemLog.setCreateTime(LocalDateTime.now());
                mongoTemplate.insert(systemLog, LogTableName.SYSTEM_EVENT_LOG);
            }

        }
        logger.info("Cron EMQX node running data finished");
    }

    /**
     * 定时清空日志记录
     * 0 0 0 1/7 * ?
     * 每周清理一次
     */

    @Scheduled(cron = "0 0 0 1/7 * ?")
    @Async
    public void cronClearLog() {
        logger.info("Start clear system log");
        mongoTemplate.dropCollection(LogTableName.EMQX_RUNNING_LOG);
        mongoTemplate.dropCollection(LogTableName.SYSTEM_EVENT_LOG);
        mongoTemplate.dropCollection(LogTableName.SYSTEM_RUNNING_LOG);
        logger.info("Clear system log finished");
    }

    /**
     * 这个接口记录一些数据库日志表名字常量
     */
    interface LogTableName {

        // 用户日志表
        String USER_LOGIN_LOG = "user_login_log";
        // 系统事件表
        String SYSTEM_EVENT_LOG = "system_event_log";
        // EMQX 节点运行日志表
        String EMQX_RUNNING_LOG = "emqx_running_log";
        // 系统所有异常日志
        String SYSTEM_RUNNING_LOG = "system_running_log";


    }


}
