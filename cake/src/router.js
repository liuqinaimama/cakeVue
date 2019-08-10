import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'










import Cake from './components/Cake.vue'
import Container1 from './components/Container1.vue'
import Eatout from './components/Eatout.vue'
import Regist from './components/Regist.vue'
import Cakedetail from './components/Cakedetail.vue'
//import Container from './components/cakeCommon/Container.vue'









Vue.use(Router)






export default new Router({
  routes: [
   // {path: '/cake', redirect: 'Container1'},
    {
      path: '/',
      name: 'home',
    


      component: Home
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    },
    
    {path:'/cake',component:Cake},
    {path:'/container1',component:Container1},
    {path:'/eatout',component:Eatout},
    {path:'/regist',component:Regist},
    {path:'/cakedetail',component:Cakedetail},
    
    //{path:'/container',component:Container},
  ]
})