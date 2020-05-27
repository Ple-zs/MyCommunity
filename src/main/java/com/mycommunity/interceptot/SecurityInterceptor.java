package com.mycommunity.interceptot;

import com.mycommunity.entity.CommunityUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SecurityInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        CommunityUser user = (CommunityUser)session.getAttribute("loginUser");
        if(user != null) {
            return true;
        }else {
            //获取用户请求的url
            String requestUrl = request.getServletPath();
            requestUrl = requestUrl.substring(1, requestUrl.length());
            System.out.println("被拦截的访问路径：" + requestUrl);
            String url = request.getContextPath() + "/login?returnUrl="+requestUrl;
            response.sendRedirect(url);
            return false;
        }
    }
}
