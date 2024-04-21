package cn.lxsir.uniapp.controller;

import cn.lxsir.uniapp.entity.UserAddress;
import cn.lxsir.uniapp.service.UserAddressService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/addr")
public class UserAddressController {

    @Autowired
    UserAddressService userAddressService;

    @Transactional
    @PostMapping
    public R addUserAddress(@RequestBody UserAddress userAddress) {
        if(userAddress.getIsDefault() == 1){
            UserAddress updateUserAddress = new UserAddress();
            updateUserAddress.setIsDefault(0);
            updateUserAddress.setModifiedTime(LocalDateTime.now());
            userAddressService.update(updateUserAddress, new QueryWrapper<UserAddress>().eq("is_default", 1));
        }
        userAddress.setModifiedTime(LocalDateTime.now());
        if(userAddressService.save(userAddress)){
            return R.ok("添加成功");
        }

        return R.failed("添加失败");
    }

    @DeleteMapping("/{id}")
    public R delUserAddress(@PathVariable("id") Integer id) {
        if(userAddressService.removeById(id)){
            return R.ok("删除成功");
        }
        return R.failed("删除失败");
    }

    @Transactional
    @PutMapping
    public R updateUserAddress(@RequestBody UserAddress userAddress) {
        if(userAddress.getIsDefault() == 1){
            UserAddress updateUserAddress = new UserAddress();
            updateUserAddress.setIsDefault(0);
            updateUserAddress.setModifiedTime(LocalDateTime.now());
            userAddressService.update(updateUserAddress, new QueryWrapper<UserAddress>().eq("is_default", 1));
        }
        userAddress.setModifiedTime(LocalDateTime.now());
        if(userAddressService.updateById(userAddress)){
            return R.ok("修改成功");
        }
        return R.failed("修改失败");
    }

    @GetMapping("/{id}")
    public R findUserAddressById(Integer id) {
        UserAddress byId = userAddressService.getById(id);
        return R.ok(byId);
    }

    @GetMapping
    public R getAllUserAddress(@RequestParam("userId") Integer userId) {
        return R.ok(userAddressService.list(new QueryWrapper<UserAddress>().eq("user_id", userId)));
    }

    @GetMapping("/default/{userId}")
    public R getDefaultAddress(@PathVariable Integer userId){
        UserAddress one = userAddressService.getOne(new QueryWrapper<UserAddress>().eq("user_id", userId).eq("is_default", 1));
        if(one != null){
            return R.ok(one);
        }
        return R.failed("无默认地址");
    }
}
