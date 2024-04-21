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
					<!-- <image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/ca9b79b9-844e-4d88-8738-19a1b6fdf83a.png"></image> -->
					<input placeholder="输入账号/手机号" v-model="loginForm.phone" />
				</view>
				<view class="row-input">
					<!-- <image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/6b93574b-73ce-4d3e-8353-a65095e9ba87.png"></image> -->
					<input placeholder="输入密码" maxlength="18" v-model="loginForm.password" />
				</view>
				<view class="menu-link">
					<text>忘记密码?</text>
				</view>
				<view class="login-btn" @click="login">
					登录
				</view>
			</view>
			<view v-show="tabIndex==1">
				<view class="row-input-code">
					<view class="input-box">
						<!-- <image class="img" mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/ca9b79b9-844e-4d88-8738-19a1b6fdf83a.png"></image> -->
						<input placeholder="输入手机号" maxlength="11" type="number" v-model="loginForm.phone" />
					</view>
					<view class="code-box" @click="getCode" v-if="isSend">
						{{sendmsg}}
					</view>
					<view class="code-box" v-else>
						{{sendmsg}}
					</view>
				</view>
				<view class="row-input">
					<!-- <image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/8e1c961a-cf6d-4190-bedb-bdf3cdc8b66d.png"></image> -->
					<input placeholder="输入验证码" maxlength="6" type="number" v-model="loginForm.code" />
				</view>
				<view class="row-input">
					<!-- <image mode="aspectFit" src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-a1714171-183a-4753-b538-8fabcab0d8b6/6b93574b-73ce-4d3e-8353-a65095e9ba87.png"></image> -->
					<input placeholder="输入6位密码" maxlength="6" v-model="loginForm.password" />
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
				tabIndex: 0, //登录注册下标,
				loginForm: {
					phone: '123',
					code: '',
					password: '123'
				},
				isSend: true,
				sendmsg: "获取验证码",
			}
		},
		methods: {
			// tab切换
			tabChange(id) {
				this.tabIndex = id
			},
			// 获取验证码
			getCode() {
				let me = this;
				if (!me.loginForm.phone) {
					uni.showModal({
						title: "错误！！！",
						content: "请输入手机号",
						confirmText: "知道了",
						showCancel: false,
						success: function(res) {
							if (true) {
								console.log('用户点击确定');
							}
						}
					});
				} else if (/^1(3|4|5|6|7|8|9)\d{9}$/.test(me.loginForm.phone) == false) {
					uni.showModal({
						title: "错误！！！",
						content: "手机号格式不正确",
						confirmText: "知道了",
						showCancel: false,
						success: function(res) {
							if (true) {
								console.log('用户点击确定');
							}
						}
					});
				} else {
					const phone = me.loginForm.phone
					uni.request({
						url: me.serverUrl + "/user/sendMsg",
						method: "POST",
						data: {
							phone: phone
						},
						success(res) {
							console.log("success :", res.data);

							uni.showToast({
								title: "获取验证码"
							});

							me.isSend = false;
							let timer = 60;
							me.sendmsg = timer + "s";
							me.timeFun = setInterval(() => {
								--timer;
								me.sendmsg = timer + "s";
								if (timer == 0) {
									me.isSend = true;
									me.sendmsg = "重新发送";
									clearInterval(me.timeFun);
								}
							}, 1000);
						},
						fail(e) {
							console.log(e);
						},
						complete(res) {
							console.log("complete :", res);
						},
					});
				}
			},
			register() {
				let me = this;
				uni.request({
					url: me.serverUrl + "/user/register",
					method: "POST",
					data: {
						...me.loginForm
					},
					success(res) {
						console.log("success :", res.data);

						if (res.data.code >= 0) {
							uni.showToast({
								title: "注册成功"
							});
							let data = res.data.data;
							me.tabIndex = 0;
						}
					},
					fail(e) {
						console.log("error: ", e);
					}
				})
			},

			login() {
				console.log("登录")
				let me = this;
				uni.request({
					url: me.serverUrl + "/user/login",
					method: "POST",
					data: {
						phone: me.loginForm.phone,
						password: me.loginForm.password
					},
					success(res) {
						console.log("success :", res.data);
						if (res.data.code >= 0) {
							uni.showToast({
								title: "登录成功"
							
							});
							// localStorage.setItem('userId', res.data.data.userId);
							uni.setStorageSync('token', res.data.data)
							// uni.setStorageSync('userId', res.data.data.userId);
							
							// me.$u.urlskip('/pages/reclaim/reclaim', 'navigateTo');
							uni.switchTab({
								url: '/pages/index/index'
							})
							// sessionStorage.setItem('user', JSON.stringify(res.data.data));
							// 跳转
							// me.$router.push('/pages/user/index').then(() => {
							// 	window.location.reload();
							// });

						} else {
							uni.showToast({
								title: "账号或密码错误",
								icon: "error"
							});
						}
					},
					fail(e) {
						console.log("error: ", e);
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