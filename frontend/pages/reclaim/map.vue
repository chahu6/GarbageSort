<template>
	<view class="box">
		<view class="ynq-Location">
			当前城市是：{{ CityName === ProvinceName ? CityName : ProvinceName + ' ' + CityName }} {{ CountyName }}
		</view>
		<view>
			头像<image :src="avatarUrl" mode=""></image>
		</view>
		<view>
			名字:{{nickName}}
		</view>
		<button class="button" open-type="getUserInfo" @click="getUserProfile">一键登录</button>
		<button style="margin-top: 40rpx;" class="button" open-type="getUserInfo" @tap="get_Location()">获取地址</button>
	</view>
</template>

<script>
	import reclaim from './reclaim.vue';
	export default {
		data() {
			return {
				CityName: '',
				CountyName: '',
				ProvinceName: '',
				nickName: '',
				avatarUrl: '',
				src: 'https://tz.lcduoduo.com/static/index_zsp.mp4',
				iteming: "https://tz.lcduoduo.com/static/image/index_sp_fm.png"
			}
		},

		methods: {
			test: function() {
				var self = this;
				uni.chooseVideo({
					sourceType: ['camera', 'album'],
					success: function(res) {
						self.src = res.tempFilePath;
					}
				});
			},
			get_Location() {
				uni.navigateTo({
					url: '/pages/Location/Location'
				})
			},
			//获得城市缓存
			getCityName() {
				let _that = this;
				setTimeout(function() {
					uni.getStorage({
						key: 'Province_Name',
						success(res) {
							_that.ProvinceName = res.data
						}
					})
					uni.getStorage({
						key: 'City_Name',
						success(res) {
							_that.CityName = res.data
						}
					})
					uni.getStorage({
						key: 'County_Name',
						success(res) {
							_that.CountyName = res.data
						}
					})
				}, 500)
			},

			getUserProfile() {
				let self = this;
				// 获取用户信息
				uni.getUserProfile({
					desc: "获取称呼、头像",
					success: function(infoRes) {
						console.log('用户昵称为：', infoRes);
						self.nickName = infoRes.userInfo.nickName
						self.avatarUrl = infoRes.userInfo.avatarUrl
						uni.login({
							provider: 'weixin',
							success: function(loginRes) {
								console.log("code", loginRes);

							}
						});
					},
				});

			},
			//获取定位
			getLocationAuth() {
				let that = this;
				uni.getLocation({
					type: 'gcj02',
					geocode: true,
					success(res) {
						console.log("位置信息", res);
						let lat = res.latitude;
						let lng = res.longitude;
						console.log(res.latitude);
						console.log(res.longitude);

						let key =
							'BHCBZ-XZ66B-VWIUG-NON65-4HDZ2-BNB6T'; //申请地址：https://lbs.qq.com/dev/console/application/mine
						uni.request({
							url: 'https://apis.map.qq.com/ws/geocoder/v1/?location=' + lat + ',' + lng +
								'&key=' + key,
							method: "GET",
							success(ress) {
								let data = ress.data; //获取到所有定位的数据
								let ProvinceName = ress.data.result.address_component.province;
								let CityName = ress.data.result.address_component.city;
								let CountyName = ress.data.result.address_component.district;
								console.log(ress)
								console.log(CityName)
								uni.setStorage({
									key: 'Province_Name', // 使用不同的key存储区县信息  
									data: ProvinceName
								})
								uni.setStorage({
									key: 'City_Name',
									data: CityName
								})
								uni.setStorage({
									key: 'County_Name', // 使用不同的key存储区县信息  
									data: CountyName
								})

							},
							fail() {
								uni.showToast({
									'title': '数据获取失败,请重试！',
									'icon': 'none'
								})
							}
						})
					},
					fail(res) {
						uni.showToast({
							'title': '数据获取失败,请重试！',
							'icon': 'none'
						})
					}
				})
			}


		},
		onShow() {
			this.getCityName()
		},
		onLoad() {
			this.getLocationAuth()

		}
	}
</script>

<style lang="scss" scoped>
	.ynq-Location {
		padding: 50px 100px;
	}

	.button {
		line-height: 80rpx;
		color: #fff;
		font-size: 40rpx;
		text-align: center;
		margin-left: 10%;
		width: 80%;
		height: 80rpx;
		background-color: green;
		border-radius: 50rpx;
	}
</style>