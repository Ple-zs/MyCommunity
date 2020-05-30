package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityMessageSendingDao;
import com.mycommunity.entity.CommunityMessageSending;
import com.mycommunity.service.CommunityMessageReceivingService;
import com.mycommunity.service.CommunityMessageSendingService;
import com.mycommunity.service.CommunityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommunityMessageSendingServiceImpl implements CommunityMessageSendingService {

    @Autowired
    private CommunityMessageSendingDao communityMessageSendingDao;
    @Autowired
    private CommunityUserService communityUserService;
    @Autowired
    private CommunityMessageReceivingService communityMessageReceivingService;

    @Override
    public List<CommunityMessageSending> getCommunityMessageSendingById(int senderId, int status) {
        return communityMessageSendingDao.getCommunityMessageSendingById(senderId, status);
    }

    @Override
    public int send_OperateEmail(int id, int status) {
        return communityMessageSendingDao.send_OperateEmail(id, status);
    }

    @Override
    public CommunityMessageSending getMailById(int id) {
        return communityMessageSendingDao.getMailById(id);
    }

    @Override
    public int updateDraft(CommunityMessageSending communityMessageSending) {
        return communityMessageSendingDao.updateDraft(communityMessageSending);
    }

    @Override
    public int addCommunityMessageSending(CommunityMessageSending communityMessageSending) {
        return communityMessageSendingDao.addCommunityMessageSending(communityMessageSending);
    }

    @Override
    public int getNewestId() {
        return communityMessageSendingDao.getNewestId();
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int sendMail(int messageSendingId, String[] nameArray) {
        for (String str: nameArray) {
            int receiverId = communityUserService.getUserIdByName(str);
            int result = communityMessageReceivingService.addCommunityMessageReceiving(messageSendingId,receiverId);
            System.out.println("receiverId：" + receiverId + "\t" + "result：" + result);
        }
        return 1;
    }

}
