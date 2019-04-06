package cn.yellowgg.init;

import cn.yellowgg.entity.LoveDate;
import cn.yellowgg.entity.User;
import cn.yellowgg.service.UserService;
import cn.yellowgg.utils.DateTimeUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.Date;

/**
 * @Author:黄广
 * @Description: 为什么有这个类，需求：我想在启动项目时，就在数据库中读取数据加载到web应用
 * 这样的话，我们可以设想在拦截器中读取出来，但是，如果在拦截器中读取，就只能用JDBC。
 * 不能用service层跟dao层，因为执行到拦截器的时候，spring容器还没有初始化其它类。
 * 那么，针对上面的问题，spring给的解决方案是实现InitializingBean接口，然后交由spring容器管理
 * 这样，实现这个接口的类就可以注入service层。
 * 注意：这个方法只执行一次，就是整个应用启动期间的第一次访问，除非web服务器重启或者这个web应用重启才会继续执行
 * 所以更改初始值之后应该手动更新application的属性
 * @Date: Created in 19-4-1 下午2:45
 */
public class InitDataListener implements InitializingBean, ServletContextAware {

    @Autowired
    UserService userService;

    /**
     * 读取数据库的数据，将其放入application中
     *
     * @param servletContext
     */
    @Override
    public void setServletContext(ServletContext servletContext) {
        /*这里要读取的是男女的名字，漂浮文字还有恋爱日期。*/
        /*按理说，如果是面向群体的话，一开始访问的时候，应该不显示与用户相关的信息，等它登录了再读取这个用户的。
        但是，我这里是面向自己的，所以我直接就读取我自己账户的信息就行了*/

        // 获取配置信息
        User user = null;
        try {
            user = userService.findUserById("988a6718538e11e99b5f10c37b1e9938");
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (user != null) {
            // 装载到application,这样就能在页面中使用了
            servletContext.setAttribute("boyname", user.getBoyname());
            servletContext.setAttribute("girlname", user.getGirlname());
            servletContext.setAttribute("floatcontent", user.getFloatcontent());

            //格式化两个日期
            String loveday = DateTimeUtils.YyyyMmDdFormat(user.getLoveday());
            String nowDay = DateTimeUtils.YyyyMmDdFormat(new Date());


            LoveDate loveDate = DateTimeUtils.CalculateTheUseYaers(loveday, nowDay);
            servletContext.setAttribute("loveYear", loveDate.getYear());
            servletContext.setAttribute("loveMonth", loveDate.getMonth());
            servletContext.setAttribute("loveDay", loveDate.getDay());

        }
    }


    @Override
    public void afterPropertiesSet() throws Exception {

    }
}
