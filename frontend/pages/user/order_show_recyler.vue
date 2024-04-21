<template>
	<view class="warp">

		<view class="sblist">
			<view class="orderInfo">
				<view class="span">订单编号：2024001101400001</view>
			</view>

			<view class="order_list">
				<view class="title">
					<text class="type">{{order.type}}</text>
					<text class="state">
						下单时间：{{ formattedOrderTime }}
					</text>
				</view>
				<view class="adds_box">
					<view class="adds">
						<u-icon name="map-fill" color="#00a73b" size="32"></u-icon>
						{{order.address}}
					</view>
					<view class="mobile">
						<u-icon name="phone-fill" color="#00a73b" size="28"></u-icon>
						{{order.phone}}
					</view>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>服务时间</text>
						<text>{{order.appointmentTime}}</text>
					</view>
					<view class="btns">
						<u-button v-show="isShowButton" type="success" shape="circle" size="medium" @click="confirm">确认订单</u-button>
					</view>
				</view>
			</view>

			<view class="order_list">
				<view class="title">
					<text class="type">回收明细</text>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>回收物品：</text>
						<input v-if="isShowButton" class="uni-input" placeholder="物品名称" v-model="goods.goodsName" :disabled="isDisable"/>
						<text v-else>{{goods.goodsName}}</text>
					</view>
					<view class="yuyoutime">
						<text>重量：</text>
						<!-- <text>200KG</text> -->
						<input v-if="isShowButton" class="uni-input" placeholder="100KG" type="number" v-model="goods.weight" @input="calculate" :disabled="isDisable"/>
						<text v-else>{{goods.weight}}KG</text>
					</view>
					<view class="yuyoutime">
						<text>单价：</text>
						<!-- <text>￥1.00/kg</text> -->
						<input v-if="isShowButton" class="uni-input" placeholder="￥1.00/kg" type="number" v-model="goods.unitPrice" @input="calculate" :disabled="isDisable"/>
						<text v-else>￥{{goods.unitPrice}}/kg</text>
					</view>
				</view>
				<view class="bottomBtn">
					<view class="yuyoutime">
						<text>回收价格</text>
						<b style="color:red;">￥{{goods.amount}}</b>
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
				id: null,
				isShowButton: true,
				order: {},
				recycler: {
					image: '',
					name: '',
					phone: '',
				},
				isRecyler: false,
				isDisable: false,
				goods: {
					goodsName: '',
					weight: 0,
					unitPrice: 0,
					amount: 0,
				},
			}
		},
		onShow() {
			// 获取URL中的查询参数
			// 获取URL中的查询参数
			const pages = getCurrentPages();
			const currentPage = pages[pages.length - 1];
			const options = currentPage.options;
			const id = options.id;
			
			console.log(id)
			this.id = id;

			let me = this
			uni.request({
				url: `${me.serverUrl}/order/${me.id}`,
				method: 'GET',
				success(res) {
					console.log(res.data)
					if (res.data.code === 0) {
						let data = res.data.data
						me.order = data
						
						me.isShowButton = me.order.status === 4
						me.isDisable = !me.isShowButton
						
						if (me.order.recyclerId != null) {
							uni.request({
								url: `${me.serverUrl}/user/${me.order.recyclerId}`,
								method: "GET",
								success(res) {
									console.log(res.data)
									if (res.data.code === 0) {
										me.recycler = res.data.data
									}
								}
							})
						}
					}
				},
				fail(res) {

				}
			});

			this.test();
			
			uni.request({
				url:me.serverUrl + '/order/goods',
				method: 'GET',
				data:{
					id
				},
				success(res) {
					console.log(res.data)
					if(res.data.code === 0){
						me.goods = res.data.data
					}
				}
			});
		},
		computed: {
			formattedOrderTime() {
				const dateTime = new Date(this.order.orderTime);
				return `${dateTime.getFullYear()}-${(dateTime.getMonth() + 1).toString().padStart(2, '0')}-${dateTime.getDate().toString().padStart(2, '0')} ${dateTime.getHours().toString().padStart(2, '0')}:${dateTime.getMinutes().toString().padStart(2, '0')}:${dateTime.getSeconds().toString().padStart(2, '0')}`;
			}
		},
		methods: {
			getOrderServiceList() {
				this.orderServiceList = this.orderList.filter(item => item.status === 1 || item.status === 5);
			},
			confirm() {
				let me = this
				const id = me.id;
				const test = me.goods
				uni.request({
					url: `${me.serverUrl}/order/goods`,
					method: 'POST',
					data: {
						id,
						status: 5,
						...me.goods
					},
					success(res) {
						if (res.data.code === 0) {
							uni.showToast({
								title: "确认成功"
							});
							me.isShowButton = false;
						} else {
							uni.showToast({
								title: "确认失败",
								icon: 'fail'
							});
						}
					},
					fail(e) {
						console.log(e)
					}
				})
			},
			test() {
				let me = this
				const userId = uni.getStorageSync('userId');
				uni.request({
					url: me.serverUrl + '/user/state',
					method: 'GET',
					data: {
						userId
					},
					success(res) {
						console.log(res.data)
						if (res.data.code === 0) {
							me.isRecyler = res.data.data.userState === 1
						}
					}
				})
			},
			calculate() {
				this.goods.amount = parseFloat(this.goods.weight) * parseFloat(this.goods.unitPrice);
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