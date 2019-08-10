<template>
    <div >
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="message"> 
                  <img slot="icon" :src="img_url">
                首页
            </mt-tab-item>
            <mt-tab-item id="concact"> 
                <img slot="icon" :src="img_urlone">
                分类
            </mt-tab-item>
            <mt-tab-item id="find"> 
                <img slot="icon" :src="img_urltwo">
               购物车
            </mt-tab-item>
            <mt-tab-item id="me"> 
                <img slot="icon" :src="img_urlthree">
               我的
            </mt-tab-item>
        </mt-tabbar>
        
    </div>
</template>
<script>
import TabBarIcon from "./TabBarIcon";
    export default{
        props:{
             selected:{default:""},
             img_url:{default:""},
             img_urlone:{default:""},
             img_urltwo:{default:""},
             img_urlthree:{default:""},
        },
        data(){
            return{
               
                
            }
        },
        methods:{

        },
        components:{
            "tabbaricon":TabBarIcon
        }
    }
</script>
<style>
    .mint-tabbar{
        background:#303030 !important;
    }
    .{padding:0;margin:0;}
    a{text-decoration:none;}
    .mint-tab-item-label{
        color:#fff !important;
    }
</style>