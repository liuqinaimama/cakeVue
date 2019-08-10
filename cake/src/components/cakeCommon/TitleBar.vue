<template>
    <div class="page-head">
     <div class="left-head">
        <img slot="icon" :src="leftImg"/>
        <span><sup>{{leftTitle}}</sup></span>
     </div>
         
        <div class="center-head">
            <div class="cakelogo">
                <img slot="icon" :src="rightFirstImg"/>
            </div>
        </div>  
        <div class="right-head">   
            <div class="rightTop">
             <img slot="icon" :src="rightSecondImg"/>
             <span>{{phone}}</span>
            </div>
            <div class="rightbottom">
              <router-link to="/cake">登录</router-link>| <router-link to="/regist">注册</router-link>
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        //左侧文字 与有侧两张图片
         props:{
            leftImg:{default:""},
           leftTitle:{default:""},
           rightFirstImg:{default:""},
           rightSecondImg:{default:""},
           phone:{default:""},//声明 此变量的类型
           login:{default:""},
           register:{default:""}

        },
        data(){
            return{
        
            }
        },
       
    }
</script>
<style scoped>/*scoped:只在当前元素生效 */
/*1.最外层父元素*/
*{
    padding:0;margin:0;
}
.page-head{
    display:flex;
    position:fixed;
    z-index:999;
    width:100%;  height:48px;
    justify-content:space-between;
    align-items:center;
    color:#000;
    background:#fff;
    padding: 0 7px;
    font-size:18px;
}
.left-head img{
width:20px;
}
.left-head span{
   font-size:10px;
}
/*2.右侧图片区域*/
.center-head{
    display:flex;
}

/*3.图片*/
.cakelogo{
    display:flex;
    align-items:center;
    margin-right:30px;
    margin-top:-10px;
}
.cakelogo img{
    width:160px;
}
.right-head{
    margin-right:30px;
}
/**右侧电话 */
.rightTop img{
    width:20px;
}
.rightTop span{
    font-size:12px;
}
.rightbottom a{
    font-size:12px;
    text-decoration:none;
    color:black;
}
</style>