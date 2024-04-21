package com.ruoyi.project.garbagesort.userInfo.mapper;

import java.util.List;
import com.ruoyi.project.garbagesort.userInfo.domain.UserInf;
import com.ruoyi.project.garbagesort.userInfo.domain.Users;

/**
 * 用户信息查询Mapper接口
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public interface UserInfMapper 
{
    /**
     * 查询用户信息查询
     * 
     * @param infId 用户信息查询ID
     * @return 用户信息查询
     */
    public UserInf selectUserInfById(Long infId);

    /**
     * 查询用户信息查询列表
     * 
     * @param userInf 用户信息查询
     * @return 用户信息查询集合
     */
    public List<UserInf> selectUserInfList(UserInf userInf);

    /**
     * 新增用户信息查询
     * 
     * @param userInf 用户信息查询
     * @return 结果
     */
    public int insertUserInf(UserInf userInf);

    /**
     * 修改用户信息查询
     * 
     * @param userInf 用户信息查询
     * @return 结果
     */
    public int updateUserInf(UserInf userInf);

    /**
     * 删除用户信息查询
     * 
     * @param infId 用户信息查询ID
     * @return 结果
     */
    public int deleteUserInfById(Long infId);

    /**
     * 批量删除用户信息查询
     * 
     * @param infIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserInfByIds(String[] infIds);

    /**
     * 批量删除用户查询
     * 
     * @param customerIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUsersByUserIds(String[] infIds);
    
    /**
     * 批量新增用户查询
     * 
     * @param usersList 用户查询列表
     * @return 结果
     */
    public int batchUsers(List<Users> usersList);
    

    /**
     * 通过用户信息查询ID删除用户查询信息
     * 
     * @param infId 用户信息查询ID
     * @return 结果
     */
    public int deleteUsersByUserId(Long infId);
}
