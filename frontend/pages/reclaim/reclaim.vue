<template>
	<view class="content">
		<view class="dinwei_baox">
			<u-icon name="map-fill" top="2px" size="36"></u-icon>
			<text>{{ CityName === ProvinceName ? CityName : ProvinceName + ' ' + CityName }} {{ CountyName }}</text>
		</view>
		<view class="topPhotoBox">
			<view class="car_box"></view>
			<view class="treequan"></view>
		</view>
		<view class="gongao_icon_box">
			<view class="icon_box">
				<view class="cela icon_cel_1">
					<text>累计积分</text>
					<view class="jiacu_text consola_Coolc">19800</view>
				</view>
				<view class="cela icon_cel_2">
					<text>累计回收</text>
					<view class="jiacu_text consola_Coolc">19800</view>
				</view>
				<view class="cela icon_cel_3">
					<text>累计收益</text>
					<view class="jiacu_text consola_Coolc">19800</view>
				</view>
			</view>
			<u-notice-bar mode="vertical" @click="noticeLink" :list="noticeList" type="none"></u-notice-bar>
		</view>
		<view class="bannerBox">
			<u-swiper :list="bannerlist"></u-swiper>
		</view>
		<view class="contentBody">
			<u-section title="回收品类" lineColor="#6fd98e" :right="false"></u-section>
			<view class="class_boxs">
				<view class="cols color_1_icon" @click="$u.urlskip('/pages/user/postOrder?type=zhipi', 'navigateTo');">
					<view class="subName">纸皮类</view>
					<view class="subTitle">
						<text>报纸</text>
						<text>废纸</text>
						<text>纸箱等</text>
					</view>
					<view class="order_btn"></view>
					<view class="r_icon"></view>
				</view>
				<view class="cols color_2_icon" @click="$u.urlskip('/pages/user/postOrder?type=yiwu', 'navigateTo');">
					<view class="subName">衣物&其它</view>
					<view class="subTitle">
						<text>衣服</text>
						<text>玻璃</text>
						<text>家具</text>
						<text>家电等</text>
					</view>
					<view class="order_btn"></view>
					<view class="r_icon"></view>
				</view>
				<view class="cols color_3_icon"
					@click="$u.urlskip('/pages/user/postOrder?type=jingshu', 'navigateTo');">
					<view class="subName">金属类</view>
					<view class="subTitle">
						<text>铁</text>
						<text>铜</text>
						<text>铝等</text>
					</view>
					<view class="order_btn"></view>
					<view class="r_icon"></view>
				</view>
				<view class="cols color_4_icon"
					@click="$u.urlskip('/pages/user/postOrder?type=shuliao', 'navigateTo');">
					<view class="subName">塑料类</view>
					<view class="subTitle">
						<text>各类塑料制品</text>
					</view>
					<view class="order_btn"></view>
					<view class="r_icon"></view>
				</view>
			</view>
			<u-section title="附近回收员" lineColor="#6fd98e" subTitle="查看更多"></u-section>
		</view>
		<view class="mapBox">

		</view>
		<u-tabbar :list="tabbar" activeColor="#00a73b" :before-switch="beforeSwitch" inactiveColor="#c9c9c9"
			:midButton="true" :midColor="true">
		</u-tabbar>

		<u-popup v-model="postOrder" borderRadius="30" mode="bottom">
			<view class="maskOrderBox">
				<view class="itemBox">
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=zhipi', 'navigateTo');">
						<view class="icon_1">
							<view class="icv"></view>
						</view>
						<text>纸皮类</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=yiwu', 'navigateTo');">
						<view class="icon_2">
							<view class="icv"></view>
						</view>
						<text>衣物&其它</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=jingshu', 'navigateTo');">
						<view class="icon_3">
							<view class="icv"></view>
						</view>
						<text>金属类</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=shuliao', 'navigateTo');">
						<view class="icon_4">
							<view class="icv"></view>
						</view>
						<text>塑料类</text>
					</view>
				</view>
				<view class="close_box" @click="closePostOrder">
					<u-icon name="close" color="#000000" size="30"></u-icon>
				</view>
			</view>
		</u-popup>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				postOrder: false,
				CityName: '',
				CountyName: '',
				ProvinceName: '',

				tabbar: '',

				noticeList: [
					'寒雨连江夜入吴',
					'平明送客楚山孤',
					'洛阳亲友如相问',
					'一片冰心在玉壶'
				],
				bannerlist: [{
						image: 'https://cdn.uviewui.com/uview/swiper/1.jpg',
						title: '昨夜星辰昨夜风，画楼西畔桂堂东'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/2.jpg',
						title: '身无彩凤双飞翼，心有灵犀一点通'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/3.jpg',
						title: '谁念西风独自凉，萧萧黄叶闭疏窗，沉思往事立残阳'
					}
				],
			}
		},
		methods: {
			noticeLink() {
				console.log("点击了公告");
			},
			beforeSwitch(index) {
				if (index == 2) {
					this.postOrder = true;
					return false;
				} else {
					return true;
				}
			},
			closePostOrder() {
				this.postOrder = false;
			},
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
								console.log("城市:" + CityName)
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
							'title': '数据获取失败！为什么呢？？？',
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
			this.tabbar = getApp().globalData.tabbar
		}
	}
</script>

<style lang="scss" scoped>
	.dinwei_baox {
		width: 750rpx;
		margin-top: 44rpx;
		position: absolute;
		left: 0px;
		color: #ffffff;
		padding: 0 28rpx;
		z-index: 99;
		justify-content: flex-start;
		align-items: center;

		text {
			padding-left: 8rpx;
			font-size: 28rpx;
		}
	}

	.topPhotoBox {
		width: 750rpx;
		height: 500rpx;
		background: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/index_bg.jpg') no-repeat;
		background-size: 100% auto;
		overflow: hidden;
		position: relative;

		.car_box {
			width: 389rpx;
			height: 215rpx;
			background: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/car.png') no-repeat;
			background-size: 100% auto;
			position: absolute;
			bottom: 70rpx;
			left: 50%;
			margin-left: -195rpx;
			animation: move 1.667s linear infinite;
		}

		.treequan {
			width: 750rpx;
			height: 750rpx;
			background: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/tree.png') no-repeat;
			background-size: 100% auto;
			position: absolute;
			left: 0px;
			right: 0px;
			top: 360rpx;
			animation: 12s linear infinite ROTATE;
		}
	}

	.gongao_icon_box {
		width: 694rpx;
		height: 200rpx;
		background: #ffffff;
		border-radius: 20rpx;
		z-index: 99;
		margin-top: -60rpx;
		position: absolute;
		left: 28rpx;
		box-shadow: 0 0 5px #dedede;

		.icon_box {
			width: 694rpx;
			justify-content: space-around;
			display: flex;
			border-bottom: 1px solid #eeeeee;
			align-items: center;
			padding: 20rpx;

			.cela {
				width: 220rpx;
				height: 84rpx;
				padding-left: 92rpx;
				text-align: left;
				background-repeat: no-repeat;
				background-size: 84rpx 84rpx;
				background-position: 0 top;
				box-sizing: border-box;

				text {
					color: #999999;
					font-size: 24rpx;
				}

				.jiacu_text {
					font-size: 32rpx;
					font-weight: bolder;
					color: #000000;
				}
			}

			.icon_cel_1 {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/i-t-1.png');
			}

			.icon_cel_2 {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/i-t-2.png');
			}

			.icon_cel_3 {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/i-t-3.png');
			}
		}
	}

	.bannerBox {
		width: 694rpx;
		padding-top: 170rpx;
		padding-bottom: 26rpx;
		margin: 0 auto;
	}

	.class_boxs {
		width: 100%;
		justify-content: space-between;
		display: flex;
		flex-flow: row wrap;
		padding-top: 24rpx;

		.cols {
			width: 335rpx;
			height: 200rpx;
			padding: 24rpx 160rpx 24rpx 30rpx;
			border-radius: 16rpx;
			margin-bottom: 24rpx;
			position: relative;

			.subName {
				font-size: 30rpx;
				font-weight: bolder;
				color: #ffffff;
				padding-bottom: 8rpx;
			}

			.subTitle {
				font-size: 24rpx;
				color: #ffffff;

				text {
					padding-right: 12rpx;
				}
			}

			.order_btn {
				width: 103rpx;
				height: 31rpx;
				background: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/order_btn.png') no-repeat;
				background-size: 100% auto;
				position: absolute;
				left: 30rpx;
				bottom: 24rpx;
			}

			.r_icon {
				width: 160rpx;
				height: 200rpx;
				position: absolute;
				right: 0rpx;
				top: 0rpx;
				background-position: center;
				background-repeat: no-repeat;
				background-size: auto 140rpx;
			}
		}

		.color_1_icon {
			background: linear-gradient(to right, #76dc8f, #16b281);

			.r_icon {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/class_icon/class_1.png');
				background-size: 110rpx 130rpx;
			}
		}

		.color_2_icon {
			background: linear-gradient(to right, #92dbff, #2eb5ff);

			.r_icon {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/class_icon/class_2.png');
				background-size: 120rpx 130rpx;
			}
		}

		.color_3_icon {
			background: linear-gradient(to right, #b5cef1, #8eaad7);

			.r_icon {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/class_icon/class_3.png');
			}
		}

		.color_4_icon {
			background: linear-gradient(to right, #ffb43f, #ff8a00);

			.r_icon {
				background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/class_icon/class_4.png');
			}
		}
	}

	.mapBox {
		margin-top: 20rpx;
		width: 750rpx;
		height: 500rpx;
		overflow: hidden;
	}
</style>