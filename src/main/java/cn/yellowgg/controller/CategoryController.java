package cn.yellowgg.controller;

import cn.yellowgg.entity.Category;
import cn.yellowgg.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.POST)
    public @ResponseBody
    List<Category> findAll() {
        try {
            List<Category> categoryList = categoryService.findAll();
            if (categoryList != null && categoryList.size() > 0) {
                return categoryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
