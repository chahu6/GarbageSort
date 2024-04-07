<template>
	<view class="wrap">
		<u-form :model="form" :rules="rules" ref="uForm" :errorType="errorType">
			<view class="top">
				<u-form-item label="联系姓名" label-width="150"><u-input v-model="form.name" /></u-form-item>
				<u-form-item label="手机号码" label-width="150"><u-input v-model="form.mobile" /></u-form-item>
				<u-form-item label="定位信息" label-width="150">
					<u-input v-model="form.region" />
					<u-button slot="right" type="success" :plain="true" size="mini" @click="getWeizi"><u-icon size="28" top="1px" name="map-fill"></u-icon> 定位</u-button>
				</u-form-item>
				<u-form-item label="详细地址" label-width="150">
					<u-input type="textarea" v-model="form.intro" />
				</u-form-item>

				<u-form-item label="默认地址" label-width="150">
					<u-switch slot="right" activeColor="#00b362" v-model="switchVal"></u-switch>
				</u-form-item>
				<u-form-item label="用户类型" label-width="150">
					<u-radio-group v-model="form.radio">
						<u-radio activeColor="#00b362" v-for="(item, index) in radioList" :key="index" :name="item.name" :disabled="item.disabled">
							{{ item.name }}
						</u-radio>
					</u-radio-group>
				</u-form-item>
			</view>
			<u-picker mode="region" ref="uPicker" v-model="show" />
			<view class="addSite">
				<u-button @click="submit" type="success" shape="circle">提交保存</u-button>
			</view>
		</u-form>
	</view>
</template>

<script>
export default {
	data() {
		return {
			form: {
				name: '',
				mobile: '',
				region: '',
				intro: '',
				radio: ''
			},
			radioList: [
				{
					name: '商铺',
					disabled: false
				},
				{
					name: '住宅',
					disabled: false
				},
				{
					name: '写字楼',
					disabled: false
				}
			],
			rules: {
				name: [
					{
						required: true,
						message: '请输入姓名',
						trigger: 'blur' ,
					},
					{
						min: 2,
						max: 8,
						message: '姓名长度在2到8个字符',
						trigger: ['change','blur'],
					},
					{
						validator: (rule, value, callback) => {
							return this.$u.test.chinese(value);
						},
						message: '姓名必须为中文',
						trigger: ['change','blur'],
					},
				],
				mobile: [
					{
						required: true, 
						message: '请输入手机号',
						trigger: ['change','blur'],
					},
					{
						// 自定义验证函数，见上说明
						validator: (rule, value, callback) => {
							// 上面有说，返回true表示校验通过，返回false表示不通过
							// this.$u.test.mobile()就是返回true或者false的
							return this.$u.test.mobile(value);
						},
						message: '手机号码不正确',
						// 触发器可以同时用blur和change
						trigger: ['change','blur'],
					}
				]
			},
			show: false,
			switchVal: false,
			errorType: ['toast','border-bottom'],
		};
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules);
	},
	methods: {
		setDefault() {},
		submit() {
			this.$refs.uForm.validate(valid => {
				if (valid) {
					console.log('验证通过');
				} else {
					console.log('验证失败');
				}
			});
		},
		labelPositionChange(index) {
			this.labelPosition = index == 0 ? 'left' : 'top';
		},
		errorChange(index) {
			if(index == 0) this.errorType = ['message'];
			if(index == 1) this.errorType = ['toast'];
			if(index == 2) this.errorType = ['border-bottom'];
			if(index == 3) this.errorType = ['border'];
		},
		getWeizi() {
			uni.chooseLocation({
			    success: function (res) {
			        console.log('位置名称：' + res.name);
			        console.log('详细地址：' + res.address);
			        console.log('纬度：' + res.latitude);
			        console.log('经度：' + res.longitude);
			    }
			});
		}
	}
};
</script>

<style lang="scss" scoped>
.wrap {
	background-color: #f2f2f2;
	.top {
		background-color: #ffffff;
		border-top: solid 2rpx $u-border-color;
		padding: 28rpx;
	}
}
.addSite {
	width: 750rpx;
	padding: 40rpx 28rpx;
	background: #ffffff;
}
</style>