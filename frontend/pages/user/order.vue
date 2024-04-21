<template>
	<view class="wrap">
		<view class="u-tabs-box" style="border-bottom: 1px solid #eeeeee;">
			<u-tabs-swiper activeColor="#00a73b" ref="tabs" :list="list" :current="current" @change="change"
				:is-scroll="false" swiperWidth="750"></u-tabs-swiper>
		</view>

		<swiper class="swiper-box" :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish">
			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="sblist" @scrolltolower="reachBottom">

					<view class="order_list" @click="goToOrderShow(res.id)"
						v-for="(res, index) in orderServiceList" :key="res.id">
						<view class="title">
							<text class="type">{{res.type}}</text>
							<!-- <text class="state"> -->
								<u-tag :text="getTagText(res.status)" mode="dark" shape="circle" type="success" />
							<!-- </text> -->
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
							<view class="btns">
								<u-button type="success" shape="circle" size="medium" @click="cancel(res.id)">取消预约</u-button>
							</view>
						</view>
					</view>
					<u-loadmore :status="loadStatus[0]" margin-top="40" margin-bottom="40"
						bgColor="#eeeeee"></u-loadmore>
				</scroll-view>
			</swiper-item>
			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="sblist" style="height: 100%;width: 100%;" @scrolltolower="reachBottom">

					<view class="order_list" v-for="(res, index) in orderCompletedList" :key="res.id">
						<view class="title">
							<text class="type">{{res.type}}</text>
							<!-- <text class="state"> -->
								<u-tag text="已完成" mode="dark" shape="circle" type="default" />
							<!-- </text> -->
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
						</view>
					</view>

					<u-loadmore :status="loadStatus[1]" margin-top="40" margin-bottom="40"
						bgColor="#eeeeee"></u-loadmore>
				</scroll-view>
			</swiper-item>

			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="sblist" style="height: 100%;width: 100%;" @scrolltolower="reachBottom">

					<view class="order_list" v-for="(res, index) in orderCancelList" :key="res.id">
						<view class="title">
							<text class="type">{{res.type}}</text>
							<!-- <text class="state"> -->
								<u-tag text="已取消" mode="dark" shape="circle" type="default" />
							<!-- </text> -->
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
						</view>
					</view>

					<u-loadmore :status="loadStatus[1]" margin-top="40" margin-bottom="40"
						bgColor="#eeeeee"></u-loadmore>
				</scroll-view>
			</swiper-item>
		</swiper>

	</view>
</template>

<script>
	export default {
		data() {
			return {
				postOrder: false,
				list: [{
						name: '服务中'
					},
					{
						name: '已完成'
					},
					{
						name: '已取消'
					}
				],
				current: 0,
				swiperCurrent: 0,
				dx: 0,
				loadStatus: ['loadmore', 'loadmore'],
				orderList: [],
				orderServiceList: [],
				orderCompletedList: [],
				orderCancelList: [],
			}
		},
		onLoad() {

		},
		onShow() {
			this.getorderList();
		},
		onReady() {
			
		},
		methods: {
			beforeSwitch(index) {
				if (index == 2) {
					this.postOrder = true;
					return false;
				} else {
					return true;
				}
			},
			reachBottom() {

			},
			getTagText(status) {
				switch (status) {
					case 1:
						return "待接单";
					case 2:
						return "已完成";
					case 3:
						return "已取消";
					case 4:
						return "已接单"
					case 5:
						return "回收员确认"
					default:
						return "未知状态";
				}
			},
			closePostOrder() {
				this.postOrder = false;
			},
			// tab栏切换
			change(index) {
				this.swiperCurrent = index;
				this.getorderList()
			},
			transition({
				detail: {
					dx
				}
			}) {
				this.$refs.tabs.setDx(dx);
			},
			animationfinish({
				detail: {
					current
				}
			}) {
				this.$refs.tabs.setFinishCurrent(current);
				this.swiperCurrent = current;
				this.current = current;
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
							me.orderList = data
							me.getOrderServiceList();
							me.getOrderCompletedList();
							me.getOrderCancelList();
						}
					},
					fail(res) {
				
					}
				})
			},
			getOrderCompletedList(){
				this.orderCompletedList = this.orderList.filter(item => item.status === 2);
			},
			getOrderCancelList(){
				this.orderCancelList = this.orderList.filter(item => item.status === 3);
			},
			getOrderServiceList(){
				this.orderServiceList = this.orderList.filter(item => item.status === 1 || item.status === 4 || item.status === 5);
			},
			goToOrderShow(id){
				// 使用字符串模板构建跳转链接
				const url = `/pages/user/order_show?id=${id}`;
				this.$u.urlskip(url, 'navigateTo');
			},
			cancel(id){
				let me = this;
				uni.request({
					url: me.serverUrl + '/order',
					method: 'PUT',
					data:{
						id,
						status: 3
					},
					success(res) {
						if(res.data.code === 0){
							uni.showToast({
								title: "取消成功"
							});
							me.change(2)
						}
					},
					fail(e) {
						
					}
				})
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
		height: 100%;
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