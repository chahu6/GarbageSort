<template>
	<view class="container">
	  <view class="welcome-text">垃圾分类微信小程序竞赛</view>
	  <view class="info-text">当前时间：{{ currentTime }}</view>
	  <view class="info-text">竞赛规则：上传垃圾分类照片并回答问题</view>
	  <button class="enter-button" @click="startCompetition">进入比赛</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				currentTime: ''
			}
		},
		beforeMount() {
			this.setCurrentTime();
		},
	    methods:{
			setCurrentTime() {
			    const date = new Date();
			    const year = date.getFullYear();
			    const month = date.getMonth() + 1;
			    const day = date.getDate();
			    const hours = date.getHours();
			    const minutes = date.getMinutes();
			    const seconds = date.getSeconds();
			    
			    const currentTime = `${year}年${month}月${day}日 ${hours}:${minutes}:${seconds}`;
			    
			    this.currentTime = currentTime;
			    
			    setTimeout(() => {
			      this.setCurrentTime(); // 每秒更新一次时间
			    }, 1000);
			},
			startCompetition() {
			  // 进入比赛的逻辑
			  // 在组件中
			  this.$router.push('/pages/challenge/challenge');
			},
		}
	}
</script>

<style>
	.container {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  justify-content: center;
	  height: 100vh;
	}
	
	.welcome-text {
	  font-size: 24px;
	  font-weight: bold;
	  margin-bottom: 20px;
	}
	
	.info-text {
	  font-size: 16px;
	  margin-bottom: 10px;
	}
	
	.enter-button {
	  padding: 10px 20px;
	  background-color: #008CBA;
	  color: white;
	  font-size: 16px;
	  border: none;
	  border-radius: 5px;
	  cursor: pointer;
	}
</style>
