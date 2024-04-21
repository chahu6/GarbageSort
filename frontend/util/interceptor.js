export function reqInterceptor() { //请求拦截
	uni.addInterceptor('request', {
		invoke(args) {
			// request 触发前拼接 请求数据 
			const token = uni.getStorageSync('token');
			if (token) {
				args.header = {
					token
				}
			}
			console.log(args)
		},
		success(args) {
			// 请求成功后，修改code值为1
			console.log(args)
		},
		fail(err) {
			// console.log('interceptor-fail',err)
		},
		complete(res) {
			// console.log('interceptor-complete',res)
		}
	})
}
//取消拦截器
export function cancelInterceptor() {
	uni.removeInterceptor('request')
	let list = ["navigateTo", "redirectTo", "reLaunch", "switchTab", "navigateBack"];
	list.forEach(item => {
		uni.removeInterceptor(item)
	})
}
