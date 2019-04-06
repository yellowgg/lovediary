package cn.yellowgg.mapper;

import cn.yellowgg.entity.Category;

import java.util.List;

public interface CategoryMapper {

    List<Category> findAll() throws Exception;

    Category findTop() throws Exception;

    int getCountOfCate(Category category) throws Exception;

    void AddCountOfCate(Category category) throws Exception;

    String findCateIdByName(Category category) throws Exception;

    int addNewCate(Category category) throws Exception;

}