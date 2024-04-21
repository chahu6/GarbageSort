package com.ruoyi.project.garbagesort.goodsDetail.service;

import java.util.List;
import com.ruoyi.project.garbagesort.goodsDetail.domain.GoodsDetail;

/**
 * 物品详情查询Service接口
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public interface IGoodsDetailService 
{
    /**
     * 查询物品详情查询
     * 
     * @param id 物品详情查询ID
     * @return 物品详情查询
     */
    public GoodsDetail selectGoodsDetailById(Long id);

    /**
     * 查询物品详情查询列表
     * 
     * @param goodsDetail 物品详情查询
     * @return 物品详情查询集合
     */
    public List<GoodsDetail> selectGoodsDetailList(GoodsDetail goodsDetail);

    /**
     * 新增物品详情查询
     * 
     * @param goodsDetail 物品详情查询
     * @return 结果
     */
    public int insertGoodsDetail(GoodsDetail goodsDetail);

    /**
     * 修改物品详情查询
     * 
     * @param goodsDetail 物品详情查询
     * @return 结果
     */
    public int updateGoodsDetail(GoodsDetail goodsDetail);

    /**
     * 批量删除物品详情查询
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteGoodsDetailByIds(String ids);

    /**
     * 删除物品详情查询信息
     * 
     * @param id 物品详情查询ID
     * @return 结果
     */
    public int deleteGoodsDetailById(Long id);
}
