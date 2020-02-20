package cn.yellowgg.utils;

import cn.yellowgg.entity.LoveDate;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Author:yellowgg
 * @Description:时间的工具类
 * @Date: Created in 19-4-3 上午9:39
 */
public class DateTimeUtils {
    /**
     * 计算两个日期的年月日，且会自动进位
     *
     * @param oldDate
     * @param newDate
     * @return LoveDate 一个有年月日三个int变量的包装类
     */
    public static LoveDate CalculateTheUseYaers(String oldDate, String newDate) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 创建日期格式
        Calendar c1 = Calendar.getInstance(); // 创建日历对象
        Calendar c2 = Calendar.getInstance();
        c1.setTime(sdf.parse(oldDate));
        c2.setTime(sdf.parse(newDate));
        int years = c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR); // 计算年度差
        int month = c2.get(Calendar.MONTH) - c1.get(Calendar.MONTH);// 计算月度差
        int day = c2.get(Calendar.DAY_OF_MONTH) - c1.get(Calendar.DAY_OF_MONTH);// 计算日数差 （DAY_OF_MONTH为月中的天数)
        if (day < 0) {
            month -= 1;
            day = day + 31;
        }
        if (month < 0) {
            years -= 1;
            month = 12 + month;
        }
        LoveDate loveDate = new LoveDate();
        loveDate.setYear(years);
        loveDate.setMonth(month);
        loveDate.setDay(day);
        return loveDate;
    }

    /**
     * 将日期格式化成yyyy-mm-dd
     *
     * @param date
     * @return
     */
    public static String YyyyMmDdFormat(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        return sdf.format(date);
    }
}
