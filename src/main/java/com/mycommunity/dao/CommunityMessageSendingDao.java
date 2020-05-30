package com.mycommunity.dao;

import com.mycommunity.entity.CommunityMessageSending;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMessageSendingDao {

    //获得发件数据
    List<CommunityMessageSending> getCommunityMessageSendingById(@Param("senderId") int senderId, @Param("status") int status);

    //发件操作
    int send_OperateEmail(@Param("id") int id, @Param("status") int status);

    //根据id获得邮件
    CommunityMessageSending getMailById(@Param("id") int id);

    //保存草稿
    int updateDraft(CommunityMessageSending communityMessageSending);

    //新增草稿
    int addCommunityMessageSending(CommunityMessageSending communityMessageSending);

    //获得最新MailId
    int getNewestId();

    //发送
    int sendMail(int messageSendingId,String[] nameArray);

}
