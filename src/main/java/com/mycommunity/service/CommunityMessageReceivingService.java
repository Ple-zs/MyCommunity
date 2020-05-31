package com.mycommunity.service;

import com.mycommunity.entity.CommunityMessageReceiving;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMessageReceivingService {

    //获得所有邮件
    List<CommunityMessageReceiving> getAllMailById(@Param("id") int id,@Param("status") int status,@Param("readed") int readed);

    //操作邮件
    int operateEmail(@Param("cmrId") int cmrId,@Param("status") int status);

    //add
    int addCommunityMessageReceiving(@Param("messageSendingId") int messageSendingId,@Param("receiverId") int receiverId);

    //根据邮件获得单个数据
    CommunityMessageReceiving getCommunityMessageReceivingById(@Param("cmsId") int cmsId,@Param("receiverId") int receiverId);

    //标记已读
    int sign_read(@Param("cmrId") int id);
}
