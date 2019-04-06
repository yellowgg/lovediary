package cn.yellowgg.utils;

import cn.yellowgg.entity.LoveDate;
import cn.yellowgg.entity.User;
import cn.yellowgg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @Author:黄广
 * @Description:此类是为了每天定时更新相爱时长的
 * @Date: Created in 19-4-6 上午9:48
 */
@Component
public class UpdateLoveDayTask {

    @Autowired
    UserService userService;


    @Scheduled(cron = "0 0 1 * * ?") //每天凌晨1点执行一次
    public void updateLoveDate(HttpServletRequest request) {
        try {
            User currentUser = userService.findUserById("988a6718538e11e99b5f10c37b1e9938");

            //计算时间
            String loveday = DateTimeUtils.YyyyMmDdFormat(currentUser.getLoveday());
            String nowDay = DateTimeUtils.YyyyMmDdFormat(new Date());

            //放回application
            LoveDate loveDate = DateTimeUtils.CalculateTheUseYaers(loveday, nowDay);
            request.getServletContext().setAttribute("loveYear", loveDate.getYear());
            request.getServletContext().setAttribute("loveMonth", loveDate.getMonth());
            request.getServletContext().setAttribute("loveDay", loveDate.getDay());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
