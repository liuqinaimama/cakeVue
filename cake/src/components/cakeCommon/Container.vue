<template>
    <div >
        <mt-swipe :auto="4000" continuous class="myswipe">
        <mt-swipe-item v-for="(elem,i) of list":key="i">
            <img :src=elem.img  width="100%" height="100%">
        </mt-swipe-item>
        </mt-swipe>
        <ul class="topNav">
            <li>
              <img src="../../assets/img/1_01.png" slot="icon">
              <p>生日蛋糕</p>
            </li>
            <li>
             <img src="../../assets/img/1_02.png" slot="icon">
              <p>提货卡</p>
            </li>
            <li>
             <img src="../../assets/img/1_03.png" slot="icon">
              <p>面包外卖</p>
            </li>
            <li>
             <img src="../../assets/img/1_04.png" slot="icon">
              <p>全国快递</p>
            </li>
        </ul>
        <div class="notice">
        <img src="../../assets/img/notice.png" >
        <span>生日蛋糕提前4小时订购，祝福语只限8字左右</span>
        </div>
        <div class="banner">
         <img :src="im[0].img" alt="">
         <img :src="img[0].img" alt="">
        </div>
        <span class="smalltip">人气商品</span>
        <div class="cakeDetail">
            <div v-for="(elem,i) of images" @click='click1'>
                <img :src="elem.pic" alt="">
                <p>{{elem.title}}</p>
                <p>{{elem.price}}</p>
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        props:{
            img:{default:""},
            im:{default:""},
            list:{default:""}

        },
        data(){
            return{
               images:[],
                
            }
        },
        created(){
             var url = "image" //不用加 / 因为有baseUrl ： axios.defaults.baseURL="http://127.0.0.1:3000/"  product 请求地址，一个字不能错，要和服务器端接收的值一样——app.js  
                //发送axios请求时将创建的参数对象传到params里
                this.axios.get(url,{}).then(result=>{
                   console.log(result.data.data);
                   this.images=result.data.data.slice(0,8);
                })
        },
         
        methods:{
            click1(){
                this.$router.push('/')
            }
        },
        
    }
</script>
<style>
   .myswipe{
        height:170px !important;
    }
  .myswipe .mint-swipe-item{
      background-color:#747474 !important;
      height:170px !important;
      color:white;
  }
  .myswipe .mint-swipe-item a{
      width:100%;
      height:100%;
      display:inline-block;
  } 
  .myswipe .mint-swipe-indicator.is-active{
      background:red !important;
  }
  .topNav{
      list-style:none;
      display:flex;
      justify-content:space-around;
      padding:0;
      margin:0;
  }
  .topNav img{
      width:70px;
      height:70px;
  }
  .topNav p{
      font-size:15px;
  }
  .notice{
      color:rgb(102, 102, 102);
      font-size:16px;
      line-height:40px;
      width:100%;
      height:40px;
      background:rgb(255, 248, 233) none repeat scroll 0% 0%;
  }
  .notice img{
      width:16px;
      height:16px;
      vertical-align: middle;
      display:inline-block;
      margin-right:30px;
  }
  .banner img{
      width:100%;
      height:100px;
  }
  .smalltip{
       background:rgb(255, 248, 233)  none repeat scroll 0% 0%;
       width:100%;height:20px;
       display:inline-block;
       font-size:14px;
       color:red;
       line-height:20px;
  }
   .cakeDetail{
       margin-top:20px;
   }
  .cakeDetail div{
      float:left;
      width:50%;
      height:206px;
  }
  .cakeDetail img{
      width:75%;
  }
</style>