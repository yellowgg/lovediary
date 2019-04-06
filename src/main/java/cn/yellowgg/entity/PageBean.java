package cn.yellowgg.entity;

import lombok.Data;

import java.util.List;

/**
 * @Author:黄广
 * @Description:这个类是专门用来存储pojo的分页
 * @Date: Created in 19-4-3 下午5:21
 */
@Data
public class PageBean<T> {
    private List<T> data;//当前页的数据		查询  limit (pageNumber-1)*pageSize,pageSize
    private Integer pageNumber;//当前页		前端页面传递过来
    private Integer totalRecord;//总条数		查询  count(*)
    private Integer pageSize;//每页显示的数量	固定值
    private Integer totalPage;//总页数			计算出来 (int)Math.ceil(totalRecord*1.0/pageSize);

    public PageBean(int pageNumber, int pageSize) {
        super();
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }

    /**
     * 获取总页数
     */
    public int getTotalPage() {
        return (int) Math.ceil(totalRecord * 1.0 / pageSize);
    }

    /**
     * 获取开始索引
     */
    public int getStartIndex() {
        return (pageNumber - 1) * pageSize;
    }
}
