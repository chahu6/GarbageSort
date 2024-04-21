<template>
	<view>
		<view class="item" v-for="(res, index) in siteList" :key="res.addrId">
			<view class="top">
				<view class="name">{{ res.contactName }}</view>
				<view class="phone">{{ res.contactPhone }}</view>
				<view class="tag">
					<text class="red" v-if="res.isDefault">默认</text>
				</view>
			</view>
			<view class="bottom">
				{{res.province}}
				<div style="display: flex; align-items: center;">
					<u-icon name="edit-pen" :size="40" color="#999999" @click="modifyUserAddress(index)" style="margin-right: 30px;"></u-icon>
					<u-icon name="close" :size="40" color="red" @click="delUserAddress(index)"></u-icon>
				</div>
			</view>
		</view>
		<view class="addSite" @tap="toAddSite">
			<view class="add">
				<u-icon name="plus" color="#ffffff" class="icon" :size="30"></u-icon>新建收货地址
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			siteList: []
		};
	},
	onLoad() {
		// this.getData();
	},
	onShow() {
		console.log('刷新')
		this.getUserAddress()
	},
	methods: {
		getData() {
			this.siteList = [
				{
					addrId: 1,
					contactName: '游X',
					contactPhone: '19970861797',
					isDefault: false,
					province: '广东省深圳市宝安区 自由路66号'
				},
				{
					addrId: 2,
					contactName: '李XX',
					contactPhone: '13217971987',
					isDefault: false,
					province: '广东省深圳市宝安区 翻身路xx号'
				}
			];
		},
		toAddSite(){
			uni.navigateTo({
			    url: '/pages/user/addSite'
			});
		},
		getUserAddress(){
			let me = this
			let userId =uni.getStorageSync('userId')
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
		modifyUserAddress(index){
			console.log('修改地址信息: ' + index)
			uni.setStorageSync('userAddress_modify', JSON.stringify(this.siteList[index]))
			uni.navigateTo({
			    url: '/pages/user/addSite'
			});
		},
		delUserAddress(index){
			console.log("删除的地址下标：" +index)
			let me = this
			const addrId = me.siteList[index].addrId
			uni.showModal({
					title: '提示',
					content: '确认删除该条信息吗？',
					success: function(res) {
					if (res.confirm) {
					    // 执行确认后的操作
						uni.request({
							url: `${me.serverUrl}/addr/${addrId}`,
							method: 'DELETE',
							success(res) {
								console.log(res.data)
								if(res.data.code === 0){
									uni.showToast({
										title: "删除成功"
									});
									wx.reLaunch({
										url: '/pages/user/address'
									})
								}else{
									uni.showToast({
										title: "删除失败",
										icon:'fail'
									});
								}
							},
							fail(res) {
								
							}
						})
					} 
					else {
						// 执行取消后的操作
					}
				}
			})
		}
	}
};
</script>

<style lang="scss" scoped>
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
.addSite {
	display: flex;
	justify-content: space-around;
	width: 694rpx;
	line-height: 100rpx;
	position: absolute;
	bottom: 30rpx;
	left: 28rpx;
	background-color: #00a73b;
	border-radius: 60rpx;
	font-size: 30rpx;
	
	.add{
		display: flex;
		align-items: center;
		color: #ffffff;
		
		.icon{
			margin-right: 10rpx;
		}
	}
}
</style>