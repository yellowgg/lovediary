package cn.yellowgg.utils;

import java.util.UUID;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-4-3 下午9:28
 */
public class UUIDUtils {
    /**
     * 随机生成id
     */
    public static String getId() {
        return UUID.randomUUID().toString().
                replace("-", "").toUpperCase();
    }

    /**
     * 生成随机码
     */
    public static String getCode() {
        return getId();
    }
}
