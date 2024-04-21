<template>
	<view>
		<u-cell-group>
			<u-cell-item title="头像" @click='changeHead'>
				<u-image width='100rpx' height='100rpx' slot="right-icon" :src="headImg" shape="circle"></u-image>
			</u-cell-item>
			<u-cell-item title="昵称" @click="changeNickname">{{nickname}}</u-cell-item>
			<u-cell-item title="性别" :value="sex" @click='selectSex'></u-cell-item>
			<!-- <u-cell-item title="出生日期" :value="birthday" @click='show=true'></u-cell-item> -->
			<u-cell-item title="手机话" :value="phone" :arrow="false"></u-cell-item>
			<!-- <u-cell-item title="常居地" :value="address" @click='showAddr=true'></u-cell-item> -->
<!-- 			<u-cell-item title="个人简介" >
				<view class="u-line-1 u-p-l-30">
					{{profile}}
				</view>
			</u-cell-item> -->
		</u-cell-group>
		<!-- <u-calendar v-model="show" @change="change"></u-calendar> -->
		<!-- <u-picker mode="region" v-model="showAddr" :area-code='["21", "2101", "210103"]' @confirm='selectAddr'></u-picker> -->
	</view>
</template>

<script>
	export default {
		data() {
			return {
				nickname: '微信用户',
				headImg:'/static/logo.png',
				sex: '男',
				// birthday: '2021-02-23',
				// show: false,
				// address:'辽宁省-沈阳市-沈河区',
				// profile:'欢迎加扣群(325021815)交流学习',
				// showAddr:false,
				phone: '19839715890'
			}
		},
		created() {
		    this.fetchData();
		},
		mounted(){
			
		},
		// beforeRouteEnter(to, from, next) {
		//   // 在进入路由前刷新数据
		//   next(vm => {
		//     vm.refreshData();
		//   });
		// },
		onShow(){
			const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
			this.sex = userInfo.gender;
			this.nickname = userInfo.nickname;
			this.phone = userInfo.phone;
			this.headImg = userInfo.avatar
		},
		methods: {
			fetchData(){
				let me = this;
				
				const userId = uni.getStorageSync('userId')
				const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
				console.log(userInfo)
				if(userInfo === null){
					uni.request({
						url: me.serverUrl + "/user/info",
						method: "GET",
						data:{
							userId: userId
						},
						success(res) {
							console.log("success :", res.data);
							let data = res.data.data
							
							me.sex = data.gender;
							me.nickname = data.nickname;
							me.phone = data.phone
						},
						fail(e){
							console.log("error: ", e);
						}
					})
				}else{
					me.sex = userInfo.gender;
					me.nickname = userInfo.nickname;
					me.phone = userInfo.phone;
				}
			},
			changeHead(){
				let me = this;
				
				uni.chooseImage({
				    count: 1, 
				    success: (res)=> {
						const tempFilePath = res.tempFilePaths[0];
						// me.headImg = tempFilePath
						const userId = uni.getStorageSync('userId')
						uni.uploadFile({
							url: `${me.serverUrl}/file/upload/${userId}`,
							filePath: tempFilePath,
							name: 'file',
							success(res) {
								console.log(res.data)
								const data = JSON.parse(res.data)
								me.headImg = data.data
								const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
								userInfo.avatar = data.data
								uni.setStorageSync('userInfo', JSON.stringify(userInfo))
							},
							fail(res) {
								console.log(res.data)
							}	
						});

				    }
				});
			},
			selectSex() {
				let me = this;
				const userId = JSON.parse(uni.getStorageSync('userId'))
				
				const arr = ['男', '女', '保密']
				uni.showActionSheet({
					itemList: arr,
					success: (res) => {
						let gender = arr[res.tapIndex]
						
						uni.request({
							url: me.serverUrl + "/user",
							method: "PUT",
							data:{
								userId: userId,
								gender: gender
							},
							success(res) {
								console.log("success :", res.data);
								let data = res.data.data
								if(res.data.code >= 0){
									// this.newNickname = data.nickname
									me.sex = gender
									
									const userInfo = JSON.parse(uni.getStorageSync('userInfo'))
									userInfo.gender = gender
									console.log('gender: ' + gender)
									uni.setStorageSync('userInfo', JSON.stringify(userInfo))
									
									uni.showToast({
										title: "修改成功"
									});
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
					fail: function(res) {
						console.log(res.errMsg);
					}
				});
			},
			// change(e) {
			// 	this.birthday = e.result
			// },
			// selectAddr(e){
			// 	console.log(e)
			// 	this.address = `${e.province.label}-${e.city.label}-${e.area.label}`
			// },
			changeNickname(){
				uni.setStorageSync('nickname', this.nickname)
				this.$u.urlskip('/pages/user/nickname', 'navigateTo');
			}
		}
	}
</script>

<style>

</style>
