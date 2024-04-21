package com.ruoyi.project.garbagesort.goodsDetail.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.garbagesort.goodsDetail.mapper.GoodsDetailMapper;
import com.ruoyi.project.garbagesort.goodsDetail.domain.GoodsDetail;
import com.ruoyi.project.garbagesort.goodsDetail.service.IGoodsDetailService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 物品详情查询Service业务层处理
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Service
public class GoodsDetailServiceImpl implements IGoodsDetailService 
{
    @Autowired
    private GoodsDetailMapper goodsDetailMapper;

    /**
     * 查询物品详情查询
     * 
     * @param id 物品详情查询ID
     * @return 物品详情查询
     */
    @Override
    public GoodsDetail selectGoodsDetailById(Long id)
    {
        return goodsDetailMapper.selectGoodsDetailById(id);
    }

    /**
     * 查询物品详情查询列表
     * 
     * @param goodsDetail 物品详情查询
     * @return 物品详情查询
     */
    @Override
    public List<GoodsDetail> selectGoodsDetailList(GoodsDetail goodsDetail)
    {
        return goodsDetailMapper.selectGoodsDetailList(goodsDetail);
    }

    /**
     * 新增物品详情查询
     * 
     * @param goodsDetail 物品详情查询
     * @return 结果
     */
    @Override
    public int insertGoodsDetail(GoodsDetail goodsDetail)
    {
        return goodsDetailMapper.insertGoodsDetail(goodsDetail);
    }

    /**
     * 修改物品详情查询
     * 
     * @param goodsDetail 物品详情查询
     * @return 结果
     */
    @Override
    public int updateGoodsDetail(GoodsDetail goodsDetail)
    {
        return goodsDetailMapper.updateGoodsDetail(goodsDetail);
    }

    /**
     * 删除物品详情查询对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteGoodsDetailByIds(String ids)
    {
        return goodsDetailMapper.deleteGoodsDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除物品详情查询信息
     * 
     * @param id 物品详情查询ID
     * @return 结果
     */
    @Override
    public int deleteGoodsDetailById(Long id)
    {
        return goodsDetailMapper.deleteGoodsDetailById(id);
    }
}
