package com.ruoyi.project.garbagesort.addr.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.garbagesort.addr.domain.UserAddr;
import com.ruoyi.project.garbagesort.addr.service.IUserAddrService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 用户地址查询Controller
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Controller
@RequestMapping("/garbagesort/addr")
public class UserAddrController extends BaseController
{
    private String prefix = "garbagesort/addr";

    @Autowired
    private IUserAddrService userAddrService;

    @RequiresPermissions("garbagesort:addr:view")
    @GetMapping()
    public String addr()
    {
        return prefix + "/addr";
    }

    /**
     * 查询用户地址查询列表
     */
    @RequiresPermissions("garbagesort:addr:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserAddr userAddr)
    {
        startPage();
        List<UserAddr> list = userAddrService.selectUserAddrList(userAddr);
        return getDataTable(list);
    }

    /**
     * 导出用户地址查询列表
     */
    @RequiresPermissions("garbagesort:addr:export")
    @Log(title = "用户地址查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserAddr userAddr)
    {
        List<UserAddr> list = userAddrService.selectUserAddrList(userAddr);
        ExcelUtil<UserAddr> util = new ExcelUtil<UserAddr>(UserAddr.class);
        return util.exportExcel(list, "用户地址查询数据");
    }

    /**
     * 新增用户地址查询
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户地址查询
     */
    @RequiresPermissions("garbagesort:addr:add")
    @Log(title = "用户地址查询", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserAddr userAddr)
    {
        return toAjax(userAddrService.insertUserAddr(userAddr));
    }

    /**
     * 修改用户地址查询
     */
    @GetMapping("/edit/{addrId}")
    public String edit(@PathVariable("addrId") Long addrId, ModelMap mmap)
    {
        UserAddr userAddr = userAddrService.selectUserAddrById(addrId);
        mmap.put("userAddr", userAddr);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户地址查询
     */
    @RequiresPermissions("garbagesort:addr:edit")
    @Log(title = "用户地址查询", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserAddr userAddr)
    {
        return toAjax(userAddrService.updateUserAddr(userAddr));
    }

    /**
     * 删除用户地址查询
     */
    @RequiresPermissions("garbagesort:addr:remove")
    @Log(title = "用户地址查询", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userAddrService.deleteUserAddrByIds(ids));
    }
}
