<template>
	<view class="warp">
		<view class="postBanner">
			<view class="car_box"></view>
		</view>
		<u-form :model="form" :rules="rules" ref="uForm" :errorType="errorType">
			<view class="class_box">
				<view class="title">回收品类</view>
				<view class="class_item">
					<view @click="typeDianji(item.type)" :class="item.type == type ? 'item_icon on' : 'item_icon'"
						v-for="(item, index) in classdate" :key="index">
						<u-image width="126rpx" height="126rpx" :src="item.img"></u-image>
						<view class="name">{{item.name}}</view>
					</view>
				</view>
			</view>
			<u-gap height="20" bg-color="#f5f5f5"></u-gap>
			<view class="class_box">
				<view class="title">今日指导价</view>
			</view>
			<u-cell-group>
				<u-cell-item title="黄纸" label="纯色纸箱,如家电包装箱" value="1元/公斤"
					:titleStyle="{'color':'#000000','font-size':'32rpx'}"
					:valueStyle="{'color':'#009920','font-size':'32rpx'}" :arrow="false"></u-cell-item>
				<u-cell-item title="统纸" label="黄纸和花纸混合" value="1元/公斤"
					:titleStyle="{'color':'#000000','font-size':'32rpx'}"
					:valueStyle="{'color':'#009920','font-size':'32rpx'}" :arrow="false"></u-cell-item>
			</u-cell-group>
			<u-gap height="20" bg-color="#f5f5f5"></u-gap>
			<view class="class_box">
				<view class="title">回收要求</view>
				<view class="husouyq">
					<view class="cvs">
						<view class="ws is_1"></view>
						<text>拒绝掺水</text>
					</view>
					<view class="cvs">
						<view class="ws is_2"></view>
						<text>拒绝掺杂</text>
					</view>
					<view class="cvs">
						<view class="ws is_3"></view>
						<text>不少于10KG</text>
					</view>
				</view>
			</view>
			<u-gap height="20" bg-color="#f5f5f5"></u-gap>
			<view class="contentBody">
				<u-form-item label="预估重量" label-width="150">
					<u-radio-group v-model="form.estimateWeight">
						<u-radio activeColor="#00b362" v-for="(item, index) in yuguzl" :key="index" :name="item.name"
							:disabled="item.disabled">
							{{ item.name }}
						</u-radio>
					</u-radio-group>
				</u-form-item>
		<!-- 		<u-form-item label="回收物照片" prop="form.idcard" label-width="150">
					<u-upload width="150" height="150"></u-upload>
				</u-form-item> -->
				<view class="addorderBox">
					<!-- <text>如您有多种回收品类，可先点击添加物品品类。</text>
					<u-button type="warning" shape="circle" plain @click="addbuy">
						<u-icon name="plus" size="32" style="margin-right:10rpx;"></u-icon>
						添加物品品类
					</u-button> -->
				</view>
				<view class="tips_warning">
					注意事项：
					<p>1、因回收成本原因，社区、写字楼、单元楼价格面议</p>
					<p>2、小于10公斤暂不保证上门回收</p>
					<p>3、重量超过100公斤，需拍照供回收员参考</p>
					<p>4、若无法获取报价，请重新打开手机定重新进入获取</p>
				</view>
				<u-form-item label="预约时间" :rightIconStyle="{color:'#00b362', fontSize: '32rpx'}"
					rightIcon="calendar-fill" label-width="150" prop="form.appointmentTime">
					<u-input v-model="form.appointmentTime" placeholder="请选择上门时间" @click="actionTimeShow"></u-input>
				</u-form-item>
				<u-form-item label="预约地址" label-width="150">
					<u-input v-model="form.address" :disabled="true"/>
					<u-popup v-model="showPopup" :round="15" :overlayStyle="{'touch-action':'none'}" mode="bottom" @close="close" @open="open">

						<view class="popup_box">
							<view class="scrool">
								<view class="item" v-for="(res, index) in siteList" :key="res.addrId" @click="selectUserAddr(index)">
									<view class="top">
										<view class="name">{{ res.contactName }}</view>
										<view class="phone">{{ res.contactPhone }}</view>
										<view class="tag">
											<text class="red" v-if="res.isDefault">默认</text>
										</view>
									</view>
									<view class="bottom">
										{{res.province}}
									</view>
								</view>
							</view>
						</view>
						
					</u-popup>
					<u-button slot="right" type="success" :plain="true" size="mini" @click="popup">更换/编辑地址</u-button>
				</u-form-item>
			</view>
			<u-gap height="190" bg-color="#f5f5f5"></u-gap>
			<view class="addSite">
				<view class="agreement">
					<u-checkbox activeColor="#00b362" v-model="checkbox">
						<view class="agreement-text">勾选代表同意<text>《收呗环保上门回收免责条款》</text></view>
					</u-checkbox>
				</view>
				<view class="buttonBox">
					<u-button @click="submit" type="primary" shape="circle">公益赠送</u-button>
					<u-button @click="submit" type="success" shape="circle">立即下单</u-button>
				</view>
			</view>
			<u-select v-model="showTime" mode="mutil-column" :list="selectlist" @confirm="timeBack"></u-select>
		</u-form>
		<view class="buyOrderBox" @click="buyorder" v-if="leftBuyBtn">
			<u-icon name="car-fill" color="#ffffff" size="50"></u-icon>
		</view>

		<u-popup v-model="cartBottom" :customStyle="{'bottom':'180rpx'}" :maskCustomStyle="{'bottom':'180rpx'}"
			borderRadius="30" mode="bottom">
			<view class="cartListBox">
				<view class="title">
					<text>已添加项目</text>
					<text>
						<u-icon name="trash-fill" size="32"></u-icon>
						清空
					</text>
				</view>
				<u-cell-group>
					<u-cell-item title="纸皮类" :titleStyle="{'color':'#000000','font-size':'32rpx'}" :arrow="false">
						<u-image width="60rpx" height="60rpx" style="margin-right:14rpx;" slot="icon"
							src="https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_1.jpg"></u-image>
						<view class="c_r_text" slot="right-icon">
							<view class="price">10-50公斤</view>
							<view class="delBtn">删除</view>
						</view>
					</u-cell-item>
					<u-cell-item title="衣物&其它" :titleStyle="{'color':'#000000','font-size':'32rpx'}" :arrow="false">
						<u-image width="60rpx" height="60rpx" style="margin-right:14rpx;" slot="icon"
							src="https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_2.jpg"></u-image>
						<view class="c_r_text" slot="right-icon">
							<view class="price">100公斤以上</view>
							<view class="delBtn">删除</view>
						</view>
					</u-cell-item>
					<u-cell-item title="金属类" :titleStyle="{'color':'#000000','font-size':'32rpx'}" :arrow="false">
						<u-image width="60rpx" height="60rpx" style="margin-right:14rpx;" slot="icon"
							src="https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_3.jpg"></u-image>
						<view class="c_r_text" slot="right-icon">
							<view class="price">50-100公斤</view>
							<view class="delBtn">删除</view>
						</view>
					</u-cell-item>
					<u-cell-item title="塑料类" :titleStyle="{'color':'#000000','font-size':'32rpx'}" :arrow="false">
						<u-image width="60rpx" height="60rpx" style="margin-right:14rpx;" slot="icon"
							src="https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_4.jpg"></u-image>
						<view class="c_r_text" slot="right-icon">
							<view class="price">10-50公斤</view>
							<view class="delBtn">删除</view>
						</view>
					</u-cell-item>
				</u-cell-group>
			</view>
		</u-popup>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				type: '',
				showPopup: false,
				siteList: [],
				
				showTime: false,
				leftBuyBtn: false,
				cartBottom: false,
				checkbox: '',
				form: {
					userId: null,
					estimateWeight: '10-50公斤',
					idcard: '', // 图片
					appointmentTime: '',
					address: '',
					phone: '',
					type: '',
				},
				classdate: [{
						img: 'https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_1.jpg',
						name: '纸皮类',
						type: 'zhipi'
					},
					{
						img: 'https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_2.jpg',
						name: '衣物&其它',
						type: 'yiwu'
					},
					{
						img: 'https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_3.jpg',
						name: '金属类',
						type: 'jingshu'
					},
					{
						img: 'https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder_4.jpg',
						name: '塑料类',
						type: 'shuliao'
					}
				],
				yuguzl: [{
						name: '10-50公斤',
						disabled: false
					},
					{
						name: '50-100公斤',
						disabled: false
					},
					{
						name: '100公斤以上',
						disabled: false
					}
				],
				selectlist: [
					[{
							value: '今天',
							label: '今天'
						},
						{
							value: '明天',
							label: '明天'
						},
						{
							value: '后天',
							label: '后天'
						}
					],
					[{
							value: '5',
							label: '5点'
						},
						{
							value: '6',
							label: '6点'
						},
						{
							value: '7',
							label: '7点'
						},
						{
							value: '8',
							label: '8点'
						},
						{
							value: '9',
							label: '9点'
						},
						{
							value: '10',
							label: '10点'
						},
						{
							value: '11',
							label: '11点'
						},
						{
							value: '12',
							label: '12点'
						},
						{
							value: '13',
							label: '13点'
						},
						{
							value: '14',
							label: '14点'
						},
						{
							value: '15',
							label: '15点'
						},
						{
							value: '16',
							label: '16点'
						}, {
							value: '17',
							label: '17点'
						},
						{
							value: '18',
							label: '18点'
						},
						{
							value: '19',
							label: '19点'
						},
						{
							value: '20',
							label: '20点'
						},
						{
							value: '21',
							label: '21点'
						},
						{
							value: '22',
							label: '22点'
						},
						{
							value: '23',
							label: '23点'
						}
					],
					[{
							value: '10:00',
							label: '10分'
						},
						{
							value: '30:00',
							label: '30分'
						},
						{
							value: '50:00',
							label: '50分'
						}
					],
				],
				rules: {},
				errorType: ['toast', 'border-bottom'],
				params: {
					day: true,
					hour: true,
					minute: false,
					second: false
				}
			}
		},
		onLoad(options) {
			this.type = options.type;
		},
		onReady() {
			let me = this
			const userId = uni.getStorageSync('userId')
			uni.request({
				url: `${me.serverUrl}/addr/default/${userId}`,
				method: 'GET',
				success(res) {
					console.log(res.data)
					if(res.data.code === 0){
						let data = res.data.data
						console.log(data)
						me.form.address = data.address
						me.form.phone = data.contactPhone
					}
				},
				fail(res) {
					
				}
			})
		},
		methods: {
			errorChange(index) {
				if (index == 0) this.errorType = ['message'];
				if (index == 1) this.errorType = ['toast'];
				if (index == 2) this.errorType = ['border-bottom'];
				if (index == 3) this.errorType = ['border'];
			},
			typeDianji(e) {
				console.log('类型', e)
				this.type = e;
			},
			// 选择上门时间回调
			actionTimeShow() {
				this.showTime = true;
			},
			timeBack(e) {
				console.log(e);
				this.form.appointmentTime = '';
				e.map((val, index) => {
					// this.result += this.result == '' ? val.label : '-' + val.label;
					let result = val.label
					this.form.appointmentTime += result;
				})
			},
			buyorder() {
				this.cartBottom = true;
			},
			addbuy() {
				this.leftBuyBtn = true;
			},
			toStringClass(type){
				switch(type)
				{
					case 'jingshu':
						return '金属类';
					case 'zhipi':
						return '纸皮类';
					case 'yiwu':
						return '衣物&其它';
					case 'shuliao':
						return '塑料类';
				}
			},
			submit(){
				console.log('下单')
				let me = this;
				const userId = uni.getStorageSync('userId')
				this.form.type = this.toStringClass(this.type)
				this.form.userId = userId
				uni.request({
					url: me.serverUrl + '/order',
					method: 'POST',
					data:{
						...me.form
					},
					success(res) {
						console.log(res.data)
						uni.showToast({
							title: "下单成功"
						});
						// 跳转
						wx.navigateBack({
						  delta: 1
						});
					},
					fail(res) {
						console.log(res.data)
						uni.showToast({
							title: "下单失败",
							icon: 'fail'
						});
					}
				})
			},
			popup(){
				this.showPopup = true
				let me = this
				let userId = uni.getStorageSync('userId')
				uni.request({
					// url: `${me.serverUrl}/addr/${userId}`,
					url: me.serverUrl + '/addr',
					method: 'GET',
					data:{
						userId
					},
					success(res) {
						console.log(res.data)
						if(res.data.code === 0){
							let data = res.data.data
							console.log(data)
							me.siteList = data
						}
					},
					fail(res) {
						
					}
				})
			},
			selectUserAddr(index){
				console.log(index)
				console.log(this.siteList[index])
				this.form.address = this.siteList[index].province
				this.form.phone = this.siteList[index].contactPhone
				this.showPopup = false
			},
		}
	}
</script>

<style lang="scss" scoped>
	.cartListBox {
		width: 750rpx;

		.title {
			width: 750rpx;
			padding: 28rpx;
			justify-content: space-between;
			display: flex;
		}

		.c_r_text {
			width: 270rpx;
			display: flex;
			justify-content: space-between;
			align-items: center;

			.price {
				width: 180rpx;
				text-align: right;
				color: #00b362;
			}

			.delBtn {
				width: 80rpx;
				text-align: right;
				color: #ff0000;
			}
		}
	}

	.postBanner {
		width: 750rpx;
		height: 200rpx;
		background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/postorder.jpg');
		background-repeat: no-repeat;
		background-size: 100% 200rpx;
		overflow: hidden;
		position: relative;

		.car_box {
			width: 289rpx;
			height: 160rpx;
			background: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/car.png') no-repeat;
			background-size: 100% auto;
			position: absolute;
			bottom: 0rpx;
			right: 15%;
			animation: move 1.667s linear infinite;
		}
	}

	.class_box {
		width: 750rpx;
		padding: 28rpx;

		.title {
			font-size: 32rpx;
		}

		.class_item {
			width: 694rpx;
			padding-top: 30rpx;
			justify-content: space-between;
			align-items: center;
			text-align: center;
			display: flex;

			.item_icon {
				width: 154rpx;
				border: 2px solid #ffffff;
				border-radius: 10rpx;
				overflow: hidden;

				.u-image {
					margin: 12rpx;
				}

				&.on {
					border: 2px solid #00b362;

					.name {
						color: #00b362;
					}
				}

				.name {
					width: 154rpx;
					font-size: 26rpx;
					height: 50rpx;
					display: flex;
					justify-content: space-around;
					text-align: center;
					color: #666666;
				}
			}
		}
	}

	.husouyq {
		width: 694rpx;
		justify-content: space-between;
		display: flex;

		.cvs {
			width: 33.33%;
			padding-top: 36rpx;

			text {
				width: 100%;
				text-align: center;
				padding-top: 10rpx;
				font-size: 26rpx;
				color: #666666;
				display: block;
			}

			.ws {
				width: 120rpx;
				height: 120rpx;
				background-repeat: no-repeat;
				background-size: 100% 100%;
				background-position: center;
				margin: 0 auto;

				&.is_1 {
					background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/p_1.jpg');
				}

				&.is_2 {
					background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/p_2.jpg');
				}

				&.is_3 {
					background-image: url('https://recycle2024.oss-cn-beijing.aliyuncs.com/static/coolc/p_3.jpg');
				}
			}
		}
	}

	.addorderBox {
		padding: 28rpx 0;

		text {
			width: 100%;
			display: block;
			text-align: center;
			font-size: 28rpx;
			color: #666666;
			padding: 0 0 18rpx 0;
		}
	}

	.addSite {
		width: 750rpx;
		height: 180rpx;
		position: 0 28rpx;
		position: fixed;
		left: 0px;
		bottom: 0px;
		z-index: 99;
		background: #ffffff;
		box-shadow: 0 0 5px #dedede;

		.buttonBox {
			width: 694rpx;
			margin: 0 auto;
			display: flex;
			justify-content: space-between;

			.u-btn {
				width: 335rpx;
			}
		}

		.agreement {
			width: 750rpx;
			text-align: center;
			margin: 20rpx 0 18rpx 0;

			.agreement-text {
				padding-left: 8rpx;
				font-size: 26rpx;
				color: $u-tips-color;

				text {
					color: #00b362;
				}
			}
		}
	}

	.buyOrderBox {
		width: 100rpx;
		height: 100rpx;
		background: linear-gradient(to right, #ffb43f, #ff8a00);
		border-radius: 120rpx;
		position: fixed;
		left: 28rpx;
		bottom: 204rpx;
		z-index: 99;
		box-shadow: 0 0 8px #cccccc;

		.u-icon {
			width: 100rpx;
			height: 100rpx;
			justify-content: space-around;
			display: flex;
			align-items: center;
		}
	}
	
	
	// 临时
	
	.item {
		padding: 40rpx 32rpx 40rpx 28rpx;
		border-bottom: 1px solid #eeeeee;
		
		.top {
			display: flex;
			font-weight: bold;
			font-size: 34rpx;
			.phone {
				margin-left: 60rpx;
			}
			.tag {
				display: flex;
				font-weight: normal;
				align-items: center;
				text {
					display: block;
					width: 60rpx;
					height: 34rpx;
					line-height: 34rpx;
					color: #ffffff;
					font-size: 20rpx;
					border-radius: 6rpx;
					text-align: center;
					margin-left: 30rpx;
					background-color:rgb(49, 145, 253);
				}
				.red{
					background-color:red
				}
			}
		}
		.bottom {
			display: flex;
			margin-top: 20rpx;
			font-size: 28rpx;
			justify-content: space-between;
			color: #999999;
		}
	}
	
	.scrool{
		height: 700rpx; // 固定高度
		overflow-y: scroll; // 超出滚动
		overscroll-behavior: none; // 禁止滚动溢出
	}
</style>