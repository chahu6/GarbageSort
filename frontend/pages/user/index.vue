<template>
	<view class="content">
		<view class="user_top_box">
			<view class="user_top" @click="tourl('/pages/simple/login')">
				<u-image width="160rpx" height="160rpx" :src="src"></u-image>
				<view v-if="!hasUserInfo" class="userTextBox">
					<view class="userName">登录/注册</view>
				</view>
				<view v-else>
					<view class="userName">liuyunxh</view>
					<text>加入收呗环保180天</text>
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
					:iconStyle="{'color':'#00b362'}" title="服务中订单">
					<u-badge count="2" :absolute="false" slot="right-icon"></u-badge>
				</u-cell-item>
				<u-cell-item icon="order" iconSize="40" @click="tourl('/pages/user/order')"
					:iconStyle="{'color':'#da8bff'}" title="历史订单"></u-cell-item>
			</u-cell-group>
			<u-gap height="16" bg-color="#f5f5f5"></u-gap>
			<u-cell-group>
				<u-cell-item icon="map-fill" iconSize="46" @click="tourl('/pages/user/address')"
					:iconStyle="{'color':'#40cfff'}" title="地址管理"></u-cell-item>
				<u-cell-item icon="file-text-fill" iconSize="40" @click="tourl('/pages/user/account')"
					:iconStyle="{'color':'#ff4a9c'}" title="我的帐户"></u-cell-item>
				<u-cell-item icon="plus-people-fill" iconSize="40" @click="tourl('/pages/user/promoter')"
					:iconStyle="{'color':'#44a7df'}" title="推广员招募"></u-cell-item>
				<u-cell-item icon="car-fill" iconSize="40" @click="tourl('/pages/user/recycler')"
					:iconStyle="{'color':'#4e82d4'}" title="回收员招募"></u-cell-item>
				<u-cell-item icon="chat-fill" iconSize="40" @click="tourl('/pages/user/feedback')"
					:iconStyle="{'color':'#1aa5dd'}" title="意见反馈"></u-cell-item>
				<u-cell-item icon="phone-fill" iconSize="40" @click="tourl('/pages/user/customer')"
					:iconStyle="{'color':'#ff804e'}" title="联系客服"></u-cell-item>
			</u-cell-group>
			<view class="contentBody">
				<u-button type="error" style="margin-top:20rpx;" :ripple="true" shape="circle">退出登录</u-button>
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
				hasUserInfo : false,
				src: '../../static/coolc/pic/photo.png'
			}
		},
		onLoad() {

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
					background-image: url(~@/static/coolc/user_icon/u_1.png);
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}

				.icon_2 {
					width: 100%;
					height: 84rpx;
					background-image: url(~@/static/coolc/user_icon/u_2.png);
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}

				.icon_3 {
					width: 100%;
					height: 84rpx;
					background-image: url(~@/static/coolc/user_icon/u_3.png);
					background-repeat: no-repeat;
					background-position: center;
					background-size: auto 84rpx;
					margin-bottom: 12rpx;
				}
			}
		}
	}
</style>