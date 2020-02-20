package cn.yellowgg.utils;

import cn.yellowgg.entity.LoveDate;
import cn.yellowgg.entity.User;
import cn.yellowgg.log.BaseLogger;
import cn.yellowgg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import java.util.Date;

/**
 * @Author:yellowgg
 * @Description:此类是为了每天定时更新相爱时长的
 * @Date: Created in 19-4-6 上午9:48
 */
@Component
public class UpdateLoveDayTask {

    @Autowired
    UserService userService;

    @Scheduled(cron = "0 0 */6 * * ?") //每个6小时执行一次
    public void updateLoveDate() {
        try {
            //获取servletContext
            WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
            ServletContext servletContext = webApplicationContext.getServletContext();
            User currentUser = userService.findUserById("988a6718538e11e99b5f10c37b1e9938");
            //计算时间
            String loveday = DateTimeUtils.YyyyMmDdFormat(currentUser.getLoveday());
            String nowDay = DateTimeUtils.YyyyMmDdFormat(new Date());
            LoveDate loveDate = DateTimeUtils.CalculateTheUseYaers(loveday, nowDay);
            //放回application
            servletContext.setAttribute("loveYear", loveDate.getYear());
            servletContext.setAttribute("loveMonth", loveDate.getMonth());
            servletContext.setAttribute("loveDay", loveDate.getDay());
        } catch (Exception e) {
            BaseLogger.ERROR_LOGGER.error("每隔六小时更新相爱时长出现错误", e);
        }
    }
}
