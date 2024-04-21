<template>
	<view>

		<view class="bg-gradual-green" style="height: 400rpx;
			       border-bottom-left-radius: 15%;border-bottom-right-radius: 15%;"></view>
		<view @click="back()" class="navCus padding " :style="{height: CustomBar + 'px'}">
			<view class="padding-top flex align-center">
				<u-icon name="arrow-left" size="50" color="#FFFFFF"></u-icon><text class="text-white ">环保数据</text>
			</view>
		</view>
		<view class="padding-lr" style="position:absolute;top: 120rpx;width: 100%;">
			<view class="grid col-2 padding-tb ">
				<view class="flex align-center">
					<u-avatar :src="userInfo.avatar" :size="120"></u-avatar>
					<text class="text-white text-lg text-bold padding-left">{{userInfo.nickname}}</text>
				</view>
			</view>
			<view class="bg-white radius padding shadow margin-top">
				<view class="text-center padding-top-sm"><text class="text-xxl text-green text-bold">{{day}}</text>天</view>
				<view class="text-center padding-tb-sm">我已加入垃圾分类回收大家庭</view>
				<view class="grid col-3 padding-tb text-center solid-bottom margin-top">
					<view class="">
						<view class="text-black text-lg">参与了</view>
						<view class="text-black text-lg margin-tb-sm">0</view>
						<view class="text-sm">环保回收(次)</view>
					</view>
					<view class="">
						<view class="text-black text-lg">累计获得</view>
						<view class="text-black text-lg margin-tb-sm">0.00</view>
						<view class="text-sm">环保金</view>
					</view>
					<view class="">
						<view class="text-black text-lg">减少了</view>
						<view class="text-black text-lg margin-tb-sm">0.0</view>
						<view class="text-sm">碳排量(千克)</view>
					</view>
				</view>
				<view class="grid col-3 padding-tb text-center">
					<view class="">
						<view class="text-black text-lg">参与了</view>
						<view class="text-black text-lg margin-tb-sm">0</view>
						<view class="text-sm">公益捐赠(次)</view>
					</view>
					<view class="">
						<view class="text-black text-lg">累计捐赠</view>
						<view class="text-black text-lg margin-tb-sm">0.0</view>
						<view class="text-sm">公益值</view>
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
				StatusBar: this.StatusBar,
				CustomBar: this.CustomBar,
				userInfo: {},
				day: 0,
			}
		},
		onShow() {
			let me = this
			uni.request({
				url: me.serverUrl + "/user/info",
				method: "GET",
				success(res) {
					console.log("success :", res.data);
					if(res.data.code === 0){
						let data = res.data.data
						me.userInfo = data
						
						
						// 给定时间
						const givenTime = new Date(me.userInfo.registerTime);
						
						// 当前时间
						const currentTime = new Date();
						
						// 将时间转换为时间戳（以毫秒为单位）
						const givenTimestamp = givenTime.getTime();
						const currentTimestamp = currentTime.getTime();
						
						// 计算时间差值（毫秒）
						const timeDiff = currentTimestamp - givenTimestamp;
						
						// 将时间差值转换为天数
						const daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
						
						console.log(daysDiff)
						me.day = daysDiff;
					}
				},
				fail(e){
					console.log("error: ", e);
				}
			})
		},
		methods: {

		}
	}
</script>

<style>
	.navCus {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: auto;
		padding-top: var(--status-bar-height);
		z-index: 10;
	}
</style>