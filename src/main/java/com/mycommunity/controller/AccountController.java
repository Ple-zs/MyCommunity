package com.mycommunity.controller;

import com.mycommunity.entity.CommunityUser;
import com.mycommunity.service.CommunityUserService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

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
    public void userNameExists(String name, HttpServletResponse response) throws IOException {
        boolean bool = communityUserService.exists(name) > 0;
        response.getWriter().print(bool);
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        session.removeAttribute("loginUserId");
        return "redirect:index";
    }

    //登录
    @RequestMapping("/userLogin")
    @ResponseBody
    public void userLogin(String name, String pwd, HttpServletResponse response, HttpSession session) throws IOException {
        CommunityUser communityUser = communityUserService.getUserByStr(name, pwd);
        if (communityUser != null) {
            session.setAttribute("loginUser", communityUser);
            session.setAttribute("loginUserId", communityUser.getId());
            response.getWriter().print("true");
        } else {
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
        if (result > 0) {
            CommunityUser loginUser = communityUserService.getUserByStr(name, pwd);
            session.setAttribute("loginUser", loginUser);
            session.setAttribute("loginUserId", loginUser.getId());
            response.getWriter().print("true");
        } else {
            response.getWriter().print("false");
        }
    }

    //个人主页
    @RequestMapping("/home/homePage")
    public String homePage(Model model, HttpSession session) {
        CommunityUser communityUser = (CommunityUser) session.getAttribute("loginUser");
        model.addAttribute("communityUser", communityUser);
        return "homePage";
    }

    //修改
    @RequestMapping("/home/modification")
    @ResponseBody
    public void modification(HttpSession session, HttpServletResponse response, String imageBase64, String pwd, String nickName, String signature) throws IOException {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        CommunityUser communityUser = new CommunityUser();
        communityUser.setPassWord(pwd);
        communityUser.setNickName(nickName);
        communityUser.setSignature(signature);
        communityUser.setId(userId);
        String filename = "Trends_" + RandomStringUtils.randomAlphanumeric(8) + "-HP.jpg";
        if(!imageBase64.isEmpty()){
            GenerateImage(imageBase64,filename);
            communityUser.setUser_HP_Path(filename);
        }
        if(communityUserService.updateUser(communityUser)>0){
            session.setAttribute("loginUser",communityUserService.getUserById(userId));
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }

    }

    private static void GenerateImage(String imageBase64, String imageName) {
        try {
            imageBase64 = imageBase64.replaceAll("data:image/jpeg;base64,", "");
            imageBase64 = imageBase64.replaceAll("data:image/png;base64,", "");
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] b = decoder.decodeBuffer(imageBase64);
            for (int i = 0; i < b.length; ++i) {
                // 调整异常数据
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            String imgFilePath = "E:\\Y2\\GitHob_Idea\\MyCommunity\\src\\main\\webapp\\static\\images\\user_HP\\" + imageName;// 新生成的图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
