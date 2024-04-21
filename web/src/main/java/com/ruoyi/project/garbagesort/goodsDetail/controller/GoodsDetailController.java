package com.ruoyi.project.garbagesort.goodsDetail.controller;

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
import com.ruoyi.project.garbagesort.goodsDetail.domain.GoodsDetail;
import com.ruoyi.project.garbagesort.goodsDetail.service.IGoodsDetailService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 物品详情查询Controller
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Controller
@RequestMapping("/garbagesort/goodsDetail")
public class GoodsDetailController extends BaseController
{
    private String prefix = "garbagesort/goodsDetail";

    @Autowired
    private IGoodsDetailService goodsDetailService;

    @RequiresPermissions("garbagesort:goodsDetail:view")
    @GetMapping()
    public String goodsDetail()
    {
        return prefix + "/goodsDetail";
    }

    /**
     * 查询物品详情查询列表
     */
    @RequiresPermissions("garbagesort:goodsDetail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(GoodsDetail goodsDetail)
    {
        startPage();
        List<GoodsDetail> list = goodsDetailService.selectGoodsDetailList(goodsDetail);
        return getDataTable(list);
    }

    /**
     * 导出物品详情查询列表
     */
    @RequiresPermissions("garbagesort:goodsDetail:export")
    @Log(title = "物品详情查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(GoodsDetail goodsDetail)
    {
        List<GoodsDetail> list = goodsDetailService.selectGoodsDetailList(goodsDetail);
        ExcelUtil<GoodsDetail> util = new ExcelUtil<GoodsDetail>(GoodsDetail.class);
        return util.exportExcel(list, "物品详情查询数据");
    }

    /**
     * 新增物品详情查询
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存物品详情查询
     */
    @RequiresPermissions("garbagesort:goodsDetail:add")
    @Log(title = "物品详情查询", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(GoodsDetail goodsDetail)
    {
        return toAjax(goodsDetailService.insertGoodsDetail(goodsDetail));
    }

    /**
     * 修改物品详情查询
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        GoodsDetail goodsDetail = goodsDetailService.selectGoodsDetailById(id);
        mmap.put("goodsDetail", goodsDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存物品详情查询
     */
    @RequiresPermissions("garbagesort:goodsDetail:edit")
    @Log(title = "物品详情查询", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(GoodsDetail goodsDetail)
    {
        return toAjax(goodsDetailService.updateGoodsDetail(goodsDetail));
    }

    /**
     * 删除物品详情查询
     */
    @RequiresPermissions("garbagesort:goodsDetail:remove")
    @Log(title = "物品详情查询", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(goodsDetailService.deleteGoodsDetailByIds(ids));
    }
}
