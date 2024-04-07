<template>
	<view class="content">
		<view class="logo">
			LOGO
		</view>
		<view class="form-box">
			<view class="tab-menu">
				<view class="tab-name" @click="tabChange(0)">
					<text :class="tabIndex==0?'tab-txt':''">登录</text>
					<text v-show="tabIndex==0" class="tab-active"></text>
				</view>
				<view class="tab-name" @click="tabChange(1)">
					<text :class="tabIndex==1?'tab-txt':''">注册</text>
					<text v-show="tabIndex==1" class="tab-active"></text>
				</view>
			</view>
			<view v-show="tabIndex==0">
				<view class="row-input">
					<image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/ca9b79b9-844e-4d88-8738-19a1b6fdf83a.png"></image>
					<input placeholder="输入账号/手机号" maxlength="11" />
				</view>
				<view class="row-input">
					<image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/6b93574b-73ce-4d3e-8353-a65095e9ba87.png"></image>
					<input placeholder="输入密码" maxlength="18" />
				</view>
				<view class="menu-link">
					<text>忘记密码?</text>
				</view>
				<view class="login-btn">
					登录
				</view>
			</view>
			<view v-show="tabIndex==1">
				<view class="row-input-code">
					<view class="input-box">
						<image class="img" mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/ca9b79b9-844e-4d88-8738-19a1b6fdf83a.png"></image>
						<input placeholder="输入手机号" maxlength="11" type="number" v-model="loginForm.phone"/>
					</view>
					<view class="code-box" @click="getCode">
						获取验证码
					</view>
				</view>
				<view class="row-input">
					<image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/8e1c961a-cf6d-4190-bedb-bdf3cdc8b66d.png"></image>
					<input placeholder="输入验证码" maxlength="6" type="number" v-model="loginForm.verification"/>
				</view>
				<view class="row-input">
					<image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/6b93574b-73ce-4d3e-8353-a65095e9ba87.png"></image>
					<input placeholder="输入6位密码" maxlength="6" v-model="loginForm.password"/>
				</view>
				<view class="login-btn register" @click="register">
					注册
				</view>
				<view class="agree-txt">注册即表示您同意<text>《xx用户协议》</text></view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				tabIndex: 0 ,//登录注册下标,
				loginForm: {
					phone: '',
					verification: '',
					password: ''
				}
			}
		},
		methods: {
			// tab切换
			tabChange(id) {
				this.tabIndex = id
			},
			// 获取验证码
			getCode() {
				uni.showToast({
					title: "获取验证码"
				})
				
				uni.request({
			 		url: this.serverUrl + "/user/sendMsg",
			 		dataType: "json",
			 		responseType: "json",
			 		method: "POST",
			 		data: {
			 			phone: this.loginForm.phone
			 		},
			 		// header: {
			 		// 	"Content-Type": "application/json",
			 		// },
			 		timeout: 6000,
			 		sslVerify: false,
			 		withCredentials: false,
			 		firstIpv4: false,
			 		success(res) {
			 			console.log("success :", res.data);
			 		},
			 		fail(e) {
			 			console.log(e);
			 		},
			 		complete(res) {
			 			console.log("complete :", res);
			 		},
			 	});
			},
			register(){
				uni.request({
					url: this.serverUrl + "/user/login",
					method: "POST",
					data:{
						...this.loginForm
					}
				})
			}
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #5de97f;
	}

	.logo {
		height: 25vh;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #FFFFFF;
		font-size: 120rpx;
		letter-spacing: 5rpx;
		font-weight: bold;
	}

	.form-box {
		padding: 0 50rpx;
		margin: 0 70rpx;
		height: 750rpx;
		background-color: #FFFFFF;
		border-radius: 20rpx;


		.tab-menu {
			padding-top: 50rpx;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			height: 100rpx;

			.tab-name {
				height: 100%;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				flex-direction: column;
				width: 150rpx;
				font-size: 40rpx;
				font-weight: bold;
				color: #afafaf;
			}

			.tab-txt {
				color: #5b5b5b;
			}

			.tab-active {
				margin-top: 10rpx;
				width: 100rpx;
				height: 13rpx;
				background-color: #6bb3fe;
				border-radius: 15rpx;
			}
		}

		.row-input {
			margin: 60rpx 0 0 0;
			padding: 0 20rpx;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			height: 80rpx;
			border: 5rpx solid #bbf7c8;
			border-radius: 8rpx;

			image {
				width: 30rpx;
				height: 30rpx;
			}

			input {
				padding-left: 20rpx;
				font-size: 28rpx;
				width: 400rpx;
			}
		}

		.row-input-code {
			margin-top: 20rpx;
			width: 100%;
			display: flex;
			justify-content: space-between;
			align-items: center;
			height: 80rpx;
			font-size: 28rpx;

			.input-box {
				padding: 0 20rpx;
				width: 60%;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				height: 100%;
				border: 5rpx solid #bbf7c8;
				border-top-left-radius: 8rpx;
				border-bottom-left-radius: 8rpx;
				box-sizing: border-box;

				.img {
					width: 40rpx;
					height: 30rpx;
				}

				input {
					padding-left: 20rpx;
					font-size: 28rpx;
					width: 300rpx;
				}
			}

			.code-box {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 40%;
				height: 100%;
				color: #FFFFFF;
				border-top-right-radius: 8rpx;
				border-bottom-right-radius: 8rpx;
				background: linear-gradient(#44aae8, #4889e2);
			}
		}

		.menu-link {
			display: flex;
			justify-content: flex-end;
			align-items: center;
			height: 70rpx;
			color: #007AFF;
			font-size: 24rpx;
		}

		.login-btn {
			margin-top: 30rpx;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 80rpx;
			background: linear-gradient(#44aae8, #4889e2);
			border-radius: 50rpx;
			color: #FFFFFF;
			font-size: 35rpx;
			font-weight: bold;
			letter-spacing: 4rpx;
		}

		.register {
			margin-top: 50rpx;
		}

		.agree-txt {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 70rpx;
			font-size: 24rpx;

			text {
				color: #007AFF;
			}
		}
	}
</style>