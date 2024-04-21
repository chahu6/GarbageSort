package com.ruoyi.project.garbagesort.addr.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.garbagesort.addr.mapper.UserAddrMapper;
import com.ruoyi.project.garbagesort.addr.domain.UserAddr;
import com.ruoyi.project.garbagesort.addr.service.IUserAddrService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 用户地址查询Service业务层处理
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Service
public class UserAddrServiceImpl implements IUserAddrService 
{
    @Autowired
    private UserAddrMapper userAddrMapper;

    /**
     * 查询用户地址查询
     * 
     * @param addrId 用户地址查询ID
     * @return 用户地址查询
     */
    @Override
    public UserAddr selectUserAddrById(Long addrId)
    {
        return userAddrMapper.selectUserAddrById(addrId);
    }

    /**
     * 查询用户地址查询列表
     * 
     * @param userAddr 用户地址查询
     * @return 用户地址查询
     */
    @Override
    public List<UserAddr> selectUserAddrList(UserAddr userAddr)
    {
        return userAddrMapper.selectUserAddrList(userAddr);
    }

    /**
     * 新增用户地址查询
     * 
     * @param userAddr 用户地址查询
     * @return 结果
     */
    @Override
    public int insertUserAddr(UserAddr userAddr)
    {
        return userAddrMapper.insertUserAddr(userAddr);
    }

    /**
     * 修改用户地址查询
     * 
     * @param userAddr 用户地址查询
     * @return 结果
     */
    @Override
    public int updateUserAddr(UserAddr userAddr)
    {
        return userAddrMapper.updateUserAddr(userAddr);
    }

    /**
     * 删除用户地址查询对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserAddrByIds(String ids)
    {
        return userAddrMapper.deleteUserAddrByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户地址查询信息
     * 
     * @param addrId 用户地址查询ID
     * @return 结果
     */
    @Override
    public int deleteUserAddrById(Long addrId)
    {
        return userAddrMapper.deleteUserAddrById(addrId);
    }
}
