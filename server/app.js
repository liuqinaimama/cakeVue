//1:引入第三方模块
const express=require("express");
const mysql = require("mysql");
const cors = require("cors");
const session=require("express-session");
const bodyParser = require('body-parser');

//2:配置第三方模块
  //2.1:配置连接池
    var pool = mysql.createPool({
        host:"127.0.0.1", //所要连接的电脑
        user:"root",
        password:"",
        port:3306,
        database:"cake",
        connectionLimit:15//同时连接的限制
    })
    //2.2跨域
     //创建服务器 server
     var app = express();
     app.listen(3000);
     
     
     //跨域
    app.use(cors({
        origin:["http://127.0.0.1:8080","http://localhost:8080"],//允许访问服务器的脚手架地址
        credentials:true,//
    }))
    //使用body-parser中间件

    //2.3配置session
   app.use(session({
        secret:"128位字符串",
        resave:true,//每次请求保存数据
        saveUninitialized:true,//保存初始化的数据
    }))
    //2.9:指定静态目录
    app.use(express.static("public"))
//3:完成第一个功能用户登陆 
    //路由地址为 login ；浏览器向web服务器发送请求

    app.use(bodyParser.urlencoded({extended:false}));
app.post("/login",(req,res)=>{
    //1.参数
      //请求的参数为uname upwd 
   var uname=req.body.uname;
   var upwd=req.body.upwd;
console.log(req.body,77)
    //1.1 正则表达式验证用户名和密码 （脚手架里验证，是为了验证用户输入是否正确； 服务器里验证，是为了防止 用户跳过正则表达式跳出验证）
    if(!uname){
        res.send({code:-3,msg:"uname不能为空"});
        return; 
      };
      if(!upwd){
        res.send({code:-2,msg:"upwd不能为空"});
        return;
      };
    //2.sql  服务器 通过 连接池 向数据库查询相应的数据的sql语句
    var sql="SELECT * FROM ";//()
    sql+=" h_user WHERE uname=?";//如果不能写在一行 加空格，防止前后连接在一起
    sql+=" AND upwd=md5(?)";//在前端部分（即浏览器地址栏输密码时，不用写md5()） 地址栏中只需要输入 ?部分的内容
    //3.json 通过 连接池 向数据库查询数据 ；数据库将结果 通过连接池 返回到服务器
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        //如果查询的结果的长度为0 
        if(result.length>0){
            res.send({code:1,msg:"登陆成功",uid:result[0].uid});
        }else{
            res.send({code:-1,msg:"用户名或密码错误"});
        } 
    })
})

app.post("/check",(req,res)=>{
    var uname=req.body.uname;
    console.log(uname);
    if(!uname){
      res.send({code:-2,msg:"uname不能为空"});
      return; 
    };
    pool.query("SELECT * FROM h_user WHERE uname=?",[uname],(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        res.send({code:-1,msg:"账号已存在",uid:result[0].uid});
      }else{
          res.send({code:1,msg:"账号可用"});
      } 
    })
  })

  app.post("/regist",(req,res)=>{
    var uname=req.body.uname;
    var upwd = req.body.upwd;
    var email = req.body.email;
    var nickname = req.body.user_name;
    if(!uname){
      res.send({code:-3,msg:"uname不能为空"});
      return; 
    };
    if(!upwd){
      res.send({code:-2,msg:"upwd不能为空"});
      return; 
    };
    if(!email){
      res.send({code:-1,msg:"email不能为空"});
      return; 
    }
    pool.query("INSERT INTO h_user (`uid`, `uname`, `upwd`,`email`,`user_name`) VALUES (NULL,?,md5(?),?,?);",[uname,upwd,email,nickname],(err,result)=>{
      if(err) throw err;
      if(result.affectedRows>0){
          res.send({code:1,msg:"注册成功"});
      }else{
          res.send({code:-1,msg:"注册失败"});
      } 
    })
  })
//写完 需测试 启动node app.js->在浏览器地址栏输入 http://127.0.0.1:3000/login?uname=tom&upwd=123->回车 只有get请求 能这样测试

//轮播
app.get("/swipe",(req,res)=>{
   
    //2.sql  服务器 通过 连接池 向数据库查询相应的数据的sql语句
    var sql="SELECT img,rid FROM ";//()
    sql+="h_index_carousel"; //如果不能写在一行 加空格，防止前后连接在一起
   
    //3.json 通过 连接池 向数据库查询数据 ；数据库将结果 通过连接池 返回到服务器
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        //如果查询的结果的长度为0 
        if(result.length==0){
            res.send({code:-1,msg:"图片错误"});
        }else{
            res.send({code:1,data:result})
        }
    })
})

//图片
app.get("/image",(req,res)=>{
   
    //2.sql  服务器 通过 连接池 向数据库查询相应的数据的sql语句
    var sql="SELECT pic,pid,title,price FROM ";//()
    sql+="h_cake_pic"; //如果不能写在一行 加空格，防止前后连接在一起
   
    //3.json 通过 连接池 向数据库查询数据 ；数据库将结果 通过连接池 返回到服务器
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        //如果查询的结果的长度为0 
        if(result.length==0){
            res.send({code:-1,msg:"图片错误"});
        }else{
            res.send({code:1,data:result})
        }
    })
})
//cake详情
app.get("/list",(req,res)=>{
    var sql="SELECT * FROM ";//()
    sql+="h_cake"; 
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        //如果查询的结果的长度为0 
        if(result.length==0){
            res.send({code:-1,msg:"失败"});
        }else{
            res.send({code:1,data:result})
        }
    })
})

//4：完成第二个功能：商品分页显示
app.get("/product",(req,res)=>{
    //1.参数
    var pno=req.query.pno
    var ps=req.query.pageSize;
    //2.设置默认值
    if(!pno){
        pno=1;//如果pno不存在 默认pno=1
    }
    if(!ps){ps=4;}//如果ps（pageSize）不存在 默认ps=4
    //3.创建分页显示的第一条sql语句执行
     //分页查询
    var sql="SELECT lid,title,img_url,price FROM xz_laptop LIMIT ?,?"//limit后的值必须是整型
    var offset=(pno-1)*ps;//每页的开始
    ps=parseInt(ps);//每页的数据量 pageSize
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err) throw err;
        var obj={code:1,msg:"查询成功",data:result}//为什么要这么写？
        obj.data=result;
        //sql嵌套 第二条sql语句
        var sql="SELECT count(*) AS c FROM xz_laptop";
        pool.query(sql,(err,result)=>{
            if(err) throw err;
          var pc=Math.ceil(result[0].c/ps);//  res.send(result)=>[{"c":43}]  所以需要result[0]=>{"c":43}  result[0].c=>43
          obj.pc=pc;//在前面创建的obj 里 插入 pc属性  pc：43/4
          res.send(obj);
          //为什么嵌套 因为nodejs 是异步执行（非自上而下 顺序布丁），不是按照js从上往下执行 所以需要嵌套
        })
        //测试方法：http://127.0.0.1:3000/product
        //测试方法：http://127.0.0.1:3000/product?pno=2
        //测试方法：http://127.0.0.1:3000/product?pno=2$pageSize=5;
    })
        //嵌套完成
    //4.返回值
    // {code:1,msg:"查询成功",data:[],pageCount:11}
})

//购物车部分

//5:完成第三个功能：查看指定用户购物车的列表
 //先登录，再查询购物车 http://127.0.0.1:3000/login?uname=tom&upwd=123 -->不关浏览器->http://127.0.0.1:3000/cart
app.get("/cart",(req,res)=>{
    //1.参数 （无参数） 因为在session里有
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    //2.sql
    var sql="SELECT id,img_url,title,price,count FROM xz_cart WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if (err) throw err;
        res.send({code:1,data:result})
    })
})
//6：功能四：删除购物车某项商品
app.get("/delItem",(req,res)=>{
    //1:参数购物车id
    var id=req.query.id;
    //2:sql 删除指定按数据
    var sql="DELETE FROM xz_cart WHERE id=?";
    //3:json
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        console.log(result);
        if(result.affectedRows>0){
            //如果影响的行数 affectedRows>0 删除成功
            res.send({code:1,msg:"删除成功"})
        }else{//否则删除失败
            res.send({code:-1,msg:"删除失败"})
        }
        //测试：先进行登录 ->在地址栏输入 http://127.0.0.1:3000/delItem?id=4
    })
})
//7:功能五：删除购物车选中商品
app.get("/delAll",(req,res)=>{
    //1：参数 1,2,3
 var ids=req.query.ids;
    //2:sql
    var sql=`DELETE FROM xz_cart WHERE id IN(${ids})`; //IN(1,2) in里面是值 ids是一个变量 所以需要写成模板字符串/或者字符串拼接
    //3:返回值 json
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        //添加，删除返回对象（用.affectedRows判断是否操作成功） ;查询返回数组（通过.length判断是否查询成功）
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"});
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
    //测试：http://127.0.0.1:3000/delAll?ids=7,8;
     
}) 

//当服务器重新启动时 session 缓存的session对象 id 就会清空 ，需要重新登录  Cart.vue?754f:84 Uncaught (in promise) TypeError: Cannot read property 'Symbol(Symbol.iterator)' of undefined
  