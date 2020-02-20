package cn.yellowgg.service.impl;

import cn.yellowgg.entity.Category;
import cn.yellowgg.entity.Diary;
import cn.yellowgg.entity.PageBean;
import cn.yellowgg.mapper.CategoryMapper;
import cn.yellowgg.mapper.DiaryMapper;
import cn.yellowgg.service.DiaryService;
import cn.yellowgg.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author:yellowgg
 * @Description:
 * @Date: Created in 19-3-31 下午7:36
 */
@Service
public class DiaryServiceImpl implements DiaryService {

    @Autowired
    DiaryMapper diaryMapper;
    @Autowired
    CategoryMapper categoryMapper;

    /**
     * 根据分类查询分页日记
     */
    @Override
    public PageBean<Diary> findAllByCatePage(Integer pageNum, Integer pageSize,
                                             Category category) throws Exception {
        //1.创建pageBean
        PageBean<Diary> pd = new PageBean<>(pageNum, pageSize);
        //2.设置当前页数据
        List<Diary> data = diaryMapper.findAllByCatePage(pd.getStartIndex(), pageSize, category);
        pd.setData(data);
        //3.设置总记录数
        int totalRecord = categoryMapper.getCountOfCate(category);
        pd.setTotalRecord(totalRecord);
        return pd;
    }

    /**
     * 根据搜索词查询分页日记
     */
    @Override
    public PageBean<Diary> findAllByContentPage(Integer pageNum, Integer pageSize, Diary diary) throws Exception {
        //1.创建pageBean
        PageBean<Diary> pd = new PageBean<>(pageNum, pageSize);
        //2.设置当前页数据
        List<Diary> data = diaryMapper.findAllByContentPage(pd.getStartIndex(), pageSize, diary);
        pd.setData(data);
        //3.设置总记录数
        int totalRecord = diaryMapper.getCountOfSearchKey(diary);
        pd.setTotalRecord(totalRecord);
        return pd;
    }

    /**
     * 根据id查询日记
     */
    @Override
    public Diary findById(Diary diary) throws Exception {
        return diaryMapper.findById(diary);
    }

    /**
     * 查找下一篇日记
     *
     * @param diary 当前日记
     */
    @Override
    public Diary findNext(Diary diary) throws Exception {
        return diaryMapper.findNext(diary);
    }

    /**
     * 查找上一篇日记
     *
     * @param diary 当前日记
     */
    @Override
    public Diary findPrev(Diary diary) throws Exception {
        return diaryMapper.findPrev(diary);
    }

    /**
     * 添加日记
     *
     * @param diary
     * @param categoryName 分类名， 格式是2019年04月
     */
    @Override
    public void addDiary(Diary diary, String categoryName) throws Exception {
        Category category = new Category(null, categoryName);
        //先查询是否有这么一个分类，有的话就返回分类id
        String cgId = categoryMapper.findCateIdByName(category);
        //如果已经有这个分类，赋值，插入
        if (cgId != null) {
            category.setCategoryid(cgId);
            diary.setCategoryid(cgId);
        } else {
            //如果没有，就新创建一个并返回id
            category.setCategoryid(UUIDUtils.getId());
            category.setCount(0);
            category.setCreatetime(new Date());
            categoryMapper.addNewCate(category);
            //赋值
            diary.setCategoryid(category.getCategoryid());
        }
        //赋值成功之后，就执行插入日记
        diaryMapper.addNewDiary(diary);
        //分类下的数量+1
        categoryMapper.AddCountOfCate(category);
    }

    /**
     * 更新日记
     *
     * @param diary
     */
    @Override
    public int editDiary(Diary diary) throws Exception {
        return diaryMapper.editDiary(diary);
    }
}
