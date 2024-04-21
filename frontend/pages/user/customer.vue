<template>
	<view>
		<!-- <u-navbar back-text="帮助中心" :back-text-style="{'font-weight':'bold'}" :border-bottom="false" ></u-navbar> -->
		
		
		<view class="bg-white padding margin-top-sm">
			<view class="padding-bottom-xs text-black text-bold solid-bottom">
				<view class="cu-title">常见问题</view>
			</view>
			<u-collapse>
				<u-collapse-item :title="item.head" v-for="(item, index) in itemList" :key="index">
					{{item.body}}
				</u-collapse-item>
			</u-collapse>
		</view>
		
		<view class="bg-white shadow-lg  padding-tb text-center foot-fixed">
			<view class="grid col-2">
				<button class="flex align-center justify-center" open-type="contact"  
								  style="background-color: unset;color: inherit;line-height: none;
								        border: none;box-sizing: unset;
									   padding-left: inherit;padding-right: inherit;content: '';">
					<u-icon name="server-man" size="50" color="#36ab60"></u-icon>
					<view class="text-lg padding-left-xs">在线客服</view>
				</button>
				<view class="flex align-center justify-center" @click="call()">
					<u-icon name="phone" size="50" color="#36ab60"></u-icon>
					<view class="text-lg padding-left-xs">电话联系</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				itemList: [{
					head: "赏识在于角度的转换",
					body: "只要我们正确择取一个合适的参照物乃至稍降一格去看待他人，值得赏识的东西便会扑面而来",
					open: true,
					disabled: true
				},{
					head: "生活中不是缺少美，而是缺少发现美的眼睛",
					body: "学会欣赏，实际是一种积极生活的态度，是生活的调味品，会在欣赏中发现生活的美",
					open: false,
				},{
					head: "周围一些不起眼的人、事、物，或许都隐藏着不同凡响的智慧",
					body: "但是据说雕刻大卫像所用的这块大理石，曾被多位雕刻家批评得一无是处，有些人认为这块大理石采凿得不好，有些人嫌它的纹路不够美",
					open: false,
				},{
					head: "赏识在于角度的转换",
					body: "只要我们正确择取一个合适的参照物乃至稍降一格去看待他人，值得赏识的东西便会扑面而来",
					open: true,
					disabled: true
				},{
					head: "生活中不是缺少美，而是缺少发现美的眼睛",
					body: "学会欣赏，实际是一种积极生活的态度，是生活的调味品，会在欣赏中发现生活的美",
					open: false,
				},{
					head: "周围一些不起眼的人、事、物，或许都隐藏着不同凡响的智慧",
					body: "但是据说雕刻大卫像所用的这块大理石，曾被多位雕刻家批评得一无是处，有些人认为这块大理石采凿得不好，有些人嫌它的纹路不够美",
					open: false,
				}],
			}
		},
		methods: {
			call(){
				uni.makePhoneCall({
				    phoneNumber: '18083338261' //仅为示例
				});
			}
		}
	}
</script>

<style>
uni-button:after{
	content: "";
	width: auto;
	height: auto;
	border: none;
}
button::after { border: none }
</style>
