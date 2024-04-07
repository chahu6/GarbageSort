const getUseLocal = function(){
	let location = uni.getStorageSync("location");
	if(null != location && '' != location){
		return JSON.parse(location);
	}
	return '';
}

const setUseLocal = function(location){
	uni.setStorageSync("location", JSON.stringify(location));
}

module.exports = {
	getUseLocal: getUseLocal,
	setUseLocal: setUseLocal
}