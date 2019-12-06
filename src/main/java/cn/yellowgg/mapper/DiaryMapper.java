package cn.yellowgg.mapper;

import cn.yellowgg.entity.Category;
import cn.yellowgg.entity.Diary;
import cn.yellowgg.entity.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DiaryMapper {

    PageBean<Diary> findAllByCate(Category category) throws Exception;

    List<Diary> findAllByCatePage(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize,
                                  @Param("category") Category category) throws Exception;

    List<Diary> findAllByContentPage(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize,
                                     @Param("diary") Diary diary) throws Exception;

    Diary findById(Diary diary) throws Exception;

    /**
     * 查找当前日记的下一篇
     *
     * @param diary 当前日记
     */
    Diary findNext(Diary diary) throws Exception;

    /**
     * 查找当前日记的上一篇
     *
     * @param diary 当前日记
     */
    Diary findPrev(Diary diary) throws Exception;

    int addNewDiary(Diary diary) throws Exception;

    int editDiary(Diary diary) throws Exception;

    int getCountOfSearchKey(Diary diary) throws Exception;
}