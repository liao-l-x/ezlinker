package com.ezlinker.app.modules.module.controller;


import com.ezlinker.app.common.exception.BizException;
import com.ezlinker.app.common.exception.XException;
import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.modules.module.model.Module;
import com.ezlinker.app.modules.module.service.IModuleService;
import com.ezlinker.app.modules.module.service.ModuleDataService;
import com.ezlinker.app.modules.module.service.ModuleLogService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 设备上面的模块，和设备是多对一关系
 * </p>
 *
 * @author wangwenhai
 * @since 2020-02-23
 */
@RestController
@RequestMapping("/modules")
public class ModuleController extends CurdController<Module> {
    @Resource
    ModuleLogService moduleLogService;

    @Resource
    IModuleService iModuleService;

    @Resource
    ModuleDataService moduleDataService;

    public ModuleController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }



    /**
     * 获取当前支持的设备的类型
     * 设备类型用来处理UI上显示效果
     * 0 自定义类型
     * 1 按钮
     * 2 按钮组
     * 3 开关
     * 4 开关组
     * 5 进度条
     * 6 图表
     *
     * @return
     */
    @GetMapping("/types")
    public R getType() {
        HashMap<String, Object> data0 = new HashMap<>();
        data0.put("label", "自定义");
        data0.put("value", 0);

        HashMap<String, Object> data1 = new HashMap<>();
        data1.put("label", "按钮");
        data1.put("value", 1);

        HashMap<String, Object> data2 = new HashMap<>();
        data2.put("label", "按钮组");
        data2.put("value", 2);

        HashMap<String, Object> data3 = new HashMap<>();
        data3.put("label", "开关");
        data3.put("value", 3);

        HashMap<String, Object> data4 = new HashMap<>();
        data4.put("label", "开关组");
        data4.put("value", 4);


        HashMap<String, Object> data5 = new HashMap<>();
        data5.put("label", "进度条");
        data5.put("value", 5);

        HashMap<String, Object> data6 = new HashMap<>();
        data6.put("label", "图表");
        data6.put("value", 6);

        HashMap<String, Object> data7 = new HashMap<>();
        data7.put("label", "视频设备");
        data7.put("value", 7);

        List<HashMap<String, Object>> list = new ArrayList<>();
        list.add(data0);
        list.add(data1);
        list.add(data2);
        list.add(data3);
        list.add(data4);
        list.add(data5);
        list.add(data6);
        return data(list);
    }


    /**
     * 获取详情
     *
     * @param id
     * @return
     * @throws XException
     */
    @Override
    protected R get(@PathVariable Long id) throws XException {
        Module module = iModuleService.getById(id);
        if (module == null) {
            throw new BizException("Component not exists", "模块不存在");

        }
        return data(module);
    }


    /**
     * 上下线日志
     *
     * @param current
     * @param size
     * @param moduleId
     * @return
     */
    @GetMapping("/logs")
    public R logs(@RequestParam Integer current, @RequestParam Integer size, @RequestParam(required = false) Long moduleId) {
        Pageable pageable = PageRequest.of(current, size, Sort.by(Sort.Direction.DESC, "id"));
        return data(moduleLogService.queryForPage(moduleId, pageable));
    }


    /**
     * 获取数据
     *
     * @return
     * @throws XException
     */
    @GetMapping("/{moduleId}/data")
    public R queryForPage(@PathVariable Long moduleId, @RequestParam Integer current, @RequestParam Integer size) throws XException {
        Pageable pageable = PageRequest.of(current, size, Sort.by(Sort.Direction.DESC, "id"));
        Module module = iModuleService.getById(moduleId);
        if (module == null) {
            throw new BizException("Device not exist", "设备不存在");
        }

        return data(moduleDataService.queryForPage(moduleId, pageable));
    }

}

