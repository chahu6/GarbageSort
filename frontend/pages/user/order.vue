<template>
	<view class="wrap">
		<view class="u-tabs-box" style="border-bottom: 1px solid #eeeeee;">
			<u-tabs-swiper activeColor="#00a73b" ref="tabs" :list="list" :current="current" @change="change" :is-scroll="false" swiperWidth="750"></u-tabs-swiper>
		</view>
		
		<swiper class="swiper-box" :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish">
			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="sblist" @scrolltolower="reachBottom">
					
					<view class="order_list" @click="$u.urlskip('/pages/user/order_show?id=1', 'navigateTo');">
						<view class="title">
							<text class="type">纸皮类</text>
							<text class="state">
								<u-tag text="待接单" mode="dark" shape="circle" type="success" />
							</text>
						</view>
						<view class="adds_box">
							<view class="adds">
								<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
								山东省东营市东营区花园小区十号楼三单元5楼502室
							</view>
							<view class="mobile">
								<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
								19970861797
							</view>
						</view>
						<view class="bottomBtn">
							<view class="yuyoutime">
								<text>预约时间</text>
								<text>2021-05-18 18：00</text>
							</view>
							<view class="btns">
								<u-button type="success" shape="circle" size="medium">取消预约</u-button>
							</view>
						</view>
					</view>
					<view class="order_list" @click="$u.urlskip('/pages/user/order_show?id=1', 'navigateTo');">
						<view class="title">
							<text class="type">纸皮类</text>
							<text class="state">
								<u-tag text="待接单" mode="dark" shape="circle" type="success" />
							</text>
						</view>
						<view class="adds_box">
							<view class="adds">
								<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
								山东省东营市东营区花园小区十号楼三单元5楼502室
							</view>
							<view class="mobile">
								<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
								19970861797
							</view>
						</view>
						<view class="bottomBtn">
							<view class="yuyoutime">
								<text>预约时间</text>
								<text>2021-05-18 18：00</text>
							</view>
							<view class="btns">
								<u-button type="success" shape="circle" size="medium">取消预约</u-button>
							</view>
						</view>
					</view>
					
					<u-loadmore :status="loadStatus[0]" margin-top="40" margin-bottom="40" bgColor="#eeeeee"></u-loadmore>
				</scroll-view>
			</swiper-item>
			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="sblist" style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
					
					<view class="order_list">
						<view class="title">
							<text class="type">纸皮类</text>
							<text class="state">
								<u-tag text="已完成" mode="dark" shape="circle" type="default" />
							</text>
						</view>
						<view class="adds_box">
							<view class="adds">
								<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
								山东省东营市东营区花园小区十号楼三单元5楼502室
							</view>
							<view class="mobile">
								<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
								19970861797
							</view>
						</view>
						<view class="bottomBtn">
							<view class="yuyoutime">
								<text>预约时间</text>
								<text>2021-05-18 18：00</text>
							</view>
							<view class="yuyoutime" style="padding-top:14rpx;">
								<text>回收价格</text>
								<b style="color:red;">￥99.6</b>
							</view>
						</view>
					</view>
					<view class="order_list">
						<view class="title">
							<text class="type">纸皮类</text>
							<text class="state">
								<u-tag text="拒接" mode="dark" shape="circle" type="error" />
							</text>
						</view>
						<view class="adds_box">
							<view class="adds">
								<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
								山东省东营市东营区花园小区十号楼三单元5楼502室
							</view>
							<view class="mobile">
								<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
								19970861797
							</view>
						</view>
						<view class="bottomBtn">
							<view class="yuyoutime">
								<text>预约时间</text>
								<text>2021-05-18 18：00</text>
							</view>
						</view>
					</view>
					<view class="order_list">
						<view class="title">
							<text class="type">纸皮类</text>
							<text class="state">
								<u-tag text="拒接" mode="dark" shape="circle" type="error" />
							</text>
						</view>
						<view class="adds_box">
							<view class="adds">
								<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
								山东省东营市东营区花园小区十号楼三单元5楼502室
							</view>
							<view class="mobile">
								<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
								19970861797
							</view>
						</view>
						<view class="bottomBtn">
							<view class="yuyoutime">
								<text>预约时间</text>
								<text>2021-05-18 18：00</text>
							</view>
						</view>
					</view>
					
					<u-loadmore :status="loadStatus[1]" margin-top="40" margin-bottom="40" bgColor="#eeeeee"></u-loadmore>
				</scroll-view>
			</swiper-item>
		</swiper>
		
		<u-tabbar :list="tabbar" activeColor="#00a73b" :before-switch="beforeSwitch" inactiveColor="#c9c9c9" :midButton="true" :midColor="true"></u-tabbar>
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
				list: [
					{
						name: '服务中'
					},
					{
						name: '历史订单'
					}
				],
				current: 0,
				swiperCurrent: 0,
				dx: 0,
				loadStatus: ['loadmore','loadmore']
			}
		},
		onLoad() {
			
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
			// tab栏切换
			change(index) {
				this.swiperCurrent = index;
			},
			transition({ detail: { dx } }) {
				this.$refs.tabs.setDx(dx);
			},
			animationfinish({ detail: { current } }) {
				this.$refs.tabs.setFinishCurrent(current);
				this.swiperCurrent = current;
				this.current = current;
			}
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