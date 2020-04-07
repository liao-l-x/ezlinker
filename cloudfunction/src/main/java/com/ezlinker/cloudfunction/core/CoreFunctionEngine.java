package com.ezlinker.cloudfunction.core;

import org.luaj.vm2.*;
import org.luaj.vm2.compiler.LuaC;
import org.luaj.vm2.lib.*;
import org.luaj.vm2.lib.jse.JseBaseLib;
import org.luaj.vm2.lib.jse.JseMathLib;

import java.util.logging.Logger;

/**
 * 核心lua脚本运行引擎
 */
public class CoreFunctionEngine {
    // 代码空间(默认5MB内存)
    private static final int MAX_INSTRUCTION_COUNT = 1024 * 5;
    private static Logger logger = Logger.getLogger(CoreFunctionEngine.class.getName());
    // 全局LUA脚本引擎
    private static Globals GLOBAL_LUA_ENGINE_ENV = new Globals();


    public CoreFunctionEngine() {
        GLOBAL_LUA_ENGINE_ENV.load(new JseBaseLib());
        GLOBAL_LUA_ENGINE_ENV.load(new PackageLib());
        GLOBAL_LUA_ENGINE_ENV.load(new Bit32Lib());
        GLOBAL_LUA_ENGINE_ENV.load(new TableLib());
        GLOBAL_LUA_ENGINE_ENV.load(new StringLib());
        GLOBAL_LUA_ENGINE_ENV.load(new JseMathLib());
        LoadState.install(GLOBAL_LUA_ENGINE_ENV);
        LuaC.install(GLOBAL_LUA_ENGINE_ENV);
        logger.info("CoreFunctionEngine loaded with memory:" + MAX_INSTRUCTION_COUNT + " MB");

    }

    public static void main(String[] args) {
//        String lua = "lib = require( 'com/ezlinker/cloudfunction/core/TestJLuaLib' )\n" +
//                "print(lib.a())\n" +
//                "print(lib.b())\n" +
//                " i=0 \n while true do i=i+1 print(i) end \n";
        String lua = "a=1+1 print(a) b=2+2 print(b) c=3+3 print(c)";
        Varargs v = new CoreFunctionEngine().runLuaScript(lua);
        System.out.println(v.toString());
    }

    public Varargs runLuaScript(String luaScript) {
        Globals USER_ENV = new Globals();
        USER_ENV.load(new JseBaseLib());
        USER_ENV.load(new PackageLib());
        USER_ENV.load(new Bit32Lib());
        USER_ENV.load(new TableLib());
        USER_ENV.load(new StringLib());
        USER_ENV.load(new JseMathLib());
        USER_ENV.load(new DebugLib());

        LuaValue hook = USER_ENV.get("debug").get("sethook");
        USER_ENV.set("debug", LuaValue.NIL);
        LuaValue luaValue = GLOBAL_LUA_ENGINE_ENV.load(luaScript, "UserLuaScript", USER_ENV);
        LuaThread thread = new LuaThread(USER_ENV, luaValue);

        hook.invoke(LuaValue.varargsOf(new LuaValue[]{thread, new ZeroArgFunction() {
            public LuaValue call() {
                throw new Error("System resources overload.");
            }
        }, LuaValue.NIL, LuaValue.valueOf(MAX_INSTRUCTION_COUNT)}));
        return thread.resume(LuaValue.NIL);
    }
}
