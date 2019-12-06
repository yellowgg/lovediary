package cn.yellowgg.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Description: 该类只能定义静态日志变量，不要写方法。其他类直接实现下就行 不用继承是因为可以多实现，对原来的代码影响最少
 * @Author: yellowgg
 * @Date: Created in 2019/12/6 15:45
 */
public interface BaseLogger {
    Logger LOGGER_ACCESS = (Logger) LoggerFactory.getLogger("ACCESS");
    Logger ERROR_LOGGER = (Logger) LoggerFactory.getLogger("SystemErrorAppender");
}
