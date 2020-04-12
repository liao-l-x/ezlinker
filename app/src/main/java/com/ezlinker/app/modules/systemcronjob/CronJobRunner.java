package com.ezlinker.app.modules.systemcronjob;

import com.ezlinker.app.common.utils.SystemPropertiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 系统的定时任务策略
 */
@Component
public class CronJobRunner {
    private static Logger logger = LoggerFactory.getLogger(CronJobRunner.class);
    @Resource
    MongoTemplate mongoTemplate;

    /**
     * 定时在数据库插入系统内存状态
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void cronRunningData() {
        logger.info("Start cron system running data");
        Map<String, Object> running = SystemPropertiesUtil.getRunning();
        mongoTemplate.insert(running, LogTableName.SYSTEM_RUNNING_DATA);
        logger.info("Cron system running data finished");
    }

    /**
     * 定时清空日志记录
     */
    public void cronClearLog() {

    }

    /**
     * 这个接口记录一些数据库日志表名字常量
     */
    interface LogTableName {
        // 系统运行数据表
        String SYSTEM_RUNNING_DATA = "system_running_data";
        // 用户日志表
        String USER_LOGIN_LOG = "user_login_log";
        // 系统事件表
        String SYSTEM_EVENT_LOG = "system_event_log";
    }
}
