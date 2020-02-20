package cn.yellowgg.service.impl;

import cn.yellowgg.entity.Category;
import cn.yellowgg.mapper.CategoryMapper;
import cn.yellowgg.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:yellowgg
 * @Description:
 * @Date: Created in 19-3-31 下午7:36
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    /**
     * 查询所有的日记分类
     */
    @Override
    public List<Category> findAll() throws Exception {
        return categoryMapper.findAll();
    }

    /**
     * 查询最新的日记分类
     */
    @Override
    public Category findTop() throws Exception {
        return categoryMapper.findTop();
    }
}
