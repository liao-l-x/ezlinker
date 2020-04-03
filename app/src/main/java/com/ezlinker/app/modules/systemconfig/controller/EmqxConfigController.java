package com.ezlinker.app.modules.systemconfig.controller;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ezlinker.app.common.exception.BizException;
import com.ezlinker.app.common.exception.XException;
import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.emqintegeration.monitor.EMQMonitorV4;
import com.ezlinker.app.modules.systemconfig.model.EmqxConfig;
import com.ezlinker.app.modules.systemconfig.service.IEmqxConfigService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Arrays;

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
     *
     * @param current
     * @param size
     * @return
     */
    @Override
    @GetMapping("/list")
    protected R list(@RequestParam Integer current, @RequestParam Integer size) {
        return data(iEmqxConfigService.page(new Page<>(current, size)));
    }


    /**
     * 添加节点配置
     * @param emqxConfig
     * @return
     * @throws XException
     */
    @Override
    @PostMapping
    protected R add(@RequestBody @Valid EmqxConfig emqxConfig) throws XException {
        boolean ok = iEmqxConfigService.save(emqxConfig);
        return ok ? success() : fail();
    }

    /**
     * 更新节点配置
     * @param id
     * @param emqxConfig
     * @return
     * @throws XException
     */
    @Override
    @PutMapping(value = "/{id}")
    protected R update(@PathVariable Long id, @RequestBody @Valid EmqxConfig emqxConfig) throws XException {
        EmqxConfig oldConfig = iEmqxConfigService.getById(id);
        if (oldConfig==null){
            throw new BizException("更新失败,请目标节点不存在", "Node not exists,please check node");
        }

        iEmqxConfigService.updateById(emqxConfig);
        return success();
    }

//    @Override
//    @GetMapping("/query")
//    protected R query(@RequestParam Integer current, Integer size, String... args) {
//
//
//    }

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

