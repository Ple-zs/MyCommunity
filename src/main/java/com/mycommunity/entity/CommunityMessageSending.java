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
public class CommunityMessageSending {
    private int id;
    private String title;
    private String content;
    private String receivers;
    private Date sendTime;
    private int senderId;
    private int status;
}
