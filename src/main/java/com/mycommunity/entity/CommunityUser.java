package com.mycommunity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommunityUser {
    private int id;
    private String userName;
    private String nickName;
    private String passWord;
    private String signature;
    private String email;
    private int grade;
    private int roleId;
    private int status;
    private String User_HP_Path;
}
