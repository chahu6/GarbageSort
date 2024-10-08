import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false


// prod 
//Vue.prototype.serverUrl="https://felix.picp.vip/wx"19976365904
// dev
Vue.prototype.serverUrl="http://localhost:8899/wx" // 配置后端ip

import uView from "uview-ui";
Vue.use(uView);

// http拦截器，将此部分放在new Vue()和app.$mount()之间，才能App.vue中正常使用
import httpInterceptor from '@/util/http.interceptor.js';

Vue.use(httpInterceptor, app);

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()  
