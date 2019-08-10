<!--入口组件-->
<template>
<div>
  <!--①titlebar-->
  <div> 
   <titlebar :leftImg="require('../assets/img/dwy.png')" leftTitle="北京" :rightFirstImg="require('../assets/img/logoy.png')" :rightSecondImg="require('../assets/img/11.png')" phone="4001-170-170"></titlebar>
  </div>
   <div address-name="" right-class="search" left-class="close" title="添加地址 " callbacks="callbacks" header-flag="noSearch" city-name="">
		<div class="page-header_box">
			<div class="page-header_boxInner ">
				<div class="page-header">
					<router-link class="head-button-left backhome close" to='/container1'></router-link>
					<a class="page-button bright menu menu-home search_addr search"></a>
					<p class="add_address">地址定位 </p>
				</div>
			</div>
		</div>
	</div>
    <div>
        <mt-button type="danger" @click='changeShow' class='mapstyle'>点击显示地图</mt-button>
    </div>
    <div v-show='showmap'>
       <div class='amap-page-container'>
         <el-amap vid='amap' :plugin='plugin' class='amap-demo' :center='center'>
         </el-amap>
         <div class='toolbar'>
         <span v-if='loaded'>
           location: lng={{lng}} lat={{lat}}
         </span>
       </div>
    </div>
    <div class="your-site">
        <h4>您所在的位置(请选择下面一个或点击右上角搜索)</h4>
        <div id="addlist-js" class="add-list mrr" style="height: 204.8px;">
            <ul id="address_result">
                <li onclick="get_address_value(this);" city="北京市" district="东城区" lnglat="116.403838,39.915521" address="北京市东城区长安街" title="天安门">
                <span class="til">天安门</span>
                </li>
                <li onclick="get_address_value(this);" city="北京市" district="东城区" lnglat="116.403389,39.914331" address="北京市东城区东长安街天安门内" title="天安门-前石狮子">
                <span class="til">天安门-前石狮子</span></li>
                <li onclick="get_address_value(this);" city="北京市" district="东城区" lnglat="116.403165,39.914677" address="北京市东城区东长安街天安门内" title="天安门-观礼台"><span class="til">天安门-观礼台</span>
                </li>
             </ul>
            <span id="address_regions" from="xwc" addressid="0" sign_building="{&quot;0&quot;:&quot;天安门&quot;,&quot;1&quot;:&quot;天安门-前石狮子&quot;,&quot;2&quot;:&quot;天安门-观礼台&quot;}" cityname="北京市" country="" province="" city="" district="" style="display:none;"></span>
        </div>
    </div>
    <img id="map_cursor" style="top: 241.2px;" src="../assets/img/location1.png">

</footer>
    </div>
</div>
</template>
<script>
//import "../../node_modules/echarts/map/js/provice/beijing.js";
//引入顶部当行条子组件
import Titlebar from "./cakeCommon/TitleBar";


    export default {
        data(){
        let self=this;
            return {
                showmap:true,
                ip:'',
                counts:0,
                center:[121.59996,31.197646],
                lng:0,
                lat:0,
                loaded:false,
                plugin:[{
                    pName:'Geolocation',
                    convert:true,               //自动偏移坐标，偏移后坐标为高德地图，默认：true
                    showButton:false,           //显示定位按钮
                    buttonPosition:'RB',      //定位按钮停靠位置
                    showMarker:true,          //定位成功后在定位到的位置显示点标记
                    showCircle:true,         //定位成功后用圆圈表示定位精度范围
                    panToLocation:true,      //定位成功后将定位到的位置作为中心点
                    zoomToAccuracy:true,   //定位成功后调整地图视野范围使定位位置及精度范围视野内可见
                    extensions:'all',
                    enableHighAccuracy:true,//是和否使用高精度定位
                    events:{
                        init(o){
                            //o是高德地图定位插件实例
                            o.getCurrentPosition((status,result)=>{
                                if(result && result.position){
                                    self.lng=result.position.lng;
                                    self.lat=result.position.lat;
                                    self.center=[self.lng,self.lat];
                                    self.loaded=true;
                                    self.$nexTick();
                                }
                            })
                        }
                    }

                }]
            }
         
        },
        created(){
                 
                
        },
        //注册顶部导航条子组件 ：给子组件，命名
       components:{
        "titlebar":Titlebar,
       },
       methods:{
          changeShow(){
              this  .counts++;
              if((this.counts)%2!=0){
                  this.showmap=false;
              }else{
                  this.showmap=true;
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
    .{padding:0;margin:0;}

    a{text-decoration:none;}
.tablist{
    display:flex;
    justify-content:space-around;
}
.footermenu{
    width:100%;
    height:80px;
    background:rgba(255,184,156);
    line-height:80px;
    position:fixed;
    bottom:0px;
    left:1px;
}
.page-header_box {
    left: 0;
    position: relative;
    top: 60px;
    width: 100%;
    z-index: 2;
}
.head-button-left{
       background: rgba(0, 0, 0, 0) url(../assets/img/left-arrow.png) no-repeat scroll  center / 20px 20px;
    height: 30px;
    position: absolute;
    left:20px;
    width: 30px;
}
.page-button{
     background: rgba(0, 0, 0, 0) url(../assets/img/search.png) no-repeat scroll  center / 20px 20px;
    height: 30px;
    position: absolute;
    right:20px;
    width: 30px;
}
.amap-page-container{
    height:500px;
    width:100%;
    margin-top:10px;
}
.mapstyle{
    font-size:24px;
    font-weight:bold;
    margin-top:70px;
    background:rgba(255,184,155);
}
.your-site {
    bottom: -184px;
    z-index: 2;
    left: 0;
    position: absolute;
    width: 100%;
}
.add-list.mrr {
    margin: 0;
    overflow-x: hidden;
    overflow-y: auto;
    width: 100%;
    background-color: #fff;
}
ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
}
.add-list ul li {
    background: rgba(0, 0, 0, 0) url(../assets/img/location.png) no-repeat scroll 15px center / 15px 18px;
    border-bottom: 1px solid #e3e5e6;
    display: table;
    width: 100%;
    position: relative;
}
.pagepadd li {
    padding: 5px 0;
}
#map_cursor {
    left: 7px;
    margin-top: 250px;
    width: 32px;
    z-index: 201;
    position: absolute;
}

#map_cursor img {
    border: medium none;
    vertical-align:bottom;
}
</style>