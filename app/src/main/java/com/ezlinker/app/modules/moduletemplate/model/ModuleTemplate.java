package com.ezlinker.app.modules.moduletemplate.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.ezlinker.app.common.model.XEntity;
import com.ezlinker.app.modules.module.pojo.DataArea;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * <p>
 * 产品上面的模块模板
 * </p>
 *
 * @author wangwenhai
 * @since 2019-12-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "ez_module_template", autoResultMap = true)
public class ModuleTemplate extends XEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 产品ID
     */
    private Integer productId;

    /**
     * 名称
     */
    private String name;

    /**
     * 数据域
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<DataArea> dataAreas;

    /**
     * 描述
     */
    private String description;

    /**
     * 如果是组的数量,前端提交辅助字段
     * 不参与Model
     */
    @TableField(exist = false)
    private Integer count = 1;

    @NotNull(message = "模块类型不可为空值")

    private String type;

    /**
     * 自定义类型 CUSTOMIZE
     * 按钮 BUTTON
     * 按钮组 BUTTON_GROUP
     * 开关 SWITCH
     * 开关组 SWITCH_GROUP
     * 进度条 PROGRESS_BAR
     * 数据体 DATA_ENTITY
     * 视频流 STREAM
     */

    public static class ModuleType {
        public static final String
                CUSTOMIZE = "CUSTOMIZE",
                BUTTON = "BUTTON",
                BUTTON_GROUP = "BUTTON_GROUP",
                SWITCH = "SWITCH",
                SWITCH_GROUP = "SWITCH_GROUP",
                PROGRESS_BAR = "PROGRESS_BAR",
                DATA_ENTITY = "DATA_ENTITY",
                STREAM = "STREAM";
    }

    /**
     * 图标
     */
    private String icon;

}
