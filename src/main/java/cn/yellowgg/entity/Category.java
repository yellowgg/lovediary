package cn.yellowgg.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author:黄广
 * @Description: 日记分类，其实算是时间分类
 * @Date: Created in 19-3-31 下午7:23
 */
@Data
public class Category {
    private String categoryid;

    private String categoryname;

    private Integer count;

    private Date createtime;

    public Category() {
    }

    public Category(String categoryId, String categoryName) {
        this.categoryid = categoryId;
        this.categoryname = categoryName;
    }
}