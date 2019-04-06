package cn.yellowgg.mapper;

import cn.yellowgg.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-4-1 下午3:47
 */
@Repository
public interface UserMapper {

    User findUserById(String userid) throws Exception;

    int updateSetting(User user) throws Exception;

    User findUser(User user) throws Exception;

}