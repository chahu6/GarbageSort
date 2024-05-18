<template>
	<view class="warp">
		<view class="top_title"></view>
		<view class="loginBtnBox">
			<view class="h1">《收呗环保》申请获取以下权限</view>
			<text>获得您的公开信息（头像、昵称等）</text>
			<u-button shape="circle" @click="login()">确认授权登录</u-button>
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
			login() {
				this.$u.urlskip('/pages/simple/register', 'navigateTo');
			}
		}
	}
</script>

<style>
	page {
		background: #00b362;
	}
</style>

<style lang="scss" scoped>
	.warp {
		width: 750rpx;
		height: calc(100vh - var(--window-top));
		background: url('../../static/coolc/login_bg.jpg') no-repeat left bottom;
		background-size: 100% auto;
		padding-top: 100rpx;
	}

	.top_title {
		width: 750rpx;
		height: 400rpx;
		background: url('../../static/coolc/top_title.jpg') no-repeat left bottom;
		background-size: 100% auto;
	}

	.loginBtnBox {
		width: 694rpx;
		margin: 0 auto;
		text-align: center;
		padding-top: 80rpx;

		.h1 {
			color: #ffffff;
			font-size: 32rpx;
			padding-bottom: 14rpx;
		}

		text {
			color: #ffffff;
			font-size: 24rpx;
			padding-bottom: 60rpx;
			display: block;
			opacity: 0.5;
		}

		.u-btn {
			width: 360rpx;
			margin: 0 auto;
			border: 0px;
			color: #00b362;
		}
	}
</style>