package cn.yellowgg.service;

import cn.yellowgg.entity.User;

/**
 * @Author:yellowgg
 * @Description:
 * @Date: Created in 19-3-31 下午7:34
 */
public interface UserService {
    /**
     * 根据用户id查找用户
     */
    User findUserById(String userid) throws Exception;

    /**
     * 更新用户的设置项
     *
     * @return 受影响的行数
     */
    int updateSetting(User user) throws Exception;

    /**
     * 用户登录
     */
    User findUser(User user) throws Exception;
}
