package cn.yellowgg.controller;

import cn.yellowgg.entity.Category;
import cn.yellowgg.log.BaseLogger;
import cn.yellowgg.service.CategoryService;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author:黄广
 * @Description:分类的控制层
 * @Date: Created in 19-4-3 下午5:49
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * ajax请求日记分类
     *
     * @return 第一个list是年份 第二个list是月份
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List<Category>> findAll(String year) {
        try {
            List<Category> categoryList = categoryService.findAll();
            HashMap<String, List<Category>> resultMap = categoryList.stream().collect(Collectors.groupingBy(
                    e -> e.getCategoryname().split("年")[0], HashMap::new, Collectors.toList()));
            if (MapUtils.isNotEmpty(resultMap)) {
                return resultMap;
            }
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("ajax请求日记分类失败", e);
        }
        return null;
    }
}
