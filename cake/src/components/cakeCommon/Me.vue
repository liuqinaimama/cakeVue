<template>
  <div>
    <div class="outer">
    <a href="javascript:;" @click="back"><span class="iconfont">&#xe63b;</span>返回</a>
    <p>{{title_s}}</p>
    <a href="javascript:;" @click="toRegist"><span class="iconfont">&#xe62d;</span>注册</a> 
    </div>
      <div class="main">
				<div  class="myimg">
					<img src="../../assets/img/4.png">
				</div>
					<div class="myform">
						<mt-field label="账号" placeholder="Input username" v-model="username" :attr="{ maxlength: 12 }"  ></mt-field>
						<mt-field label="密码" placeholder="Input password" type="password" v-model="password" :attr="{ maxlength: 16 }"></mt-field>
					</div>
					<mt-button type="danger" class="btns" @click="btns">登录</mt-button>
			</div>
    </div>
      </div> 
    
</template>

<script>

export default{
  data(){ 
      return{
        username:"",
        password:"",
        backTo:0
      }
  }, 
  props:{
  },
  methods:{
    btns(){
        var uname = new RegExp("^[0-9a-zA-z_]{6,12}$");
        var upwd = new RegExp("^[0-9a-zA-z_]{6,16}$");
        if(!uname.test(this.username)){
            this.$toast("用户名格式不正确")
        }else if(!upwd.test(this.password)){
            this.$toast("密码格式不正确")
            
        }else{
            console.log(11)
            console.log(this.username,this.password,77)
            var url = "login";
            var postData=this.qs.stringify({
                uname:this.username,
                upwd:this.password
            })
            console.log(postData,7777)
         
            this.axios.post(url,postData).then(res=>{
            
                console.log(res,88)
                if(res.data.code!=1){
                    this.$toast("用户名或密码不正确");
                }else{
                    sessionStorage.setItem("uid",res.data.uid);
                }
            })
        }  
    },
    back(){
        if(this.backTo == 0){
          this.$store.commit('setSelected',"4")
          this.$router.go(-1);
        }else if(this.backTo == 1){
          this.$store.commit('setSelected',"4")
          this.$router.push("/");
        }

      },
      toRegist(){
        this.$router.push({
          path:"regist",
          query:{
            back:1
          }
        });
      }
  },
  watch:{
      username(){
         // console.log(this.username);
      },
      password(){
         // console.log(this.password);
      }
  },
  created(){ 
    var backTo = this.$route.query.back;
    if(backTo !== undefined){
        this.backTo = backTo;
    }
  },
  

}
</script>
<style scoped>
    *{
        padding:0;
        margin:0;
        box-sizing:border-box;
    }
    .main{
        width:100%;
        padding:2rem 3rem;
    }
    .main .myimg{
        width:100%;
        padding:2rem 0;
        text-align:center;
    }
    .main .myimg img{
        width:5rem;
        height:5rem;
    }
    .main .mint-button{
        width:100% !important;
        background-color:#df3d3d !important;
        margin:2rem 0;
    }

  .outer{
    height:2.75rem;
    width:100%;
    background:#333;
    display:flex;
    justify-content:space-between;
    align-items:center;
    color:#fff;
    font-size:14px;
  }
  .outer>p{
    font-size:19px;
  }
  .outer>a{
    display:flex;
    width:20%;
    height:100%;
    justify-content:center;
    align-items:center;
    text-decoration:none;
    color:#fff;
  }
  .outer>a>span{
    margin-right:0.2rem;
  }
</style>
