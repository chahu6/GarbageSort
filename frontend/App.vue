<script>
	import {reqInterceptor} from '@/util/interceptor.js'
	
	export default {
		globalData: {
			typeid: 1,
			tabbar: [{
					iconPath: "/static/coolc/icon/home.png",
					selectedIconPath: "/static/coolc/icon/home_select.png",
					text: '主页',
					pagePath: "/pages/index/index"
				},
				{
					iconPath: "/static/coolc/icon/order.png",
					selectedIconPath: "/static/coolc/icon/order_select.png",
					text: '分类',
					pagePath: "/pages/type/type"
				},
				{
					iconPath: "/static/coolc/icon/huishou.png",
					selectedIconPath: "/static/coolc/icon/huishou.png",
					text: '预约回收',
					midButton: true,
					pagePath: "/pages/reclaim/reclaim",
					midColor: true
				},
				{
					iconPath: "/static/tabBar/challenge.png",
					selectedIconPath: "/static/tabBar/challengeSelected.png",
					text: '挑战赛',
					pagePath: "/pages/challenge/challenge"
				},
				{
					iconPath: "/static/coolc/icon/user.png",
					selectedIconPath: "/static/coolc/icon/user_select.png",
					text: '我的',
					pagePath: "/pages/user/index"
				}
			]
		},
		onLaunch: function() {
			console.log('App Launch')
			reqInterceptor()
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>


<style lang="scss">
	@import "util/colorui.css";
	/* 注意要写在第一行，同时给style标签加入lang="scss"属性 */
	@import "uview-ui/index.scss";

	.contentBody {
		width: 694rpx;
		margin: 0 auto;
	}

	// <!--　动画样式　-->
	//忽大忽小效果
	@keyframes circel {
		0% {
			transform: scale(1);
		}

		50% {
			transform: scale(1.12);
		}

		100% {
			transform: scale(1);
		}
	}

	//上下抖动
	@keyframes wiggle {
		0% {
			transform: rotate(0deg);
		}

		80% {
			transform: rotate(0deg);
		}

		85% {
			transform: rotate(5deg);
		}

		95% {
			transform: rotate(-5deg);
		}

		100% {
			transform: rotate(0deg);
		}
	}

	//左右移动
	@keyframes move {
		0% {
			left: 47%;
		}

		25% {
			left: 49%;
		}

		50% {
			left: 50%;
		}

		72% {
			left: 49%;
		}

		100% {
			left: 47%;
		}
	}

	//旋转动画（逆时针）
	@keyframes ROTATE {
		0% {
			transform: rotate(1turn)
		}

		to {
			transform: rotate(0deg)
		}
	}

	.maskOrderBox {
		padding: 100rpx 0 60rpx 0;

		.itemBox {
			width: 750rpx;
			justify-content: space-around;
			display: flex;

			.itemS {
				width: 25%;

				.icv {
					width: 100rpx;
					height: 100rpx;
					display: block;
					background-position: center;
					background-repeat: no-repeat;
					background-size: auto 60rpx;
				}

				.icon_1 {
					width: 100rpx;
					height: 100rpx;
					border-radius: 100rpx;
					background: linear-gradient(to right, #76dc8f, #16b281);
					margin: 0 auto;

					.icv {
						background-image: url("/static/coolc/class_icon/class_1.png");
					}
				}

				.icon_2 {
					width: 100rpx;
					height: 100rpx;
					border-radius: 100rpx;
					background: linear-gradient(to right, #92dbff, #2eb5ff);
					margin: 0 auto;

					.icv {
						background-image: url("/static/coolc/class_icon/class_2.png");
					}
				}

				.icon_3 {
					width: 100rpx;
					height: 100rpx;
					border-radius: 100rpx;
					background: linear-gradient(to right, #b5cef1, #8eaad7);
					margin: 0 auto;

					.icv {
						background-image: url("/static/coolc/class_icon/class_3.png");
					}
				}

				.icon_4 {
					width: 100rpx;
					height: 100rpx;
					border-radius: 100rpx;
					background: linear-gradient(to right, #ffb43f, #ff8a00);
					margin: 0 auto;

					.icv {
						background-image: url("/static/coolc/class_icon/class_4.png");
					}
				}

				text {
					padding-top: 10rpx;
					display: block;
					text-align: center;
					font-size: 24rpx;
					color: #666666;
				}
			}
		}

		.close_box {
			padding: 100rpx 0 0 0;
			text-align: center;

			.u-icon {
				width: 80rpx;
				height: 80rpx;
				border: 1px solid #dedede;
				border-radius: 40rpx;
				text-align: center;
				align-items: center;
				display: flex;
				margin: 0 auto;
				justify-content: space-around;
			}
		}
	}

	.listText {
		width: 750rpx;
		box-sizing: border-box;
		padding: 171rpx 28rpx 28rpx 28rpx;

		.item {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 26rpx 0;
			border-bottom: 1px solid #eeeeee;

			.name {
				font-size: 30rpx;
				padding-bottom: 12rpx;
			}

			.time {
				color: #999999;
				font-size: 24rpx;
			}

			.energy {
				font-size: 30rpx;
				font-weight: bold;
			}
		}
	}

	.tips_warning {
		width: 100%;
		padding: 24rpx 30rpx;
		background: #fff8ec;
		color: #F29100;
		font-size: 26rpx;
		border-radius: 8rpx;
		margin-bottom: 30rpx;

		p {
			padding-top: 6rpx;
		}
	}

	.htmlcontent {
		line-height: 56rpx;
		font-size: 28rpx;
		color: #666666;
	}
</style>