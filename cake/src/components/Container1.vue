<!--入口组件-->
<template>
<div>
  <!--①titlebar-->
    <div class="titlebar">
    <div class="page-wrap">
   <!--3.调用顶部导航条子组件-->
     <titlebar :leftImg="require('../assets/img/dwy.png')" leftTitle="北京" :rightFirstImg="require('../assets/img/logoy.png')" :rightSecondImg="require('../assets/img/11.png')" phone="4001-170-170" ></titlebar>
    <!--②.防止顶部内容溢出-->
    <!--保留标题48px-->
    </div>
    <mt-swipe :auto="4000" continuous class="myswipe">
        <mt-swipe-item v-for="(elem,i) of list":key="i">
            <img :src=elem.img  width="100%" height="100%">
        </mt-swipe-item>
        </mt-swipe>
    </div>
    <div>
     <ul class="topNav1">
         <li @click="classify" >分类 </li>
         <li @click="tasty">口味</li>
         <li @click="view">场景</li>
         <li @click="sale">销量</li>
     </ul>
     <ul class="topNav2" ref="topNav2">
       <li v-for="(elem,i) of content":key="i">{{elem}}</li> 
     </ul>
    </div>
    <mt-button class="color:red" @click="loadMore">点击显示蛋糕</mt-button>
    <div v-for="(elem,i) of cakesList" class="cakeList" @click='routerLink()'>   
      <img :src="elem.img">
      <div>
        <p>{{elem.title}}</p>
        <p>{{elem.promise}}</p>
        <p v-text="elem.price"></p>
        <p><del>￥666</del></p>
      </div>
    </div>
    <div class="new-footer clear">
     <div style="font-size: 12px;color: #6e6e6e;">味多美面包坊，选用全球优质原料，22年来，北京开店近300家。天然奶油蛋糕，使用进口天然稀奶油。五环内3小时免费送达，可门店自提。</div>
     <div class="new-f-section">
     <a href="kefu.php">联系我们</a>
     <a href="company_service.php">企业服务</a>
     <a href="http://m.wdmcake.cn/ps.htm">配送规则</a>
     </div>
     <div class="new-f-section2">Copyright © 2015-2016  味多美手机商城 版权所有<img src="http://c.cnzz.com/wapstat.php?siteid=1255734072&amp;r=http%3A%2F%2Fm.wdmcake.cn%2Fcategory_all.php&amp;rnd=607598028" width="0" height="0">
     </div>
    </div>
<footer class="footermenu x_footer">
		
	<div class="tablist">
		<router-link to="/cake">味多美蛋糕坊</router-link>
		
	</div>

</footer>
</div>
</template>
<script>
//子组件步骤：

//引入顶部当行条子组件
import Titlebar from "./cakeCommon/TitleBar";
import TabBarIcon from "./cakeCommon/TabBarIcon";


    export default {
        data(){
            return {
                list:[],
                content:[],
                cakesList:[]
            }
        },
        created(){
                 var url = "swipe" //不用加 / 因为有baseUrl ： axios.defaults.baseURL="http://127.0.0.1:3000/"  product 请求地址，一个字不能错，要和服务器端接收的值一样——app.js  
                //发送axios请求时将创建的参数对象传到params里
                this.axios.get(url,{}).then(result=>{
                   console.log(result.data.data);
                  this.list=result.data.data;
                  console.log(this.list[0].img)
                })
                
        },
        //注册顶部导航条子组件 ：给子组件，命名
       components:{
        "titlebar":Titlebar,
        "tabbaricon":TabBarIcon,
       },
       methods:{
           classify(){
               console.log(1);
       this.$refs.topNav2.innerHTML=`
               <li>天然奶油蛋糕</li>
               <li>法式蛋糕</li>
               <li>乳酪蛋糕</li>
               <li>慕斯蛋糕</li>`
           },
           tasty(){
                console.log(2);
                this.$refs.topNav2.innerHTML=`
               <li>天巧克力口味</li>
               <li>水果口味</li>
               <li>芝士口味</li>
               <li>慕斯口味</li>`
          },
           view(){
               console.log(2);
            this.$refs.topNav2.innerHTML=`
               <li>祝福</li>
               <li>爱情</li>
               <li>童趣</li>
               <li>友情</li>
               <li>祝寿</li>
               <li>宴会</li>
               `
           },
           sale(){},
           routerLink(){
               this.$router.push('/cakedetail')
           },
           loadMore(){
                 var url = "list" //不用加 / 因为有baseUrl ： axios.defaults.baseURL="http://127.0.0.1:3000/"  product 请求地址，一个字不能错，要和服务器端接收的值一样——app.js  
                //发送axios请求时将创建的参数对象传到params里
                this.axios.get(url,{}).then(result=>{
                  //console.log(result.data.data);    
                  this.cakesList=result.data.data
                  console.log(this.cakesList)
                })
           }
    
       }
    }
  
</script>
<style scoped>
   /*1.最外层父元素*/
   .titlebar{
       overflow:hidden;/**溢出隐藏 */
   }
   .page-wrap{
       overflow:auto;/**溢出显示滚动条 */
       padding-bottom:60px;/**底部导航条的高度 */
   }
    *{padding:0;margin:0;}
    ul{list-style:none;}
    a{text-decoration:none;}
    .topNav1{
        display:flex;
        justify-content:space-around;
        margin-top:10px;
    }
    .topNav1 li{
        border:1px solid #ccc;
        width:25%;
        padding:5px;
    }
   .topNav2{
   width:100%;
background:rgba(255,184,155,0.3);
   }
   .cakeList{
       display:flex;
       width:100%;
       height:150px;
       border-bottom:1px solid #ccc;
   }
   .cakeList p:nth-child(2){
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    width:210px;
   }
    .cakeList p:nth-child(3){
        color:#E3044E;
    }
  .cakeList img{
   width:140px;height:140px;
  }
  .cakeList div{
      display:flex;
      flex-direction:column;
      align-items:center;
      justify-content:center
  }
  .clear{
      clear:both;
  }
  .new-footer {
    margin: 7px 0 66px 0;
    background: #f3f2f2 none repeat scroll 0 0;
    font-size:14px;color:#6e6e6e;
    text-align:center;
    margin-top:50px;
}
.new-footer .new-f-section{
    padding:7px 0 0;
}
a{
    color:#6e6e6e;
}
.tablist{
    display:flex;
    justify-content:space-around;
}
.footermenu{
    width:100%;
    height:68px;
    background:rgba(255,184,156);
    line-height:80px;
    position:fixed;
    bottom:0px;
    left:1px;
}
</style>