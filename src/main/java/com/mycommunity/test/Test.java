package com.mycommunity.test;

import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        String tempStr = "sam,xiaofu,dafu";
        String[] tempArray = tempStr.split(",");
        for (String str: tempArray) {
            System.out.println(str);
        }
    }
}
