function urlskip(url, type = '') {
	if(!url){
		return console.log('跳转链接不能为空');
	}
	
	if(!type){
		return console.log(url+'（链接跳转失败，请传入跳转方法。）');
	}
	
	if(type == 'navigateTo'){
		return uni.navigateTo({
			url: url
		});
	}
	
	if(type == 'redirectTo'){
		return uni.redirectTo({
			url: url
		});
	}
	
	if(type == 'reLaunch'){
		return uni.reLaunch({
			url: url
		});
	}
	
	if(type == 'switchTab'){
		return uni.reLaunch({
			url: url
		});
	}

}

export default urlskip;