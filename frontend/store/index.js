import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex); //vue的插件机制

//Vuex.Store 构造器选项
const store = new Vuex.Store({
	state: {
		tabbar: [{
				iconPath: "/static/coolc/icon/home.png",
				selectedIconPath: "/static/coolc/icon/home_select.png",
				text: '主页',
				pagePath: "/pages/index/index"
			},
			{
				iconPath: "/static/coolc/icon/order.png",
				selectedIconPath: "/static/coolc/icon/order_select.png",
				text: '分类',
				pagePath: "/pages/type/type"
			},
			{
				iconPath: "/static/coolc/icon/huishou.png",
				selectedIconPath: "/static/coolc/icon/huishou.png",
				text: '预约回收',
				midButton: true,
				pagePath: "/pages/reclaim/reclaim",
				midColor: true
			},
			{
				iconPath: "/static/tabBar/challenge.png",
				selectedIconPath: "/static/tabBar/challengeSelected.png",
				text: '挑战赛',
				pagePath: "/pages/challenge/test"
			},
			{
				iconPath: "/static/coolc/icon/user.png",
				selectedIconPath: "/static/coolc/icon/user_select.png",
				text: '我的',
				pagePath: "/pages/user/index"
			}
		]
	}
})
export default store