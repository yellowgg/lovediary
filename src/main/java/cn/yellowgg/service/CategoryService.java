package cn.yellowgg.service;

import cn.yellowgg.entity.Category;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-3-31 下午7:35
 */
public interface CategoryService {

    /**
     * 查询所有的日记分类
     */
    List<Category> findAll() throws Exception;

    /**
     * 查询最新的日记分类
     */
    Category findTop() throws Exception;
}
