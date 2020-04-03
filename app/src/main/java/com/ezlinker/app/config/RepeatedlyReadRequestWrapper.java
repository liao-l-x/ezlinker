package com.ezlinker.app.config;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

/**
 * @program: ezlinker
 * @description:
 * @author: wangwenhai
 * @create: 2019-11-11 16:45
 **/


public class RepeatedlyReadRequestWrapper extends HttpServletRequestWrapper {
    private final byte[] body;

    public RepeatedlyReadRequestWrapper(HttpServletRequest request)
            throws IOException {
        super(request);
        body = readBytes(request.getReader());
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(getInputStream()));
    }

    @Override
    public ServletInputStream getInputStream() {
        final ByteArrayInputStream bais = new ByteArrayInputStream(body);
        return new ServletInputStream() {

            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener listener) {

            }

            @Override
            public int read() {
                return bais.read();
            }
        };
    }

    /**
     * 通过BufferedReader和字符编码集转换成byte数组
     *
     * @param br
     * @return
     * @throws IOException
     */
    private byte[] readBytes(BufferedReader br) throws IOException {
        String str;
        StringBuilder retStr = new StringBuilder();
        while ((str = br.readLine()) != null) {
            retStr.append(str);
        }
        if (StringUtils.isNotBlank(retStr.toString())) {
            return retStr.toString().getBytes(Charset.forName("UTF-8"));
        }
        return null;
    }
}
