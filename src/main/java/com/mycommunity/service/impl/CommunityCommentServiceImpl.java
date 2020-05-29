package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityCommentDao;
import com.mycommunity.entity.CommunityComment;
import com.mycommunity.service.CommunityCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityCommentServiceImpl implements CommunityCommentService {

    @Autowired
    private CommunityCommentDao communityCommentDao;

    @Override
    public List<CommunityComment> getCommunityCommentByTid(int currentPage, int row, int tid) {
        return communityCommentDao.getCommunityCommentByTid(currentPage, row, tid);
    }

    @Override
    public int getRowsCount(int tid) {
        return communityCommentDao.getRowsCount(tid);
    }

    @Override
    public int addCommunityComment(CommunityComment communityComment) {
        return communityCommentDao.addCommunityComment(communityComment);
    }
}
