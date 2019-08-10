//将引入axios库单独保存一个文件中 以减少main.js代码量
  //1:引入vue实例
  import Vue from "vue"
  //2:引入axios库
  import axios from "axios"
  //3:发送请求时保存session信息
  axios.defaults.withCredentials=true
 // 4:设置请求基础路径
  axios.defaults.baseURL="http://127.0.0.1:3000/"
 // 5:将axios注册vue示例
  Vue.prototype.axios=axios;//axios不支持 Vue.use注册
 // 6:在main.js 引入axios.js文件
  import qs from 'qs'
//配置qs模块
Vue.prototype.qs=qs