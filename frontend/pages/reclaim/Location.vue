<template>
	<view class="ynq-Location">
		<!-- 字母区域 -->
		<view class="ynq-Letter">
			<view hover-class="Click-Latter" @tap="getLetter('ScrollTop')">*</view>
			<view v-for="(l,i) in LatterName" :key="i" hover-class="Click-Latter" @tap="getLetter(l)">{{l}}</view>
		</view>
		<view class="search">
			<u-search :show-action="true" action-text="搜索" :animation="true" v-model="keyword" @custom="searchinput">
			</u-search>

		</view>
		<view class="ynq-AutoLocation flex">
			<view class="ynq-AutoAddress">
				<text class="ynq ynq-dizhi"></text>
				<text>当前定位：</text>
				<text>{{CityName}}{{CountyName}}</text>
			</view>

			<view class="ynq-ReLocation">
				<text class="ynq ynq-ditudingwei"></text>
				<text @click="getLocations">重新定位</text>
			</view>
		</view>

		<scroll-view scroll-y="true" class="ynq-ScrollView" :scroll-into-view="LetterId">
			<!-- 热门城市 -->
			<view class="ynq-HotCity" id="ScrollTop">
				<view class="ynq-HotCityTitle">
					<text class="ynq ynq-fire"></text>
					<text>热门城市</text>
				</view>

				<view class="ynq-HotCityList flex">
					<text class="radius-3" @tap="getStorage(item)" v-for="(item,index) in HotCity"
						:key="index">{{item}}</text>
				</view>
			</view>

			<!-- 城市列表 -->
			<view class="ynq-CityList">
				<block v-for="(item,index) in CityList" :key="index">
					<view class="ynq-CityLetter" :id="item.initial">{{item.initial}}</view>
					<view class="ynq-CityLine">
						<text @tap="getStorage(item_city.name)" v-for="(item_city,name_index) in item.list"
							:key="name_index">{{item_city.name}}</text>
					</view>
				</block>
			</view>
		</scroll-view>

	</view>
</template>

<script>
	var cityData = require('@/json/city.json')
	export default {
		data() {
			return {
				citylists: [],
				cityname: [],
				keyword: "",
				// CityName:'浙江',
				CityName: "",
				CountyName: "",
				HotCity: ['北京', '深圳', '上海', '成都', '广州', '金华'],
				LatterName: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
					'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
				],
				CityList: cityData.city, //引用json数据
				LetterId: '',
			}
		},
		methods: {


			// 搜索
			searchinput() {
				let _that = this;
				_that.CityList.forEach((item) => {
					item.list.forEach(items => {
						if (items.name === _that.keyword) {
							setTimeout(() => {
								uni.showToast({
									'title': '城市切换成功',
									'icon': 'none'
								})
								_that.CityName = _that.keyword
								uni.setStorage({
									key: 'City_Name',
									data: _that.CityName
								})
							}, 2000);
						}

					})
				})
			},
			//获取定位
			getLocations() {
				let that = this;
				uni.getLocation({
					type: 'gcj02',
					geocode: true,
					success(res) {

						let lat = res.latitude;
						let lng = res.longitude;


						let key =
							'BHCBZ-XZ66B-VWIUG-NON65-4HDZ2-BNB6T'; //申请地址：https://lbs.qq.com/dev/console/application/mine
						uni.request({
							url: 'https://apis.map.qq.com/ws/geocoder/v1/?location=' + lat + ',' + lng +
								'&key=' + key,
							method: "GET",
							success(ress) {
								let data = ress.data; //获取到所有定位的数据
								that.CityName = ress.data.result.address_component.city;
								that.CountyName = ress.data.result.address_component.district;
								console.log("位置信息", that.CityName);
								console.log(ress)
								uni.setStorage({
									key: 'City_Name',
									data: that.CityName
								})
							},

							fail() {
								uni.showToast({
									'title': '对不起，数据获取失败！',
									'icon': 'none'
								})
							}
						})
					},
					fail(res) {
						uni.showToast({
							'title': '对不起，获取位置失败！',
							'icon': 'none'
						})
					}

				})
				uni.navigateBack({
					url: '/pages/index/index'
				})
			},

			//获取定位点
			getLetter(name) {
				this.LetterId = name
				uni.pageScrollTo({
					selector: '#' + name,
					duration: 300
				})
			},
			//存储城市缓存
			getStorage(Name) {
				uni.setStorage({
					key: 'City_Name',
					data: Name
				})
				this.CityName = Name
				//跳转返回
				uni.navigateBack({
					url: '/pages/index/index'
				})
			}
		},
		onShow() {
			let _that = this;
			setTimeout(function() {
				uni.getStorage({
					key: 'City_Name',
					success(res) {
						_that.CityName = res.data
					}
				})
			}, 1000)
		},
		onLoad() {

		}
	}
</script>

<style lang="scss" scoped>
	.search {
		width: 92%;
		margin-left: 4%;
		margin-top: 10rpx;
		margin-bottom: 10rpx;

	}

	.ynq-Location {
		height: 100vh;
	}

	.ynq-AutoLocation {
		width: calc(100% - 40rpx);
		background: rgba(250, 250, 250, .5);
		padding: 20rpx 20rpx;

		text.ynq {
			font-size: 32rpx;
			margin-right: 10rpx;
		}

		text {
			font-size: 30rpx;
		}
	}

	.ynq-HotCity {
		padding: 20rpx;
	}

	.ynq-HotCityTitle {
		padding: 0rpx 0rpx;

		text.ynq {
			margin-right: 10rpx;
			color: #ff0000;
			font-size: 32rpx;
		}

		text {
			font-size: 30rpx;
		}
	}

	.ynq-HotCityList {
		padding: 20rpx 20rpx 20rpx 0;
		flex-wrap: wrap !important;

		text {
			width: 32%;
			display: inline-block;
			text-align: center;
			background: rgba(200, 200, 200, .2);
			margin-bottom: 10rpx;
			font-size: 26rpx;
			padding: 20rpx 0;
		}
	}

	.ynq-Letter {
		position: fixed;
		right: 5rpx;
		top: 180rpx;
		width: 30rpx;
		z-index: 100;

		view {
			display: block;
			width: 30rpx;
			text-align: center;
			height: 35rpx;
			line-height: 35rpx;
			font-size: 22rpx;
			transition: ease .3s;
			-webkit-transition: ease .3s;
		}
	}

	.ynq-CityList {
		padding: 0px 40rpx 0 20rpx;

		.ynq-CityLetter {
			line-height: 30rpx;
			height: 40rpx;
			font-size: 24rpx;
			border-bottom: 1px solid #f7f7f7;
			padding-left: 10rpx;
			color: #909090;
		}

		.ynq-CityLine {
			margin: 20rpx 0px;

			text {
				display: block;
				line-height: 60rpx;
				padding: 0px 10rpx;
				font-size: 30rpx;
				color: #767676;

				&:nth-child(even) {
					background-color: rgba(200, 200, 200, .12);
				}
			}
		}
	}

	.ynq-ScrollView {
		height: calc(100vh - 160rpx);
	}

	.Click-Latter {
		font-size: 30rpx !important;
	}
</style>