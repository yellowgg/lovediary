package cn.yellowgg.service.impl;

import cn.yellowgg.entity.User;
import cn.yellowgg.mapper.UserMapper;
import cn.yellowgg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-3-31 下午7:36
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 根据用户id查找用户
     */
    @Override
    public User findUserById(String userid) throws Exception {
        return userMapper.findUserById(userid);
    }

    /**
     * 更新用户的设置项
     *
     * @return 受影响的行数
     */
    @Override
    public int updateSetting(User user) throws Exception {
        return userMapper.updateSetting(user);
    }

    /**
     * 用户登录
     */
    @Override
    public User findUser(User user) throws Exception {
        return userMapper.findUser(user);
    }
}
