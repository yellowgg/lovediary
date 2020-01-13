package cn.yellowgg.controller;

import cn.yellowgg.entity.LoveDate;
import cn.yellowgg.entity.User;
import cn.yellowgg.log.BaseLogger;
import cn.yellowgg.service.UserService;
import cn.yellowgg.utils.DateTimeUtils;
import cn.yellowgg.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * @Author:黄广
 * @Description:用户的控制器
 * @Date: Created in 19-3-31 下午7:34
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 跳转到登录界面
     */
    @RequestMapping("/loginUI")
    public String loginUI() {
        return "login";
    }

    /**
     * 跳转到设置界面
     */
    @RequestMapping("/setting")
    public String setting() {
        return "setting";
    }


    /**
     * ajax请求填充设置项的表单数据
     */
    @RequestMapping(value = "/getSetting", method = RequestMethod.POST)
    public @ResponseBody
    User getSetting(HttpServletRequest request) {
        try {
            User crrentUser = (User) request.getSession().getAttribute("crrentUser");
            if (crrentUser == null) {
                return new User("id", "session没有User", "牛郎", "织女");
            }
            //获取user
            User user = userService.findUserById(crrentUser.getUserid());
            if (user != null) {
                //去掉敏感信息
                user.setUserid("路飞");
                user.setUsername("索隆");
                user.setPassword("山治");
                user.setCreatetime(new Date());
                //返回 这里返回的loveday在前台json接受的是毫秒，已在前台处理
                return user;
            }
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("ajax请求填充设置项的表单数据失败", e);
        }
        return null;
    }


    /**
     * 注销
     */
    @RequestMapping("/logout")
    public void logout(HttpServletResponse response, HttpServletRequest request) {
        try {
            // 清空有关session信息即可
            request.getSession().invalidate();
            //返回首页
            response.sendRedirect(request.getContextPath());
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("注销失败", e);
        }
    }


    /**
     * 登录
     */
    @RequestMapping("/login")
    public String login(User user, HttpServletResponse response, HttpServletRequest request, Model model) {
        try {
            //二次加密
            user.setPassword(MD5Utils.getMD5(user.getPassword(), false, 32));
            User crrentUser = userService.findUser(user);
            if (crrentUser == null) {
                model.addAttribute("errorMsg", "登录错误，请重试");
                return "login";
            }
            //登录成功，注入session
            request.getSession().setAttribute("crrentUser", crrentUser);
            //判断previousPath是否有请求的URL，有的话取出来跳转
            String previousPath = (String) request.getSession().getAttribute("previousPath");
            if (previousPath != null) {
                response.sendRedirect(request.getContextPath() + previousPath);
                return null;
            }
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("登陆失败", e);
        }
        //如果没有上一个请求，是直接登录，那么就返回主页
        return "redirect:/";
    }

    /**
     * 更新设置项
     *
     * @param lovedate 前台传过来的是yyyy-mm-dd格式 所以单独弄一个date来接收，因为User的属性接收不了
     */
    @RequestMapping(value = "/updateSetting", method = RequestMethod.POST)
    public void updateSetting(@DateTimeFormat(pattern = "yyyy-MM-dd") Date lovedate, HttpServletResponse response,
                              HttpServletRequest request, User user, MultipartFile file) {
        /*从前台传过来的时间是Mon Apr 16 00:00:00 CST 2018
         * 然后存进数据库会少一天 数据库中为2018-4-15
         * 解决办法：
         * 添加数据库连接信息的字段serverTimezone设置为值Asia/Shanghai
         * com.mysql.jdbc.Driver无需配置时区，但是这里需要配置一下。
         * 链接：https://blog.csdn.net/qq442270636/article/details/81054263
         * */
        User crrentUser = (User) request.getSession().getAttribute("crrentUser");
        user.setUserid(crrentUser.getUserid());
        user.setLoveday(lovedate);
        try {
            if (userService.updateSetting(user) > 0) {
                //更新完之后，将application的值也更新
                request.getServletContext().setAttribute("boyname", user.getBoyname());
                request.getServletContext().setAttribute("girlname", user.getGirlname());
                request.getServletContext().setAttribute("floatcontent", user.getFloatcontent());
                //格式化两个日期
                String loveday = DateTimeUtils.YyyyMmDdFormat(lovedate);
                String nowDay = DateTimeUtils.YyyyMmDdFormat(new Date());
                LoveDate loveDate = DateTimeUtils.CalculateTheUseYaers(loveday, nowDay);
                request.getServletContext().setAttribute("loveYear", loveDate.getYear());
                request.getServletContext().setAttribute("loveMonth", loveDate.getMonth());
                request.getServletContext().setAttribute("loveDay", loveDate.getDay());
                response.sendRedirect(request.getContextPath() + "/user/setting");
                return;
            }
            response.sendRedirect(request.getContextPath() + "/other/error");
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("更新设置项失败", e);
            //跳转到错误页面
            try {
                response.sendRedirect(request.getContextPath() + "/other/error");
            } catch (IOException ex) {
            }
        }
    }
}
