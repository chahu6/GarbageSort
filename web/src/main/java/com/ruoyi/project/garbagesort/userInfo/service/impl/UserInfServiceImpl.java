package com.ruoyi.project.garbagesort.userInfo.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.project.garbagesort.userInfo.domain.Users;
import com.ruoyi.project.garbagesort.userInfo.mapper.UserInfMapper;
import com.ruoyi.project.garbagesort.userInfo.domain.UserInf;
import com.ruoyi.project.garbagesort.userInfo.service.IUserInfService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 用户信息查询Service业务层处理
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Service
public class UserInfServiceImpl implements IUserInfService 
{
    @Autowired
    private UserInfMapper userInfMapper;

    /**
     * 查询用户信息查询
     * 
     * @param infId 用户信息查询ID
     * @return 用户信息查询
     */
    @Override
    public UserInf selectUserInfById(Long infId)
    {
        return userInfMapper.selectUserInfById(infId);
    }

    /**
     * 查询用户信息查询列表
     * 
     * @param userInf 用户信息查询
     * @return 用户信息查询
     */
    @Override
    public List<UserInf> selectUserInfList(UserInf userInf)
    {
        return userInfMapper.selectUserInfList(userInf);
    }

    /**
     * 新增用户信息查询
     * 
     * @param userInf 用户信息查询
     * @return 结果
     */
    @Transactional
    @Override
    public int insertUserInf(UserInf userInf)
    {
        int rows = userInfMapper.insertUserInf(userInf);
        insertUsers(userInf);
        return rows;
    }

    /**
     * 修改用户信息查询
     * 
     * @param userInf 用户信息查询
     * @return 结果
     */
    @Transactional
    @Override
    public int updateUserInf(UserInf userInf)
    {
        userInfMapper.deleteUsersByUserId(userInf.getInfId());
        insertUsers(userInf);
        return userInfMapper.updateUserInf(userInf);
    }

    /**
     * 删除用户信息查询对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteUserInfByIds(String ids)
    {
        userInfMapper.deleteUsersByUserIds(Convert.toStrArray(ids));
        return userInfMapper.deleteUserInfByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户信息查询信息
     * 
     * @param infId 用户信息查询ID
     * @return 结果
     */
    @Override
    public int deleteUserInfById(Long infId)
    {
        userInfMapper.deleteUsersByUserId(infId);
        return userInfMapper.deleteUserInfById(infId);
    }

    /**
     * 新增用户查询信息
     * 
     * @param userInf 用户信息查询对象
     */
    public void insertUsers(UserInf userInf)
    {
        List<Users> usersList = userInf.getUsersList();
        Long infId = userInf.getInfId();
        if (StringUtils.isNotNull(usersList))
        {
            List<Users> list = new ArrayList<Users>();
            for (Users users : usersList)
            {
                users.setUserId(infId);
                list.add(users);
            }
            if (list.size() > 0)
            {
                userInfMapper.batchUsers(list);
            }
        }
    }
}
