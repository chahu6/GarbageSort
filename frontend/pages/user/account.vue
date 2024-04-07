<template>
	<view class="warp">
		<view class="cardlist">
			<view class="item">
				<text>回收订单（元）</text>
				<u-count-to :start-val="30" color="#ffffff" :bold="true" :end-val="18"></u-count-to>
			</view>
			<view class="item">
				<text>线上收益（元）</text>
				<u-count-to :start-val="30" color="#ffffff" :bold="true" :end-val="800.00" :decimals="2"></u-count-to>
			</view>
		</view>
		
		<view class="listText">
			<view class="item" v-for="(item, index) in loglist" :key="index">
				<view class="leftBox">
					<view class="name">{{item.name}}</view>
					<view class="time">{{item.time}}</view>
				</view>
				<view class="rightBs">
					<view class="energy">{{item.energy}}元</view>
				</view>
			</view>
			<u-empty text="暂无现金收益数据~" margin-top="100" mode="list" v-if="loglist.length === 0"></u-empty>
			<u-loadmore bg-color="rgb(255, 255, 255)" margin-top="40" margin-bottom="40" :status="loadStatus" @loadmore="addRandomData"></u-loadmore>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			loadStatus: 'loadmore',
			flowList: [],
			scrollTop: 0,
			loglist: [
				{
					name: '每日签到',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '每日签到',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '每日签到',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				},
				{
					name: '看资讯文章',
					time: '2021-04-22 00:07',
					energy: '+1'
				}
			]
		}
	},
	onLoad() {
		this.addRandomData();
	},
	onReachBottom() {
		this.loadStatus = 'loading';
		// 模拟数据加载
		setTimeout(() => {
			this.addRandomData();
			this.loadStatus = 'loadmore';
		}, 1000)
	},
	onPageScroll(e) {
		this.scrollTop = e.scrollTop;
	},
	methods: {
		addRandomData() {
			for(let i = 0; i < 10; i++) {
				let index = this.$u.random(0, this.loglist.length - 1);
				// 先转成字符串再转成对象，避免数组对象引用导致数据混乱
				let item = JSON.parse(JSON.stringify(this.loglist[index]))
				item.id = this.$u.guid();
				this.flowList.push(item);
			}
		}
	}
}
</script>

<style lang="scss" scoped>
	.cardlist {
		width: 750rpx;
		background: #00b362;
		justify-content: space-between;
		display: flex;
		padding: 20rpx 0 40rpx 0;
		position: fixed;
		
		.item {
			width: 50%;
			text-align: center;
			color: #ffffff;
			
			text {
				width: 100%;
				display: block;
				font-size: 26rpx;
				padding-bottom: 10rpx;
			}
		}
	}
</style>