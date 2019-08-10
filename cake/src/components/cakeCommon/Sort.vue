<template>
   <div>
    <div class="top"></div>
    <ul class="menu">
        <li @click='click1'>
        <img src="../../assets/img/4.png" alt="">
        <p>生日蛋糕</p>
        </li>
        <li @click='click2'>
         <img src="../../assets/img/5.png" alt="">
         <p>面包外卖</p>
        </li>
        <li @click='click3'>
          <img src="../../assets/img/6.png" alt="">
          <p>全国配送</p>
        </li>
        <li @click='click4'>
         <img src="../../assets/img/7.png" alt="">
          <p>提货卡券</p>
        </li>
        <li @click='click5'>
          <img src="../../assets/img/8.png" alt="">
          <p>会员中心</p>
        </li>
        <li @click='click6'>
          <img src="../../assets/img/9.png" alt="">
          <p>积分兑换</p>
        </li>
        <li @click='click7'>
         <img src="../../assets/img/10.png" alt="">
          <p>订单查询</p>
        </li>
        <li @click='click8'>
          <img src="../../assets/img/12.png" alt="">
          <p>卡券查询</p>
        </li>
    </ul>
    </div>
</template>
<script>
    export default{
        props:{
    
           
        },
        data(){
            return{
               
                
            }
        },
         
        methods:{
         click1(){
             this.$router.push('/container1')
         },
         click2(){
             this.$router.push('/eatout')
         },
         click3(){},
         click4(){},
         click5(){},
         click6(){},
         click7(){},
         click8(){}
        },
        
    }
</script>
<style scoped>
    .top{
        width:100%;
        height:150px;
        background:url(../../assets/img/1.jpg) no-repeat;
        background-size:100%;
    }
    .menu{
        list-style:none;
        display:flex;
        flex-wrap:wrap;
    }
    *{
        padding:0;margin:0;
    }
    .menu li{
        width:23%;
        height:120px;
        border:0.1px solid gray;
        border-radius:10px;
        color:gray;
        margin-top:10px;
        display:inline-block;   
        padding:1px;
    }
</style>