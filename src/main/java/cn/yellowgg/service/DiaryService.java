package cn.yellowgg.service;

import cn.yellowgg.entity.Category;
import cn.yellowgg.entity.Diary;
import cn.yellowgg.entity.PageBean;

/**
 * @Author:yellowgg
 * @Description:
 * @Date: Created in 19-3-31 下午7:35
 */
public interface DiaryService {
    /**
     * 根据分类查询分页日记
     */
    PageBean<Diary> findAllByCatePage(Integer pageNum, Integer pageSize,
                                      Category category) throws Exception;

    /**
     * 根据搜索词查询分页日记
     */
    PageBean<Diary> findAllByContentPage(Integer pageNum, Integer pageSize,
                                         Diary diary) throws Exception;

    /**
     * 根据id查询日记
     */
    Diary findById(Diary diary) throws Exception;

    /**
     * 查找下一篇日记
     *
     * @param diary 当前日记
     */
    Diary findNext(Diary diary) throws Exception;

    /**
     * 查找上一篇日记
     *
     * @param diary 当前日记
     */
    Diary findPrev(Diary diary) throws Exception;

    /**
     * 添加日记
     *
     * @param categoryName 分类名， 格式是2019年04月
     */
    void addDiary(Diary diary, String categoryName) throws Exception;

    /**
     * 更新日记
     */
    int editDiary(Diary diary) throws Exception;


}
