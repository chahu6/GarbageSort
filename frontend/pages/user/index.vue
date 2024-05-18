<template>
	<view class="content">
		<view class="user_top_box">
			
			<view class="user_top" @click="tourl('/pages/simple/login')" v-if="!hasUserInfo">
				<u-image width="160rpx" height="160rpx" :src="src" shape="circle"></u-image>
				<view class="userTextBox">
					<view class="userName">登录/注册</view>
				</view>
			</view>
			<view class="user_top" @click="tourl('/pages/user/profile')" v-else>
				<u-image width="160rpx" height="160rpx" :src="userInfo.avatar" shape="circle"></u-image>
				<view class="userTextBox">
					<view class="userName">{{userInfo.nickname}}</view>
					<text>加入收呗环保{{userInfo.day}}天</text>
				</view>
			</view>
			
			<view class="user_icon_box">
				<view class="icon_u icon_u_1">
					<view class="icon_1"></view>
					<text>回收物品</text>
					<view class="numBox">
						<b>0.00</b>
						千克
					</view>
				</view>
				<view class="icon_u icon_u_2">
					<view class="icon_2"></view>
					<text>减少碳排放</text>
					<view class="numBox">
						<b>0.00</b>
						千克
					</view>
				</view>
				<view class="icon_u icon_u_3">
					<view class="icon_3"></view>
					<text>保护树木</text>
					<view class="numBox">
						<b>10</b>
						棵
					</view>
				</view>
			</view>
		</view>
		<view class="u_cell_box">
			<u-cell-group>
				
				<u-cell-item icon="calendar-fill" iconSize="40" @click="tourl('/pages/user/service_order')"
					:iconStyle="{'color':'#00b362'}" title="回收订单" v-show="isRecyler">
					<u-badge count="2" :absolute="false" slot="right-icon"></u-badge>
				</u-cell-item>
				
				<u-cell-item icon="calendar-fill" iconSize="40" @click="tourl('/pages/user/order')"
					:iconStyle="{'color':'#00b362'}" title="服务中订单">
					<u-badge count="2" :absolute="false" slot="right-icon"></u-badge>
				</u-cell-item>
				<u-cell-item icon="order" iconSize="40" @click="tourl('/pages/user/history_order')"
					:iconStyle="{'color':'#da8bff'}" title="历史订单"></u-cell-item>
			</u-cell-group>
			<u-gap height="16" bg-color="#f5f5f5"></u-gap>
			<u-cell-group>
				<u-cell-item icon="map-fill" iconSize="46" @click="tourl('/pages/user/address')"
					:iconStyle="{'color':'#40cfff'}" title="地址管理"></u-cell-item>
				<u-cell-item icon="file-text-fill" iconSize="40" @click="tourl('/pages/user/account')"
					:iconStyle="{'color':'#ff4a9c'}" title="我的帐户"></u-cell-item>
<!-- 				<u-cell-item icon="plus-people-fill" iconSize="40" @click="tourl('/pages/user/promoter')"
					:iconStyle="{'color':'#44a7df'}" title="推广员招募"></u-cell-item> -->
				<u-cell-item icon="car-fill" iconSize="40" @click="tourl('/pages/user/recycler')"
					:iconStyle="{'color':'#4e82d4'}" title="回收员招募"></u-cell-item>
				<u-cell-item icon="chat-fill" iconSize="40" @click="tourl('/pages/user/feedback')"
					:iconStyle="{'color':'#1aa5dd'}" title="意见反馈"></u-cell-item>
				<u-cell-item icon="phone-fill" iconSize="40" @click="tourl('/pages/user/customer')"
					:iconStyle="{'color':'#ff804e'}" title="联系客服"></u-cell-item>
			</u-cell-group>
			<view class="contentBody">
				<u-button type="error" style="margin-top:20rpx;" :ripple="true" shape="circle" @click="logout">退出登录</u-button>
			</view>
		</view>

		<!-- tabbar -->
		<u-tabbar :list="tabbar" activeColor="#00a73b" :before-switch="beforeSwitch" inactiveColor="#c9c9c9"
			:midButton="true" :midColor="true">
		</u-tabbar>

		<!-- <u-popup v-model="postOrder" borderRadius="30" mode="bottom">
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
		</u-popup> -->
	</view>
</template>

<script>
	import listCell from '@/components/coolc_cell_list';
	export default {
		components: {
			listCell
		},
		data() {
			return {
				postOrder: false,
				tabbar: '',
				src: '../../static/coolc/pic/photo.png',
				hasUserInfo: false,
				userInfo:{
					nickname: '测试',
					day: 0,
					avatar: ''
				},
				isRecyler: false,
			}
		},
		onLoad() {
			this.tabbar = getApp().globalData.tabbar
		},
		onShow(){
			let me = this;
			const userId = uni.getStorageSync('userId');
			
			console.log(userId)
			// if(user === null){
				
			// }else{
			// 	this.updateUserInfo();
			// }
			
			uni.request({
				url: me.serverUrl + "/user/info",
				method: "GET",
				success(res) {
					console.log("success :", res.data);
					if(res.data.code === 0){
						let data = res.data.data
						
						uni.setStorageSync('userInfo', JSON.stringify(data));
						uni.setStorageSync('userId', data.userId)
						
						me.updateUserInfo();
						
						const userId = data.userId
						uni.request({
							url:me.serverUrl + '/user/status',
							method:'GET',
							data:{
								userId
							},
							success(res) {
								console.log(res.data);
								if(res.data.code === 0){
									let data = res.data.data
									me.isRecyler = data.userState === 1
								}
							}
						})
					}
				},
				fail(e){
					console.log("error: ", e);
				}
			})
		},
		methods: {
			tourl(url) {
				this.$u.urlskip(url, 'navigateTo');
				// if(this.hadlogin){
				// 	this.$u.urlskip(url, 'navigateTo');
				// }else{
				// 	this.$u.urlskip('/pages/simple/login', 'redirectTo');
				// }				
			},
			beforeSwitch(index) {
				// if (index == 2) {
				// 	this.postOrder = true
				// 	return false;
				// } else {
				// 	return true;
				// }
				return true;
			},
			closePostOrder() {
				this.postOrder = false;
			},
			updateUserInfo(){
				const info = uni.getStorageSync('userInfo')
				console.log(info)
				const userInfo = JSON.parse(info)
				
				this.userInfo.nickname = userInfo.nickname;
				
				this.hasUserInfo = true;
				
				// 给定时间
				const givenTime = new Date(userInfo.registerTime);
				
				// 当前时间
				const currentTime = new Date();
				
				// 将时间转换为时间戳（以毫秒为单位）
				const givenTimestamp = givenTime.getTime();
				const currentTimestamp = currentTime.getTime();
				
				// 计算时间差值（毫秒）
				const timeDiff = currentTimestamp - givenTimestamp;
				
				// 将时间差值转换为天数
				const daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
				
				console.log(daysDiff)
				this.userInfo.day = daysDiff;
				
				this.userInfo.avatar = userInfo.avatar
			},
			logout(){
				let me = this
				console.log('登出')
				uni.request({
					url: me.serverUrl + "/user/logout",
					method: "POST",
					success(res) {
						console.log("success :", res.data);
						let data = res.data.data
						// 清除所有本地存储数据
						uni.clearStorageSync();
						// window.location.reload()
						wx.reLaunch({
							url: '/pages/user/index'
						})
						uni.showToast({
							title: "退出成功"
						});
					},
					fail(e){
						console.log("error: ", e);
					}
				})
			}
		}
	}
</script>

<style>
	page {
		background: #f5f5f5;
	}
</style>

<style lang="scss" scoped>
	.user_top_box {
		width: 750rpx;
		height: 550rpx;
		padding: 0 28rpx;
		background: linear-gradient(to right, #21c790, #2ce7a5);

		.user_top {
			height: 320rpx;
			padding-top: 90rpx;
			justify-content: flex-start;
			display: flex;
			align-items: center;
			border-bottom: 1px solid rgba(255, 255, 255, 0.4);

			.u-image {
				border: 2px solid #ffffff;
				border-radius: 100% !important;
			}

			.userTextBox {
				padding-left: 30rpx;
				color: #ffffff;
				font-size: 24rpx;

				.userName {
					font-size: 36rpx;
					font-weight: bolder;
					padding-bottom: 10rpx;
					opacity: 1;
				}

				text {
					opacity: 0.6;
				}
			}
		}

		.user_icon_box {
			justify-content: space-between;
			display: flex;
			text-align: center;
			padding-top: 36rpx;

			.icon_u {
				width: 33.33%;
				color: #ffffff;

				text {
					padding-top: 8rpx;
					font-size: 24rpx;
				}

				.numBox {
					font-size: 24rpx;

					b {
						padding-right: 6rpx;
						font-size: 32rpx;
					}
				}

				.icon_1 {
					width: 100%;
					height: 84rpx;
					background-image: url('../../static/coolc/user_icon/u_1.png');
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}

				.icon_2 {
					width: 100%;
					height: 84rpx;
					background-image: url('../../static/coolc/user_icon/u_2.png');
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}

				.icon_3 {
					width: 100%;
					height: 84rpx;
					background-image: url('../../static/coolc/user_icon/u_3.png');
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}
			}
		}
	}
</style>