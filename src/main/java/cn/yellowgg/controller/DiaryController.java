package cn.yellowgg.controller;

import cn.yellowgg.entity.Category;
import cn.yellowgg.entity.Diary;
import cn.yellowgg.entity.PageBean;
import cn.yellowgg.service.CategoryService;
import cn.yellowgg.service.DiaryService;
import cn.yellowgg.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

/**
 * @Author:黄广
 * @Description:日记控制器
 * @Date: Created in 19-3-31 下午7:34
 */
@Controller
@RequestMapping("/diary")
public class DiaryController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    DiaryService diaryService;

    /**
     * 日记列表,分页,最新的分类下的日记
     */
    @RequestMapping("/list")
    public String list(Model model, HttpServletResponse response,
                       HttpServletRequest request) {
        try {
            //设置页码和页面数量
            int pageSize = 10;
            int pageNum = 1;

            //获取最新分类 不能获取本月，有可能已经好几个月没写日记了
            Category categoryTop = categoryService.findTop();

            //如果分类都没有，代表整个系统没有日记，直接返回，不用执行下边的代码了
            if (categoryTop == null) {
                return "diary_List";
            }

            //能走到这里，不出错肯定是有日记的。根据分类查询分页日记
            PageBean<Diary> diaryList =
                    diaryService.findAllByCatePage(pageNum, pageSize, categoryTop);


            //传回前台
            model.addAttribute("diariesOfTopCate", diaryList);
            //顺便也把分类id传过去，因为翻页要用到
            model.addAttribute("typeId", categoryTop.getCategoryid());

            return "diary_List";

        } catch (Exception e) {
            e.printStackTrace();
            //跳转到错误页面
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }


    /**
     * 根据分类分页查询日记
     *
     * @param pageNum 页码
     */
    @RequestMapping("/findPage/{pageNum}&{categoryId}")
    public String findPage(@PathVariable("pageNum") Integer pageNum,
                           @PathVariable("categoryId") String categoryId,
                           Model model, HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            //设置每页的对象数量
            int pageSize = 10;

            //封装分类
            Category category = new Category(categoryId, null);

            //能走到这里，不出错肯定是有日记的。根据分类查询分页日记
            PageBean<Diary> diaryList =
                    diaryService.findAllByCatePage(pageNum, pageSize, category);

            //传回前台
            model.addAttribute("diariesOfTopCate", diaryList);
            //顺便也把分类id传过去，因为翻页要用到
            model.addAttribute("typeId", categoryId);

            return "diary_List";

        } catch (Exception e) {
            e.printStackTrace();
            //跳转到错误页面
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }

    /**
     * 获取日记详情
     */
    @RequestMapping("/info/{diaryId}")
    public String info(@PathVariable("diaryId") String diaryId, Model model, HttpServletResponse response,
                       HttpServletRequest request) {
        try {
            //封装Diary
            Diary diary = new Diary(diaryId);

            //根据id查找所选择的日记
            diary = diaryService.findById(diary);

            //查找当前日记前后两篇的日记
            Diary diaryNext = diaryService.findNext(diary);
            Diary diaryPrev = diaryService.findPrev(diary);

            //找到就传到界面
            if (diary.getDiarycontent() != "") {
                model.addAttribute("currentDiary", diary);
                model.addAttribute("diaryNext", diaryNext);
                model.addAttribute("diaryPrev", diaryPrev);
                return "diary_Info";
            }
            //找不到就提示错误
            // response.sendRedirect(request.getContextPath() + "/other" +
            //         "/error");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 跳转到添加日记界面
     */
    @RequestMapping("/addUI")
    public String addUI() {
        return "diary_Add";
    }

    /**
     * 添加日记
     */
    @RequestMapping(value = "/addDiary", method = RequestMethod.POST)
    public void addDiary(Diary diary, HttpServletResponse response,
                         HttpServletRequest request) {
        try {
            //createtime
            diary.setCreatetime(new Date());

            //daytime
            Calendar now = Calendar.getInstance();
            String year = String.valueOf(now.get(Calendar.YEAR));
            String month = String.valueOf(now.get(Calendar.MONTH) + 1);
            //前面补0
            month = String.format("%02d", Integer.valueOf(month));
            String day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
            day = String.format("%02d", Integer.valueOf(day));
            diary.setDaytime(year + "年" + month + "月" + day + "日");

            //diaryid
            diary.setDiaryid(UUIDUtils.getId());

            //category 先查看是否存在，存在就设置分类，不存在就先创建再设置
            String category = year + "年" + month + "月";

            diaryService.addDiary(diary, category);

            response.sendRedirect(request.getContextPath() + "/diary" +
                    "/list");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * 跳转到编辑日记
     */
    @RequestMapping("/modifyUI/{diaryid}")
    public String modifyUI(@PathVariable("diaryid") String diaryId,
                           Model model, HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            //封装Diary
            Diary diary = new Diary(diaryId);

            //根据id查找日记放到界面，没有的话就报错
            diary = diaryService.findById(diary);

            //找到就传到界面
            if (diary.getDiarycontent() != "") {
                model.addAttribute("currentDiary", diary);
                return "diary_Edit";
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 添加日记
     */
    @RequestMapping(value = "/editDiary", method = RequestMethod.POST)
    public void editDiary(Diary diary, HttpServletResponse response,
                          HttpServletRequest request) {
        try {

            diaryService.editDiary(diary);

            response.sendRedirect(request.getContextPath() + "/diary" +
                    "/list");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }


    /**
     * 搜索日记
     */
    @RequestMapping("/searchlist")
    public String search(String searchKey, Model model,
                         HttpServletResponse response, HttpServletRequest request) {
        try {
            //如果没有的话，就转发list
            if (searchKey.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/diary" +
                        "/list");
                return null;
            }
            //有搜索值
            Diary diary = new Diary();
            diary.setDiarycontent(searchKey);

            //设置页码和页面数量
            int pageSize = 10;
            int pageNum = 1;

            //搜索
            PageBean<Diary> diaryList = diaryService.findAllByContentPage(pageNum, pageSize,
                    diary);

            //传回前台
            model.addAttribute("diariesOfTopCate", diaryList);
            model.addAttribute("searchKey", searchKey);

            return "search_List";
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 根据搜索词分页查询日记
     *
     * @param pageNum 页码
     */
    @RequestMapping("/findKeyPage/{pageNum}&{searchKey}")
    public String findKeyPage(@PathVariable("pageNum") Integer pageNum,
                              @PathVariable("searchKey") String searchKey,
                              Model model, HttpServletResponse response,
                              HttpServletRequest request) {
        try {
            //设置每页的对象数量
            int pageSize = 10;

            //封装分类
            Diary diary = new Diary();
            diary.setDiarycontent(searchKey);

            //能走到这里，不出错肯定是有日记的。根据分类查询分页日记
            PageBean<Diary> diaryList =
                    diaryService.findAllByContentPage(pageNum, pageSize, diary);

            //传回前台
            model.addAttribute("diariesOfTopCate", diaryList);
            //顺便也把分类id传过去，因为翻页要用到
            model.addAttribute("searchKey", searchKey);

            return "search_List";

        } catch (Exception e) {
            e.printStackTrace();
            //跳转到错误页面
            try {
                response.sendRedirect(request.getContextPath() + "/other" +
                        "/error");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }
}
