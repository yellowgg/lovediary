package cn.yellowgg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author:yellowgg
 * @Description:其它功能的控制器
 * @Date: Created in 19-4-1 下午10:14
 */
@Controller
@RequestMapping("/other")
public class OtherController {

    /**
     * 跳转到玩个球页面
     *
     * @return
     */
    @RequestMapping("/playtheball")
    public String playtheball() {
        return "playball";
    }

    /**
     * 跳转到关于页面
     *
     * @return
     */
    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    /**
     * 跳转到错误页面
     *
     * @return
     */
    @RequestMapping("/error")
    public String error() {
        return "error";
    }
}
