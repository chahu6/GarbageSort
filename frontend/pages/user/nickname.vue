<template>
  <view class="container">
    <view class="form-group">
      <view class="form-label">新昵称：</view>
      <input class="form-input" type="text" v-model="newNickname" placeholder="请输入新的昵称" v-on:input="handleInput"/>
    </view>
    <view class="button-group">
      <button class="submit-button" @click="updateNickname" :disabled="isButtonDisabled">提交</button>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
		newNickname: '', // 用于存储用户输入的新昵称
		isButtonDisabled: true
    };
  },
  created() {
	  // this.newNickname = this.$route.params.nickname
	  const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
	  this.newNickname = userInfo.nickname
  },
  methods: {
    updateNickname() {
		let me = this;
		const userId = uni.getStorageSync('userId')
		
		uni.request({
			url: me.serverUrl + "/user",
			method: "PUT",
			data:{
				userId: userId,
				nickname: me.newNickname
			},
			success(res) {
				console.log("success :", res.data);
				let data = res.data.data
				if(res.data.code >= 0){
					const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
					userInfo.nickname = me.newNickname;
					uni.setStorageSync('userInfo', JSON.stringify(userInfo));
					me.isButtonDisabled = true
					uni.showToast({
						title: "修改成功"
					});
					// 跳转
					me.$router.go(-1)
				} else{
					uni.showToast({
						title: "修改失败",
						icon: "error"
					});
				}
			},
			fail(e){
				console.log("error: ", e);
				uni.showToast({
					title: "修改失败",
					icon: "error"
				});
			}
		})
    },
	handleInput(event) {
		console.log(event.target.value);
		this.isButtonDisabled = false
	}
  }
};
</script>

<style>
.container {
  padding: 20px;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  font-size: 16px;
  margin-bottom: 10px;
}

.form-input {
  width: 100%;
  height: 40px;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 0 10px;
}

.button-group {
  text-align: center;
}

.submit-button {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  cursor: pointer;
}
</style>
