package com.ezlinker.cloudfunction.core;

import org.luaj.vm2.LuaValue;
import org.luaj.vm2.lib.ZeroArgFunction;

public class TestJLuaLib extends ZeroArgFunction {
    @Override
    public LuaValue call() {
        LuaValue library = tableOf();
        library.set("a", new ALib());
        library.set("b", new BLib());
        return library;
    }

    public static class ALib extends ZeroArgFunction {

        @Override
        public LuaValue call() {
            return LuaValue.valueOf("This is out of ALib");
        }
    }

    public static class BLib extends ZeroArgFunction {
        @Override
        public LuaValue call() {
            return LuaValue.valueOf("This is out of BLib");
        }
    }
}
