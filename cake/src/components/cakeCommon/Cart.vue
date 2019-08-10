<template>
    <div>
       <div class="cart">
       <span><</span>购物车
       </div>
       <div class="m" id="m">
       <div class="blank"></div>
       <div class="mt">
         <p>我的购物车</p>
       </div>
       <div class="mc">
         <div class="icon-cart">
            <span></span>
             <p>您的购物车为空，赶快<router-link to="/container1" style="font-size: 1.2em;color:#E4004F;">去购物吧</router-link>！</p>
            <br/><br/>
         </div>
       </div>
       </div>
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

        },
        
    }
</script>
<style scoped>
*{padding:0;margin:0;}
    .cart{
        width:100%;
        height:40px;
        line-height:40px;
        color:white;
        background:#252525;
    }
    .cart span{
        float:left;
        font-size:20px;
    }
    .blank{
    background: #f0ead4;
    border-bottom: 1px solid #dacea8;
    height: 10px;
    }
    .mt{
    background: #ede6db;
    color: #db2929;
    border-bottom: 1px solid #dacea8;
    height: 42px;
    line-height: 42px;
    }
    .mt h2 {
    font-weight: normal;
    font-size: 1em;
    margin: 0 0 0 6px;
}
  .icon-cart span {
    display: inline-block;
    margin: 50px 0 15px;
    width: 95px;
    height: 70px;
    background: url(http://m.jd.com/misc/skin/cart/cart3.png) 0 0 no-repeat;
}
</style>