package com.starlight.dao;

import com.starlight.entity.UserInfo;
import org.springframework.stereotype.Component;

/**
 * Created by thomas.wang on 2016/12/19.
 */
@Component
public interface IUserinfoDao {
    /**
     * 通过用户id来查询用户信息
     * @param uinfo_id 账号
     * @return list  集合
     */
     UserInfo findUserifoById(int uinfo_id);
}
