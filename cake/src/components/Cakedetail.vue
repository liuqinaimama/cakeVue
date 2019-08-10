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
    </div>
  <div>
    <router-link to="/container1" class='routerlink'>< </router-link> 
    <img :src="cakesList[0].img" alt="">
    <p class='firstp'>{{cakesList[0].title}}</p>
    <p class='sp'>{{cakesList[0].promise}}</p>
    <p style="color:red" class='tp'>{{cakesList[0].hint}}</p>
    <p class='fp'>购买数量：
    <mt-button @click='des()'>-</mt-button>
    <span>{{count}}</span>
    <mt-button @click='add()'>+</mt-button>
    </p>
    <p class='pri'>价格:{{cakesList[0].price}}</p>
    <p class='spec'>规格: <span v-for="(elem,i) of cakesList[0].spec.split('/')":key="i">{{elem}}</span></p>
  </div>
  <div class='bottom'> 
    <mt-button>立即购买</mt-button>
    <mt-button>加入购物车</mt-button>
  </div>
  <div class='imgL'>
    <img src="../assets/img/201812mmt.png" alt="">
    <img src="../assets/img/201807192.jpg" alt="">
    <img src="../assets/img/201807194.jpg" alt="">
    <img src="../assets/img/201807195.jpg" alt="">
    <img src="../assets/img/201807191.jpg" alt="">
    <img src="../assets/img/2018080716.jpg" alt="">
    <img src="../assets/img/201807193.jpg" alt="">
    <img src="../assets/img/20180719123.jpg" alt="">
    <img src="../assets/img/20180719125.jpg" alt="">
    <img src="../assets/img/20180719127.jpg" alt="">
  </div>
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
               count:0,
                cakesList:[]
            }
        },
        created(){
                  var url = "list" //不用加 / 因为有baseUrl ： axios.defaults.baseURL="http://127.0.0.1:3000/"  product 请求地址，一个字不能错，要和服务器端接收的值一样——app.js  
                //发送axios请求时将创建的参数对象传到params里
                this.axios.get(url,{}).then(result=>{
                  //console.log(result.data.data);    
                  this.cakesList=result.data.data
                  console.log(this.cakesList)
                })
                
        },
        //注册顶部导航条子组件 ：给子组件，命名
       components:{
        "titlebar":Titlebar,
       },
       methods:{
          des(){
              if(this.count>0){

              this.count--;
              }
          },
          add(){
              this.count++;
          }
           },
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
   img{width:100%;
      height:250px;
   }
   .spec{
      position:relative;
      left:-110px;
      margin-top:5px;
  }
  .spec span{
      display:inline-block;
      width:50px;
      height:25px;
      border:1px solid #ccc;
      line-height:25px;
      margin-right:5px;
      border-radius:4px;
  }
  button{
      background:rgb(255,184,150);
  }
  .bottom button{
      margin-right:10px;
      width:45%;
      margin-top:10px;
  }
  *{padding:0;margin:0;}

  .firstp{
      position:relative;
      left:-160px;
  }
  .sp{
      position:relative;
      left:-21px;
  }
  .tp{
      position:relative;
      left:-134px;
  }
  .fp{
      position:relative;
      left:-130px;
      margin-top:20px;
  }
  .fp button{
      height:25px;
  }
  .pri{
      position:relative;
      left:-180px;
      margin-top:1px;
  }
  p{
      font-size:16px;
  }
  .imgL{
      margin-top:50px;
  }
  .imgL img{
  width:100%;
  height:400px;
  }
 .routerlink{
     text-decoration:none;
     font-size:30px;
     position:relative;
     top:30px;
     left:-210px;
 }
</style>