<template>
	<view class="wrap">
		<view class="u-tabs-box" style="border-bottom: 1px solid #eeeeee;">
			<scroll-view scroll-y class="sblist" style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
				
				<view class="order_list" @click="goToOrderShow(res.id)"
					v-for="(res, index) in orderList" :key="res.id">
					<view class="title">
						<text class="type">{{res.type}}</text>
						<text class="state">
							<u-tag text="已完成" mode="dark" shape="circle" type="default" v-if="res.status === 2"/>
							<u-tag text="已取消" mode="dark" shape="circle" type="info" v-if="res.status === 3"/>
						</text>
					</view>
					<view class="adds_box">
						<view class="adds">
							<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
							{{res.address}}
						</view>
						<view class="mobile">
							<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
							{{res.phone}}
						</view>
					</view>
					<view class="bottomBtn">
						<view class="yuyoutime">
							<text>预约时间</text>
							<text>{{res.appointmentTime}}</text>
						</view>
						<!-- <view class="yuyoutime" style="padding-top:14rpx;" v-if="res.status != 3">
							<text>回收价格</text>
							<b style="color:red;">￥99.6</b>
						</view> -->
					</view>
				</view>
				
				<u-loadmore :status="loadStatus[1]" margin-top="40" margin-bottom="40" bgColor="#eeeeee"></u-loadmore>
			</scroll-view>
		</view>
		
		<!-- <u-tabbar :list="tabbar" activeColor="#00a73b" :before-switch="beforeSwitch" inactiveColor="#c9c9c9" :midButton="true" :midColor="true"></u-tabbar> -->
		<u-popup v-model="postOrder" borderRadius="30" mode="bottom">
			<view class="maskOrderBox">
				<view class="itemBox">
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=zhipi', 'navigateTo');">
						<view class="icon_1"><view class="icv"></view></view>
						<text>纸皮类</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=yiwu', 'navigateTo');">
						<view class="icon_2"><view class="icv"></view></view>
						<text>衣物&其它</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=jingshu', 'navigateTo');">
						<view class="icon_3"><view class="icv"></view></view>
						<text>金属类</text>
					</view>
					<view class="itemS" @click="$u.urlskip('/pages/user/postOrder?type=shuliao', 'navigateTo');">
						<view class="icon_4"><view class="icv"></view></view>
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
				dx: 0,
				loadStatus: ['loadmore','loadmore'],
				orderList: [],
			}
		},
		onLoad() {
			console.log("onLoad")
		},
		onShow() {
			console.log("onShow")
			this.getorderList();
		},
		methods: {
			beforeSwitch(index) {
				if(index == 2)
				{
					this.postOrder = true;
					return false;
				}
				else 
				{
					return true;
				}
			},
			reachBottom() {

			},
			closePostOrder() {
				this.postOrder = false;
			},
			getorderList(){
				let me = this
				const userId = uni.getStorageSync('userId')
				uni.request({
					url: me.serverUrl + '/order',
					method: 'GET',
					data: {
						userId
					},
					success(res) {
						console.log(res.data)
						if (res.data.code === 0) {
							let data = res.data.data
							me.orderList = data.filter(item => item.status != 1)
						}
					},
					fail(res) {
				
					}
				})
			},
			goToOrderShow(id){
				// 使用字符串模板构建跳转链接
				const url = `/pages/user/order_detail?id=${id}`;
				this.$u.urlskip(url, 'navigateTo');
			},
		}
	}
</script>

<style>
page {
	/* #ifndef H5 */
	height: 100%;
	/* #endif */
	background-color: #eeeeee;
}
</style>

<style lang="scss" scoped>
.sblist {
	width: 100%;
	height:100%;
	padding: 0 28rpx 28rpx 28rpx;
}
.order_list {
	width: 694rpx;
	background: #ffffff;
	border-radius: 12rpx;
	margin-top: 28rpx;
	
	.title {
		width: 100%;
		padding: 28rpx;
		justify-content: space-between;
		display: flex;
		
		.type {
			font-size: 34rpx;
			color: #000000;
		}
	}
	.adds_box {
		padding: 0 28rpx;
		
		.u-icon {
			margin-right: 10rpx;
		}
		.adds {
			color: #666666;
			font-size: 28rpx;
			padding-bottom: 14rpx;
		}
		.mobile {
			color: #666666;
			font-size: 28rpx;
			padding-bottom: 28rpx;
		}
	}
	.bottomBtn {
		width: 694rpx;
		padding: 28rpx;
		border-top: 1px solid #eeeeee;
		
		.yuyoutime {
			width: 100%;
			color: #666666;
			display: flex;
			justify-content: space-between;
		}
		.btns {
			width: 100%;
			text-align: right;
			padding-top: 28rpx;
		}
	}
}	

.wrap {
	display: flex;
	flex-direction: column;
	height: calc(100vh - var(--window-top));
	width: 100%;
}
.swiper-box {
	flex: 1;
}
.swiper-item {
	height: 100%;
}
</style>