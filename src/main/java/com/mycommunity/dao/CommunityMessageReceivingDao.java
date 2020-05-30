package com.mycommunity.dao;

import com.mycommunity.entity.CommunityMessageReceiving;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMessageReceivingDao {

    //获得所有邮件
    List<CommunityMessageReceiving> getAllMailById(@Param("id") int id,@Param("status") int status,@Param("readed") int readed);

    //操作邮件
    int operateEmail(@Param("cmrId") int cmrId,@Param("status") int status);

    //add
    int addCommunityMessageReceiving(@Param("messageSendingId") int messageSendingId,@Param("receiverId") int receiverId);
}
