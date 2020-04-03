package com.ezlinker.app.common.web;

import com.ezlinker.app.common.exception.TokenException;
import com.ezlinker.app.common.exception.XException;
import com.ezlinker.app.modules.user.model.UserDetail;
import com.ezlinker.app.utils.UserTokenUtil;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 这个类名完全是我想不出来该怎么起了,所以随手写的
 * 这里仅仅是封装了一些常见的方法而已,方便其他地方调用
 */
public class XLazyMan {
    private HttpServletRequest httpServletRequest;

    public XLazyMan() {

    }

    public XLazyMan(HttpServletRequest httpServletRequest) {

        this.httpServletRequest = httpServletRequest;
    }

    public UserDetail getUserDetail() throws XException {
        String token = httpServletRequest.getHeader("token");
        if (!StringUtils.isEmpty(token)) {
            return UserTokenUtil.parse(token);
        } else {
            throw new TokenException("Missing token,please try again", "Token缺失,请重新获取");
        }
    }

}
