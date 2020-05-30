package com.mycommunity.controller;

import com.mycommunity.entity.CommunityUser;
import com.mycommunity.service.CommunityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class AccountController {

    @Autowired
    private CommunityUserService communityUserService;

    @RequestMapping("/login")
    public String login() {

        return "login";
    }

    @RequestMapping("/register")
    public String register() {

        return "register";
    }

    //查询用户名是否存在
    @RequestMapping("/userNameExists")
    @ResponseBody
    public void userNameExists(String name,HttpServletResponse response) throws IOException {
        boolean bool = communityUserService.exists(name)>0;
        response.getWriter().print(bool);
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        session.removeAttribute("loginUserId");
        return "redirect:index";
    }

    //登录
    @RequestMapping("/userLogin")
    @ResponseBody
    public void userLogin(String name,String pwd,HttpServletResponse response,HttpSession session) throws IOException {
        CommunityUser communityUser = communityUserService.getUserByStr(name,pwd);
        if(communityUser != null){
            session.setAttribute("loginUser",communityUser);
            session.setAttribute("loginUserId",communityUser.getId());
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //注册
    @RequestMapping("/userRegister")
    @ResponseBody
    public void userRegister(HttpSession session, HttpServletResponse response, String name, String pwd, String nickName, String email) throws IOException {
        CommunityUser communityUser = new CommunityUser();
        communityUser.setUserName(name);
        communityUser.setEmail(email);
        communityUser.setNickName(nickName);
        communityUser.setPassWord(pwd);
        int result = communityUserService.userRegistration(communityUser);
        if(result > 0){
            CommunityUser loginUser = communityUserService.getUserByStr(name,pwd);
            session.setAttribute("loginUser",loginUser);
            session.setAttribute("loginUserId",loginUser.getId());
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }
}
