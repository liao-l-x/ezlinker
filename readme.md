# EZLinker:轻量级物联网应用
---
[![l1PIts.md.png](resources/static/banner.gif)](resources/static/banner.gif)
## 当前进度
0I============>30%=========================I100
> 目前还在填坑,问题很大.不建议尝试.
> 如果有能力开发，可联系QQ：751957846;或者QQ群:475512169

## 技术栈
1. 主业务系统:Springboot+Mybatisplus+Mongodb+redis
2. MQTT节点:EMQX(4.X+)
3. HTTP节点:Golang
4. COAP节点:Erlang-COAP
5. 前端:AntDesign
6. 微信小程序相关技术
7. 流媒体服务:EasyDarWin流媒体服务器(Golang实现)
8. 云函数:Node.js
> 本项目涉及到的技术点比较多,可以插件化灵活配置.虽然比较复杂,但是后期会出详细文档和视频讲解.
## 前端地址
https://github.com/ssloth/ezlinker-frontend.git
> 前端项目基于Ant Design.
## POSTMAN接口地址
https://www.getpostman.com/collections/4ba4516ff3809712513d
> 打开postman，然后导入这个地址即可.
## 项目文档
https://wwhai.gitbook.io/ezlinker/
> 项目详细文档,包含开发,运行.
## EMQX 相关
EZLinker的核心业务:MQTT服务,是基于EMQX构建.为了适应自己的业务场景,对EMQX做了部分二次开发,同时做了部分适配插件.
1. EZLinker团队维护的EMQX:https://gitee.com/lagrangewang/emqx
2. EZLinker的EMQX发行版地址:https://gitee.com/lagrangewang/emqx-rel
3. EZLinker核心插件:https://gitee.com/lagrangewang/ezlinker_core_plugin
## 其他
下面是一些辅助性的工具,还有EZLinker团队提供的常见的平台的SDK.
- COAP协议测试工具:https://github.com/wwhai/EZCoapTester.git
- Arduino SDK :https://github.com/wwhai/ezlinker_arduino_sdk.git
- ESP8266简单Demo:https://github.com/wwhai/ESP8266_Simple_cli.git
## 一些开发规范

### 包名规范
- controller:WEB控制器;
- model:数据模型;
- mapper:MyBatis映射;
- service:Service层;
- pojo:普通的Java类,一般起辅助作用;
- form:前端的Form表单接收;
- utils:模块私有工具代码;
- resource:模块私有资源文件,例如配置.

### 内置基本类
- CurdController:有统一CURD业务场景时继承;
- XController:简单接口继承;
### 基本通用查询接口
1. 带查询条件分页:`<T>page(current,size,Query)`;
2. 无查询条件分页:`<T>list(current,size)`;
3. 不分页查询:`<T>list()`;
> 以上常见的接口都用在查询方面.

### 表结构
基础表结构如下:
```sql
CREATE TABLE `表名` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品（设备的抽象模板）';
```
### 表名规范
1. 配置表全部`config`结尾.
2. 表名全部是常见名词的单数形式,意义要明确,不可出现`do object my`等模棱两可的名称.
3. 表名用名词单数形式,比如User,Student;
4. 中间关系表用 `relation`开头,后面跟关联的主表,从表,比如用户和博客的关系表:`relation_user_blog`,统一放进relation模块.

# 运行步骤
1. git 或者IDE直接导入代码；
2. 等待依赖安装成功以后，配置好Mysql(8.0+),MongoDB(4.0+)，Redis(5+)
3. 指定配置文件，然后启动

> maven项目的基本姿势
## QQ群\WeChat
[![l1PIts.md.png](resources/static/qq.png)](resources/static/banner.gif)
[![l1PIts.md.png](resources/static/wx.png)](resources/static/banner.gif)
> 加微信请注明来自github
>
## 协议
本项目采取Apache2开源协议.
```text
Copyright [2020] [name of copyright ezlinker]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```