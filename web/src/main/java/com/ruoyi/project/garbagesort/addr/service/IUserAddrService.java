package com.ruoyi.project.garbagesort.addr.service;

import java.util.List;
import com.ruoyi.project.garbagesort.addr.domain.UserAddr;

/**
 * 用户地址查询Service接口
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public interface IUserAddrService 
{
    /**
     * 查询用户地址查询
     * 
     * @param addrId 用户地址查询ID
     * @return 用户地址查询
     */
    public UserAddr selectUserAddrById(Long addrId);

    /**
     * 查询用户地址查询列表
     * 
     * @param userAddr 用户地址查询
     * @return 用户地址查询集合
     */
    public List<UserAddr> selectUserAddrList(UserAddr userAddr);

    /**
     * 新增用户地址查询
     * 
     * @param userAddr 用户地址查询
     * @return 结果
     */
    public int insertUserAddr(UserAddr userAddr);

    /**
     * 修改用户地址查询
     * 
     * @param userAddr 用户地址查询
     * @return 结果
     */
    public int updateUserAddr(UserAddr userAddr);

    /**
     * 批量删除用户地址查询
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserAddrByIds(String ids);

    /**
     * 删除用户地址查询信息
     * 
     * @param addrId 用户地址查询ID
     * @return 结果
     */
    public int deleteUserAddrById(Long addrId);
}
