<template>
	<view>
		<!-- <u-navbar back-text="回收员招募" :back-text-style="{'font-weight':'bold'}" :border-bottom="false" ></u-navbar> -->

		<view class="bg-white padding">
			<view class="cu-title">基本资料</view>
			<u-form :model="form" ref="uForm" label-width="150">
				<u-form-item label="姓名" prop="name">
					<u-input v-model="form.name" />
				</u-form-item>
				<u-form-item label="身份证号" prop="card" ref="card">
					<u-input v-model="form.card" placeholder="请输入身份证号" @click="keyCardShow = true" />
					<!-- <u-keyboard ref="uKeyboardCard" mode="card" v-model="keyCardShow" @change="valChangeCard"
						@backspace="backspaceCard" :mask="false">
					</u-keyboard> -->
				</u-form-item>
				<u-form-item label="手机号码" prop="mobile">
					<u-input v-model="form.mobile" />
				</u-form-item>

				<u-form-item label="所在地区" prop="area">
					<u-input disabled type="text" @tap="showRegionPicker" placeholder-class="line" placeholder="省市区县、乡镇等" v-model="form.area" prop="area"/>
					<!-- <u-picker mode="region" v-model="show"  :area-code='["13", "1303", "130304"]'></u-picker> -->
					<u-picker mode="region" ref="uPicker" v-model="showCity" @confirm="confirm" />
				</u-form-item>
				
				<u-form-item label="个人简介" prop="intro">
					<u-input v-model="form.intro" type="textarea" />
				</u-form-item>
			</u-form>
		</view>
		
		<u-button @click="submit">提交</u-button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				showCity: false,
				form: {
					name: '',
					intro: '',
					mobile: '',
					card: '',
					province: '',
					city: '',
					county: '',
					area: '',
				},
				rules: {
					name: [{
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
					mobile: [{
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
					intro: [{
						required: true,
						min: 5,
						message: '简介不能少于5个字',
						trigger: 'change'
					}],
					card: [{
							required: true,
							message: '请输入身份证',
							trigger: ['blur', 'change'],
						},
						{
							// 自定义验证函数
							validator: (rule, value, callback) => {
								// 返回true表示校验通过，返回false表示不通过
								return this.$u.test.idCard(value)
							},
							message: '身份证不正确',
							// 触发器可以同时用blur和change
							trigger: ['blur', 'change'],
						}
					],
					area: [{
						required: true,
						message: '请选择所在地区',
						trigger: 'blur',
					}],
				}
			};
		},
		methods: {
			submit() {
				this.$refs.uForm.validate(valid => {
					if (valid) {
						console.log('验证通过');
					} else {
						console.log('验证失败');
					}
				});
			},
			showRegionPicker() {
				this.showCity = true;
				this.form.region = ''
			},
			valChangeCard(val) {
				// 将每次按键的值拼接到value变量中，注意+=写法
				this.form.card += val;
				this.triggerSingleFieldValidate("card")

			},
			// 退格键被点击
			backspaceCard() {
				// 删除value的最后一个字符
				if (this.form.card.length) this.form.card = this.form.card.substr(0, this.form.card.length - 1);
				this.triggerSingleFieldValidate("card")
			},
			//验证
			triggerSingleFieldValidate(refName) {
				setTimeout(() => {
					this.$refs[refName].onFieldChange()
				}, 200)
			},
			confirm(e) {
				this.form.province = e.province.label
				this.form.city = e.city.label
				this.form.county = e.area.label
				// 省市区拼接
				this.form.area = e.province.label + e.city.label + e.area.label
				console.log("全部===>", this.form.area)
				console.log("省===>", this.form.province)
				console.log("市===>", this.form.city)
				console.log("县===>", this.form.county)
			},
		},
		// 必须要在onReady生命周期，因为onLoad生命周期组件可能尚未创建完毕
		onReady() {
			this.$refs.uForm.setRules(this.rules);
		}
	};
</script>

<style lang="scss" scoped>
	/deep/ .line {
		color: $u-light-color;
		font-size: 28rpx;
	}

	.item {
		display: flex;
		font-size: 32rpx;
		line-height: 100rpx;
		align-items: center;
		border-bottom: solid 2rpx $u-border-color;

		.left {
			width: 180rpx;
		}

		input {
			text-align: left;
		}
	}
</style>