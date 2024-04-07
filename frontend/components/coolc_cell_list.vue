<template>
	<view class="content">
		
		<view class="coolc-list-cell" :class="border" @click="eventClick" hover-class="cell-hover" :hover-stay-time="50">
			<text
				v-if="icon"
				class="cell-icon"
				:style="[{color:iconColor,}]"
				:class="icon"
			></text>
			<text class="cell-tit clamp">{{title}}</text>
			<text v-if="tips" class="cell-tip">{{tips}}</text>
			<text class="cell-more coolc"
				:class="typeList[navigateType]"
			></text>
		</view>

	</view>
</template>
 
<script>
export default {
	data() {
		return {
			typeList: {
				left: 'icon-jiantouleft',
				right: 'icon-jiantouright',
				up: 'icon-jiantoutop',
				down: 'icon-jiantoubottom'
			},
		}
	},
	props: {
		icon: {
			type: String,
			default: ''
		},
		title: {
			type: String,
			default: '标题'
		},
		tips: {
			type: String,
			default: ''
		},
		navigateType: {
			type: String,
			default: 'right'
		},
		border: {
			type: String,
			default: 'b-b'
		},
		hoverClass: {
			type: String,
			default: 'cell-hover'
		},
		iconColor: {
			type: String,
			default: '#333'
		}
	},
	methods: {
		eventClick(){
			this.$emit('eventClick');
		}
	},
}
</script>

<style lang='scss'>
.icon .coolc-list-cell.b-b:after{
	left: 90rpx;
}
.coolc-list-cell{
	display:flex;
	align-items:baseline;
	padding: 20rpx 30rpx;
	line-height:60rpx;
	position:relative;
	
	&.cell-hover{
		background:#fafafa;
	}
	&.b-b:after{
		left: 30rpx;
	}

	.cell-icon{
		align-self:center;
		width:56rpx;
		max-height:60rpx;
		font-size:46rpx;
	}
	.cell-more{
		align-self: center;
		font-size:30rpx;
		color:#606266;
		margin-left:10rpx;
	}
	.cell-tit{
		flex: 1;
		font-size: 28rpx;
		color: #303133;
		margin-right:10rpx;
	}
	.cell-tip{
		font-size: 26rpx;
		color: #909399;
	}
}
</style>