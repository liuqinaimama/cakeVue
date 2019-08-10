<!--入口组件-->
<template>
<div>
  <!--①titlebar-->
    <div class="titlebar">
    <div class="page-wrap">
   <!--3.调用顶部导航条子组件-->
     <titlebar :leftImg="require('../assets/img/dwy.png')" leftTitle="北京" :rightFirstImg="require('../assets/img/logoy.png')" :rightSecondImg="require('../assets/img/11.png')" phone="4001-170-170"></titlebar>
    <!--②.防止顶部内容溢出-->
    <!--保留标题48px-->
    <div style="margin-top:48px"></div>
    <!--③.面板、父面板，子面板-->
    <mt-tab-container v-model="active">
            <mt-tab-container-item id="home">
                <container :list="list" :img="img" :im="im"></container>
            </mt-tab-container-item>
            <mt-tab-container-item id="sort">
                <sort></sort>
            </mt-tab-container-item>
            <mt-tab-container-item id="cart">
                <cart></cart>
            </mt-tab-container-item>
            <mt-tab-container-item id="me">
                <me></me>
            </mt-tab-container-item>
        </mt-tab-container>
    <!--④.底部导航条-->
     <!--<div>
        <mt-cell class="page-part" title="当前选中" :value="active" />
      </div>-->
     <mt-tabbar v-model="active" fixed>
              <mt-tab-item id="home" @click.native="changeState(0)"> 
                 <tabbaricon :selectedImage="require('../assets/img/home1.png')" :normalImage="require('../assets/img/home.png')" :focused="currentIndex[0].isSelected"></tabbaricon>
                <span>首页</span>
            </mt-tab-item>
            <mt-tab-item id="sort"  @click.native="changeState(1)"> 
                <tabbaricon :selectedImage="require('../assets/img/sort1.png')" :normalImage="require('../assets/img/sort.png')" :focused="currentIndex[1].isSelected"></tabbaricon>
                <span>分类</span>
            </mt-tab-item>
            <mt-tab-item id="cart" @click.native="changeState(2)"> 
                <tabbaricon :selectedImage="require('../assets/img/cart1.png')" :normalImage="require('../assets/img/cart.png')" :focused="currentIndex[2].isSelected"></tabbaricon>
               <span>购物车</span>
            </mt-tab-item>
            <mt-tab-item id="me"  @click.native="changeState(3)"> 
                 <tabbaricon :selectedImage="require('../assets/img/me1.png')" :normalImage="require('../assets/img/me.png')" :focused="currentIndex[3].isSelected"></tabbaricon>
                <span>我</span>
            </mt-tab-item>  
        </mt-tabbar>
    </div>
    </div>
</div>
</template>
<script>
//子组件步骤：

//引入顶部当行条子组件
import Titlebar from "./cakeCommon/TitleBar";
import TabBarIcon from "./cakeCommon/TabBarIcon";
import Container from "./cakeCommon/Container";
import Cart from "./cakeCommon/Cart";
import Sort from "./cakeCommon/Sort";
import Me from "./cakeCommon/Me";

    export default {
        data(){
            return {
                list:[],
                img:[],
                im:[],
                //子组件id
                active:"home",
                //使用数据保存图片焦点状态
           currentIndex:[
               {isSelected:true},
               {isSelected:false},
               {isSelected:false},
               {isSelected:false},
               ]
            }
        },
        created(){
                 var url = "swipe" //不用加 / 因为有baseUrl ： axios.defaults.baseURL="http://127.0.0.1:3000/"  product 请求地址，一个字不能错，要和服务器端接收的值一样——app.js  
                //发送axios请求时将创建的参数对象传到params里
                this.axios.get(url,{}).then(result=>{
                   console.log(result.data.data);
                  this.list=result.data.data;
                  console.log(this.list[0].img)
                   this.img=result.data.data.slice(0,1);
                    console.log(this.img)
                    console.log(this.im)
                  this.im=result.data.data.slice(1,2);
                })
                
        },
        //注册顶部导航条子组件 ：给子组件，命名
       components:{
        "titlebar":Titlebar,
        "tabbaricon":TabBarIcon,
        "container":Container,
        "cart":Cart,
        "me":Me,
        "sort":Sort
       },
       methods:{
           changeState(n){
           //1：n当前按纽下表
           //2:创建循环数据
           for(var i=0;i<this.currentIndex.length;i++){
                //3：如果当前下标与参数下标一致
               if(n==i){
                   this.currentIndex[i].isSelected=true;
               }else{ this.currentIndex[i].isSelected=false;}
           }
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
   .mint-tabbar{
        background:#ffc107 !important;
    }
    .{padding:0;margin:0;}

    a{text-decoration:none;}

   .mint-tabbar > .mint-tab-item.is-selected{
       background:#303030 !important;
       color:#fff;
   }
   .mint-tab-item-label a{
       color:#5a5a5a;
   }

</style>