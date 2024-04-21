<template>
	<view class="wrap">
		<u-form :model="form" :rules="rules" ref="uForm" :errorType="errorType">
			<view class="top">
				<u-form-item label="联系姓名" label-width="150" prop="contactName"><u-input v-model="form.contactName" /></u-form-item>
				<u-form-item label="手机号码" label-width="150" prop="contactPhone"><u-input
						v-model="form.contactPhone" /></u-form-item>
				<u-form-item label="定位信息" label-width="150" prop="province">
					<u-input v-model="form.province" />
					<u-button slot="right" type="success" :plain="true" size="mini" @click="getWeizi"><u-icon size="28"
							top="1px" name="map-fill"></u-icon> 定位</u-button>
				</u-form-item>
				<u-form-item label="详细地址" label-width="150" prop="address">
					<u-input type="textarea" v-model="form.address" />
				</u-form-item>

				<u-form-item label="默认地址" label-width="150">
					<u-switch slot="right" activeColor="#00b362" v-model="form.switchVal"></u-switch>
				</u-form-item>
<!-- 				<u-form-item label="用户类型" label-width="150" prop="radio">
					<u-radio-group v-model="form.radio">
						<u-radio activeColor="#00b362" v-for="(item, index) in radioList" :key="index" :name="item.name"
							:disabled="item.disabled">
							{{ item.name }}
						</u-radio>
					</u-radio-group>
				</u-form-item> -->
			</view>
			<u-picker mode="region" ref="uPicker" v-model="show" />
			<view class="addSite">
				<u-button @click="update" type="success" shape="circle" v-if="isUpdate">保存修改</u-button>
				<u-button @click="submit" type="success" shape="circle" v-else>提交保存</u-button>
			</view>
		</u-form>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isUpdate: false,
				form: {
					addrId: null,
					contactName: '',
					contactPhone: '',
					// 定位信息 必填
					province: '',
					// 详细地址 必填
					address: '',
					// 用户类型 必填
					radio: '',
					switchVal: false
				},
				radioList: [{
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
					contactName: [{
							required: true,
							message: '请输入姓名',
							trigger: 'blur',
						},
						{
							min: 2,
							max: 8,
							message: '姓名长度在2到8个字符',
							trigger: ['change', 'blur'],
						},
						{
							validator: (rule, value, callback) => {
								return this.$u.test.chinese(value);
							},
							message: '姓名必须为中文',
							trigger: ['change', 'blur'],
						},
					],
					contactPhone: [{
							required: true,
							message: '请输入手机号',
							trigger: ['change', 'blur'],
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
							trigger: ['change', 'blur'],
						}
					],
					province: [{
						required: true,
						message: '请进行定位',
						trigger: ['change', 'blur'],
					}],
					address: [{
						required: true,
						message: '请填写详细地址',
						trigger: ['change', 'blur'],
					}, {
						min: 2, // 假设详细地址至少需要5个字符  
						max: 100, // 假设详细地址最多100个字符  
						message: '详细地址长度应在2到100个字符之间',
						trigger: ['change', 'blur'],
					}],
					radio: [{
						required: true,
						message: '请选择用户类型',
						trigger: 'change',
						validator: (rule, value, callback) => {
							if (value === '') {
								callback(new Error(rule.message));
							} else {
								callback();
							}
						}
					}]
				},

				show: false,
				switchVal: false,
				errorType: ['toast', 'border-bottom'],
			};
		},
		onReady() {
			this.$refs.uForm.setRules(this.rules);
			const user_addr = JSON.parse(uni.getStorageSync('userAddress_modify'))
			if(user_addr != null){
				this.isUpdate = true;
				this.form.addrId = user_addr.addrId
				this.form.contactName = user_addr.contactName
				this.form.contactPhone = user_addr.contactPhone
				this.form.province = user_addr.province
				this.form.address = user_addr.address
				this.form.switchVal = user_addr.isDefault === 1
				uni.removeStorageSync('userAddress_modify')
			}else{
				this.isUpdate = false
			}
		},
		methods: {
			setDefault() {},
			submit() {
				let me = this
				let userId = uni.getStorageSync('userId')
				this.$refs.uForm.validate(valid => {
					if (valid) {
						console.log('验证通过');
						uni.request({
							url: me.serverUrl + '/addr',
							method: 'POST',
							data: {
								userId: userId,
								...me.form,
								isDefault: me.form.switchVal ? 1 : 0
							},
							success(res) {
								console.log("success: ", res)
								if(res.data.code === 0){
									uni.showToast({
										title: "添加成功"
									});
									// 跳转
									wx.navigateBack({
									  delta: 1
									});
								}else{
									uni.showToast({
										title: "添加成功",
										icon:'fail'
									});
								}
							},
							fail(res) {
								console.log("error: ", res)
								
							}
						})
					} else {
						console.log('验证失败');
					}
				});
			},
			update(){
				let me = this
				let userId = uni.getStorageSync('userId')
				this.$refs.uForm.validate(valid => {
					if (valid) {
						console.log('验证通过');
						uni.request({
							url: me.serverUrl + '/addr',
							method: 'PUT',
							data: {
								userId: userId,
								...me.form,
								isDefault: me.form.switchVal ? 1 : 0
							},
							success(res) {
								console.log("success: ", res)
								if(res.data.code === 0){
									uni.showToast({
										title: "修改成功"
									});
									// 跳转
									wx.navigateBack({
									  delta: 1
									});
								}else{
									uni.showToast({
										title: "添加失败",
										icon:'fail'
									});
								}
							},
							fail(res) {
								console.log("error: ", res)
								
							}
						})
					} else {
						console.log('验证失败');
					}
				});
			},
			labelPositionChange(index) {
				this.labelPosition = index == 0 ? 'left' : 'top';
			},
			errorChange(index) {
				if (index == 0) this.errorType = ['message'];
				if (index == 1) this.errorType = ['toast'];
				if (index == 2) this.errorType = ['border-bottom'];
				if (index == 3) this.errorType = ['border'];
			},
			getWeizi() {
				let me = this;
				uni.chooseLocation({
					success: function(res) {
						console.log('位置名称：' + res.name);
						console.log('详细地址：' + res.address);
						console.log('纬度：' + res.latitude);
						console.log('经度：' + res.longitude);
						let address = res.address;
						let detailedAddress = ''; // 详细地址  
						let roughAddress = ''; // 粗略地址（省、市、区/县）  

						for (let i = address.length - 1; i >= 0; i--) {
							const char = address[i];
							// 判断是否为区/县的结束边界，这里假设为“区”、“县”等字符，可以根据实际情况扩展  
							if (['区', '县'].includes(char)) {
								for (let j = 0; j <= i; j++) {
									const temp = address[j];
									roughAddress = roughAddress + temp;
									// console.log("初略地址:" + roughAddress)
								}
								break;
							}

							// 如果找到区/县，则之前的部分为粗略地址，之后的部分为详细地址  

							detailedAddress = char + detailedAddress;

						}

						// 修正粗略地址，去除末尾可能出现的空格或多余字符  
						roughAddress = roughAddress.trim();
						detailedAddress = detailedAddress.trim();

						console.log('初略地址:' + roughAddress)
						console.log('详细地址:' + detailedAddress)

						me.form.province = roughAddress;
						me.form.address = detailedAddress;
					}
				});
			},
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