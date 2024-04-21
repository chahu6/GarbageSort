package cn.lxsir.uniapp.controller;

import cn.lxsir.uniapp.entity.GoodsDetail;
import cn.lxsir.uniapp.entity.Order;
import cn.lxsir.uniapp.service.GoodsDetailService;
import cn.lxsir.uniapp.service.OrderService;
import cn.lxsir.uniapp.service.RecyleInfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    RecyleInfoService recyleInfoService;

    @Autowired
    GoodsDetailService goodsDetailService;

    @PostMapping
    public R addOrder(@RequestBody Order order){
        String day = order.getAppointmentTime().substring(0, 2);
        String time = order.getAppointmentTime().substring(2);
        LocalDateTime now = LocalDateTime.now();
        if("明天".equals(day)){
            now = now.plusDays(1);
        }else if("后天".equals(day)){
            now = now.plusDays(2);
        }

        // 定义日期时间格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 格式化日期时间对象为字符串
        String formattedDateTime = now.format(formatter);
        time = time.replace('点', ':');
        String dateTime = formattedDateTime + ' ' + time;

        int length = dateTime.length() - 1;
        String newDateTiem = dateTime.substring(0, length);

        order.setAppointmentTime(newDateTiem);
        order.setOrderTime(LocalDateTime.now());
        if(orderService.save(order)){
            return R.ok("下单成功");
        }
        return R.failed("下单失败");
    }

    @GetMapping
    public R listOrders(@RequestParam("userId") Integer userId){
        List<Order> orderList = orderService.list(new QueryWrapper<Order>().eq("user_id", userId));
        return R.ok(orderList);
    }

    @GetMapping("/recycler")
    public R listRecyleOrders(@RequestParam("recyclerId") Integer recyclerId){
        List<Order> orderList = orderService.list(new QueryWrapper<Order>().eq("recycler_id", recyclerId));
        return R.ok(orderList);
    }

    @GetMapping("/status")
    public R listRecyleOrder(@RequestParam("status") Integer status){
        List<Order> orderList = orderService.list(new QueryWrapper<Order>().eq("status", status));
        if(!orderList.isEmpty()){
            return R.ok(orderList);
        }
        return R.failed("查询失败");
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable Integer id){
        Order order = orderService.getById(id);
        return R.ok(order);
    }

    @PutMapping
    public R updateById(@RequestBody Order order){
        if(order.getStatus() == 2){

        }

        if(orderService.updateById(order)){
            return R.ok("确认成功");
        }
        return  R.failed("确认失败");
    }

    @Transactional
    @PostMapping("/goods")
    public R addAndUpdateGoodsDetail(@RequestBody Map map){

        Integer id = Integer.parseInt((String) map.get("id"));
        Double weight = Double.parseDouble((String) map.get("weight"));
        Double unitPrice = Double.parseDouble((String) map.get("unitPrice"));

        Integer status = (Integer) map.get("status");

        Object amountObj = map.get("amount");
        double amount =  0;
        if (amountObj instanceof Integer) {
            amount = (double) (int) amountObj; // 将 int 转换为 double
        } else if (amountObj instanceof Double) {
            amount = (double) amountObj; // 直接使用 double 类型的值
        }
        String goodsName = (String) map.get("goodsName");

        Order order = new Order();
        order.setId(id);
        order.setStatus(status);

        GoodsDetail goodsDetail = new GoodsDetail();
        goodsDetail.setGoodsName(goodsName);
        goodsDetail.setOrderId(id);
        goodsDetail.setAmount(amount);
        goodsDetail.setWeight(weight);
        goodsDetail.setUnitPrice(unitPrice);

        orderService.updateById(order);
        goodsDetailService.save(goodsDetail);

        return R.ok("确认成功");
    }

    @Transactional
    @PostMapping("/taking")
    public R takingOrder(@RequestBody Order order) {
        if(orderService.updateById(order)){
            return R.ok("确认成功");
        }
        return  R.failed("确认失败");
    }

    @GetMapping("/goods")
    public R getGoodsDetail(@RequestParam("id") Integer orderId){
        GoodsDetail goodsDetail = goodsDetailService.getOne(new QueryWrapper<GoodsDetail>().eq("order_id", orderId));
        if(goodsDetail != null){
            return R.ok(goodsDetail);
        }
        return R.failed("查询失败");
    }
}
