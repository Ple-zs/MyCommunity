package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityMessageReceivingDao;
import com.mycommunity.entity.CommunityMessageReceiving;
import com.mycommunity.service.CommunityMessageReceivingService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityMessageReceivingServiceImpl implements CommunityMessageReceivingService {

    @Autowired
    private CommunityMessageReceivingDao communityMessageReceivingDao;

    @Override
    public List<CommunityMessageReceiving> getAllMailById(int id,int status,int readed) {
        return communityMessageReceivingDao.getAllMailById(id,status,readed);
    }

    @Override
    public int operateEmail(int cmrId, int status) {
        return communityMessageReceivingDao.operateEmail(cmrId, status);
    }

    @Override
    public int addCommunityMessageReceiving(int messageSendingId, int receiverId) {
        return communityMessageReceivingDao.addCommunityMessageReceiving(messageSendingId,receiverId);
    }

    @Override
    public CommunityMessageReceiving getCommunityMessageReceivingById(int cmsId, int receiverId) {
        return communityMessageReceivingDao.getCommunityMessageReceivingById(cmsId, receiverId);
    }

    @Override
    public int sign_read(int id) {
        return communityMessageReceivingDao.sign_read(id);
    }
}
