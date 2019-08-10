import Vue from 'vue'
import App from './App.vue'
import router from './router'

//以上三行不要动保存原来位置
//原因:引入有序
import store from './store'
//第三方组件库在下面引入
//1:完整引入mint-ui库
import MintUI from 'mint-ui' 

//2:单引引入mint-ui样式
import 'mint-ui/lib/style.css'
//3:将mint-ui注册vue
Vue.use(MintUI);
//4:引入图标字体样式文件
/*import "./font/iconfont.css"*/

//5：引入axios.js文件
import axios from "./axios"


import { Swipe, SwipeItem } from 'mint-ui';

//引入echart
//import echarts from 'echarts';
import VueAMap from 'vue-amap';


//6：引入vuex文件
import Vuex from "vuex"
//7:注册Vuex组件
Vue.use(Vuex)
//Vue.prototype.$echarts=echarts;
Vue.use(VueAMap);
Vue.config.productionTip=false;
//初始化  vue-amap
VueAMap .initAMapApiLoader({
  //高德key
  key:'37f05ef459ba1b315d7ce12932846be1',
  //插件集合（插件按需引入）
  plugin:['AMap.Geolocation','AMap.OverView','AMap.PlaceSearch'],
  v:'1.4.4'
})
//8:创建vuex实例store存储对象
/*var store=new Vuex.Store({
  //vuex中全局共享的数据
  state:{cartCount:0},//购物车数量

  //修改vuex中全局共享的数据
  mutations:{
   
    //将购物车数量+1
 increment(state){ //参数都是共享数据 state
   state.cartCount++ 
},
clear(state){
  state.cartCount=0;
},
  //将购物车数量增加指定值 （一次增加多个）
  updateCount(state,c){
    state.cartCount+=c; 
  }
},

//获取vuex中全局共享的数据
getters:{
  getCartCount:function(state){
  return state.cartCount; //获取购物车数量
}
}
})*/

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App),
   //9:将store存储对象保存Vue实例中
   /*store*/
}).$mount('#app')
