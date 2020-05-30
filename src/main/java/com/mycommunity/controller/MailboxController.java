package com.mycommunity.controller;

import com.mycommunity.entity.CommunityMessageReceiving;
import com.mycommunity.entity.CommunityMessageSending;
import com.mycommunity.service.CommunityMessageReceivingService;
import com.mycommunity.service.CommunityMessageSendingService;
import com.mycommunity.service.CommunityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/mbx")
public class MailboxController {

    @Autowired
    private CommunityMessageReceivingService communityMessageReceivingService;
    @Autowired
    private CommunityMessageSendingService communityMessageSendingService;
    @Autowired
    private CommunityUserService communityUserService;

    @RequestMapping("/mailbox")
    public String mailbox(Model model,Integer page) {
        model.addAttribute("page",page);
        return "mailbox";
    }

    //================收件

    @RequestMapping("/all_mail")
    public String all_mail(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageReceiving> communityMessageReceivingList = communityMessageReceivingService.getAllMailById(userId, 1, -1);
        model.addAttribute("communityMessageReceivingList", communityMessageReceivingList);
        return "loadPage/all_mail";
    }

    @RequestMapping("/starred")
    public String starred(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageReceiving> communityMessageReceivingList = communityMessageReceivingService.getAllMailById(userId, 1, 0);
        model.addAttribute("communityMessageReceivingList", communityMessageReceivingList);
        return "loadPage/starred";
    }

    @RequestMapping("/receive_recycleBin")
    public String receive_recycleBin(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageReceiving> communityMessageReceivingList = communityMessageReceivingService.getAllMailById(userId, 2, -1);
        model.addAttribute("communityMessageReceivingList", communityMessageReceivingList);
        return "loadPage/receive_recycleBin";
    }

    @RequestMapping("/recover_mail")
    @ResponseBody
    public void recover_mail(Integer cmrId) {
        communityMessageReceivingService.operateEmail(cmrId, 1);
    }

    @RequestMapping("/delete_mail")
    @ResponseBody
    public void delete_mail(Integer cmrId) {
        communityMessageReceivingService.operateEmail(cmrId, 2);
    }

    @RequestMapping("/clear_mail")
    @ResponseBody
    public void clear_mail(Integer cmrId) {
        communityMessageReceivingService.operateEmail(cmrId, 3);
    }

    //==================发件

    @RequestMapping("/send")
    public String send(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageSending> communityMessageSendingList = communityMessageSendingService.getCommunityMessageSendingById(userId, 1);
        model.addAttribute("communityMessageSendingList", communityMessageSendingList);
        return "loadPage/send";
    }

    @RequestMapping("/draft")
    public String draft(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageSending> communityMessageSendingList = communityMessageSendingService.getCommunityMessageSendingById(userId, 0);
        model.addAttribute("communityMessageSendingList", communityMessageSendingList);
        return "loadPage/draft";
    }

    @RequestMapping("/send_recycleBin")
    public String send_recycleBin(Model model, HttpSession session) {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        List<CommunityMessageSending> communityMessageSendingList = communityMessageSendingService.getCommunityMessageSendingById(userId, 2);
        model.addAttribute("communityMessageSendingList", communityMessageSendingList);
        return "loadPage/send_recycleBin";
    }

    @RequestMapping("/delete_sendMail")
    @ResponseBody
    public void delete_sendMail(Integer id) {
        communityMessageSendingService.send_OperateEmail(id, 2);
    }

    @RequestMapping("/recover_sendMail")
    @ResponseBody
    public void recover_sendMail(Integer id) {
        communityMessageSendingService.send_OperateEmail(id, 0);
    }

    @RequestMapping("/clear_sendMail")
    @ResponseBody
    public void clear_sendMail(Integer id) {
        communityMessageSendingService.send_OperateEmail(id, 3);
    }

    //查看邮件和草稿
    @RequestMapping("/show_mailContent")
    public String show_mailContent(Model model, Integer cmsId, String receivers, HttpSession session) {
        cmsId=cmsId==null?-1:cmsId;
        if(cmsId == -1){
            model.addAttribute("receivers",receivers);
            return "loadPage/show_mailContent";
        }
        CommunityMessageSending communityMessageSending = communityMessageSendingService.getMailById(cmsId);
        model.addAttribute("communityMessageSending", communityMessageSending);
        model.addAttribute("mailId",cmsId);
        return "loadPage/show_mailContent";
    }

    //保存到草稿
    @RequestMapping("/saveDraft")
    @ResponseBody
    public void saveDraft(Integer id, String title, String receivers, String content, HttpServletResponse response) throws IOException {
        CommunityMessageSending communityMessageSending = new CommunityMessageSending();
        communityMessageSending.setTitle(title);
        communityMessageSending.setContent(content);
        communityMessageSending.setReceivers(receivers);
        communityMessageSending.setId(id);
        int result = communityMessageSendingService.updateDraft(communityMessageSending);
        if(result > 0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //新增草稿
    @RequestMapping("/addDraft")
    @ResponseBody
    public void addDraft(String title, String receivers, String content, HttpSession session, HttpServletResponse response) throws IOException {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        CommunityMessageSending communityMessageSending = new CommunityMessageSending();
        communityMessageSending.setTitle(title);
        communityMessageSending.setContent(content);
        communityMessageSending.setReceivers(receivers);
        communityMessageSending.setSenderId(userId);
        communityMessageSending.setStatus(0);
        int result = communityMessageSendingService.addCommunityMessageSending(communityMessageSending);
        if(result > 0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //发送
    @RequestMapping("/sendMail")
    @ResponseBody
    public void sendMail(String title, String receivers, String content, HttpSession session, HttpServletResponse response) throws IOException {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        CommunityMessageSending communityMessageSending = new CommunityMessageSending();
        communityMessageSending.setTitle(title);
        communityMessageSending.setContent(content);
        communityMessageSending.setReceivers(receivers);
        communityMessageSending.setSenderId(userId);
        communityMessageSending.setStatus(1);
        communityMessageSendingService.addCommunityMessageSending(communityMessageSending);
        int maxId = communityMessageSendingService.getNewestId();
        String[] tempArray = receivers.split(",");
        int result = communityMessageSendingService.sendMail(maxId,tempArray);
        if(result > 0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //判断用户名是否存在
    @RequestMapping("/userName_isExist")
    @ResponseBody
    public void userName_isExist(String name, HttpServletResponse response) throws IOException {
        int result = communityUserService.exists(name);
        if(result > 0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //读邮件
    @RequestMapping("/read_only_mail")
    public String read_only_mail(Model model,Integer id){
        CommunityMessageSending communityMessageSending =communityMessageSendingService.getMailById(id);
        model.addAttribute("communityMessageSending",communityMessageSending);
        return "loadPage/read_only_mail";
    }
}
