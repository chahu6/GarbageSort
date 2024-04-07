<template>
	<view class="warp">
		
		<view class="sblist">
			<view class="orderInfo">
				<view class="h1">待接单</view>
				<view class="span">订单编号：2018001101400001</view>
			</view>
			<view class="order_list">
				<view class="title">
					<text class="type">回收员信息</text>
					<text class="state">
						<u-icon name="phone-fill" color="#00a73b" style="margin-right:10rpx;"></u-icon>
						联系师傅
					</text>
				</view>
				<view class="user_top">
					<view class="u_left">
						<u-image width="100rpx" height="100rpx" src="~@/static/coolc/pic/photo.png"></u-image>
						<view class="userTextBox">
							<view class="userName"><u-tag text="回收员" shape="square" style="margin-right:10rpx;" size="mini" type="success" /> 张师傅</view>
							<text>19970861797</text>
						</view>
					</view>
					<view class="u_right">
						<u-tag text="距您 22.3KM" mode="dark" shape="circle" type="warning" />
					</view>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>接单时间</text>
						<text>2021-05-18 18：00</text>
					</view>
				</view>
			</view>
			<view class="order_list">
				<view class="title">
					<text class="type">纸皮类</text>
					<text class="state">
						下单时间：2021-11-14 10：00
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
						<text>服务时间</text>
						<text>2021-05-18 18：00</text>
					</view>
					<view class="btns">
						<u-button type="success" shape="circle" size="medium">确认订单</u-button>
					</view>
				</view>
			</view>
			
			<view class="order_list">
				<view class="title">
					<text class="type">回收明细</text>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>回收物品</text>
						<text>金属物品</text>
					</view>
					<view class="yuyoutime">
						<text>重量</text>
						<text>200KG</text>
					</view>
					<view class="yuyoutime">
						<text>单价</text>
						<text>￥1.00/kg</text>
					</view>
					<view class="yuyoutime">
						<text>总价</text>
						<text>￥24000.00</text>
					</view>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>回收价格</text>
						<b style="color:red;">￥99.6</b>
					</view>
				</view>
			</view>
		</view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			
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
.user_top {
	width: 694rpx;
	height: 148rpx;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid #eeeeee;
	padding: 0 28rpx;
	
	.u_left {
		justify-content: flex-start;
		display: flex;
		align-items: center;
		
		.u-image {
			border-radius: 100% !important;
		}
		
		.userTextBox {
			padding-left: 26rpx;
			font-size: 24rpx;

			.userName {
				font-size: 32rpx;
				padding-bottom: 10rpx;
				opacity: 1;
			}
			
			text {
				opacity: 0.6;
			}
		}
	}
}
		
.sblist {
	width: 100%;
	padding: 28rpx;
	
	.orderInfo {
		width: 694rpx;
		
		.h1 {
			font-size: 38rpx;
			font-weight: bolder;
			padding-bottom: 10rpx;
		}
		.span {
			font-size: 26rpx;
			color: #666666;
		}
	}
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
		align-items: center;
		
		.type {
			font-size: 34rpx;
			color: #000000;
		}
		.state {
			font-size: 26rpx;
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
			padding-bottom: 14rpx;
			justify-content: space-between;
		}
		.btns {
			width: 100%;
			text-align: right;
			padding-top: 14rpx;
		}
	}
}	
</style>