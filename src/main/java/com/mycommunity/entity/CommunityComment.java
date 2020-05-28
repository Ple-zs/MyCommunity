package com.mycommunity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommunityComment {
    private int id;
    private String content;
    private Date commentTime;
    private String ip;
    private int commentType;
    private int referenceId;
    private int commenterId;
    private int status;
    private String commenterUser_nickName;
    private String user_Hp_Path;
    private int userGrade;
    private String signature;
}
