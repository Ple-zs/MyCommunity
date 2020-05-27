package com.mycommunity.interceptot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TimerInterceptor extends HandlerInterceptorAdapter {
    private long start;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("请求url：" + request.getRequestURI());
        start = System.currentTimeMillis();
        return true;
    }

    @Override
    public void postHandle(
            HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
            throws Exception {
        start = System.currentTimeMillis() - start;
        System.out.println("执行时间：" + start + "ms");
    }
}
