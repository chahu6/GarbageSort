package com.ruoyi.project.garbagesort.userInfo.controller;

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
import com.ruoyi.project.garbagesort.userInfo.domain.UserInf;
import com.ruoyi.project.garbagesort.userInfo.service.IUserInfService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 用户信息查询Controller
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Controller
@RequestMapping("/garbagesort/userInfo")
public class UserInfController extends BaseController
{
    private String prefix = "garbagesort/userInfo";

    @Autowired
    private IUserInfService userInfService;

    @RequiresPermissions("garbagesort:userInfo:view")
    @GetMapping()
    public String userInfo()
    {
        return prefix + "/userInfo";
    }

    /**
     * 查询用户信息查询列表
     */
    @RequiresPermissions("garbagesort:userInfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserInf userInf)
    {
        startPage();
        List<UserInf> list = userInfService.selectUserInfList(userInf);
        return getDataTable(list);
    }

    /**
     * 导出用户信息查询列表
     */
    @RequiresPermissions("garbagesort:userInfo:export")
    @Log(title = "用户信息查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserInf userInf)
    {
        List<UserInf> list = userInfService.selectUserInfList(userInf);
        ExcelUtil<UserInf> util = new ExcelUtil<UserInf>(UserInf.class);
        return util.exportExcel(list, "用户信息查询数据");
    }

    /**
     * 新增用户信息查询
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户信息查询
     */
    @RequiresPermissions("garbagesort:userInfo:add")
    @Log(title = "用户信息查询", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserInf userInf)
    {
        return toAjax(userInfService.insertUserInf(userInf));
    }

    /**
     * 修改用户信息查询
     */
    @GetMapping("/edit/{infId}")
    public String edit(@PathVariable("infId") Long infId, ModelMap mmap)
    {
        UserInf userInf = userInfService.selectUserInfById(infId);
        mmap.put("userInf", userInf);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户信息查询
     */
    @RequiresPermissions("garbagesort:userInfo:edit")
    @Log(title = "用户信息查询", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserInf userInf)
    {
        return toAjax(userInfService.updateUserInf(userInf));
    }

    /**
     * 删除用户信息查询
     */
    @RequiresPermissions("garbagesort:userInfo:remove")
    @Log(title = "用户信息查询", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userInfService.deleteUserInfByIds(ids));
    }
}
