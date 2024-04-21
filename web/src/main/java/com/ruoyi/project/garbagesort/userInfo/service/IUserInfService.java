package com.ruoyi.project.garbagesort.userInfo.service;

import java.util.List;
import com.ruoyi.project.garbagesort.userInfo.domain.UserInf;

/**
 * 用户信息查询Service接口
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public interface IUserInfService 
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
     * 批量删除用户信息查询
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserInfByIds(String ids);

    /**
     * 删除用户信息查询信息
     * 
     * @param infId 用户信息查询ID
     * @return 结果
     */
    public int deleteUserInfById(Long infId);
}
