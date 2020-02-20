package cn.yellowgg.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author:yellowgg
 * @Description: 用户，拥有一些全局属性
 * @Date: Created in 19-3-31 下午7:24
 */
@Data
public class User {
    private String userid;

    private String username;

    private String password;

    private Date createtime;

    private Date loveday;

    private String floatcontent;

    private String boyname;

    private String girlname;

    public User() {
    }

    public User(String userid, String floatcontent, String boyname, String girlname) {
        this.userid = userid;
        this.floatcontent = floatcontent;
        this.boyname = boyname;
        this.girlname = girlname;
    }
}