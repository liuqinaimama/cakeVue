SET NAMES UTF8;
DROP DATABASE IF EXISTS cake;
CREATE DATABASE cake CHARSET=UTF8;
USE cake;

/**蛋糕系列**/
CREATE TABLE h_cake_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

INSERT INTO h_cake_family VALUES(NULL,"新品上市");
INSERT INTO h_cake_family VALUES(NULL,"天然奶油蛋糕");
INSERT INTO h_cake_family VALUES(NULL,"法式蛋糕");
INSERT INTO h_cake_family VALUES(NULL,"乳酪蛋糕");
INSERT INTO h_cake_family VALUES(NULL,"慕斯蛋糕");
INSERT INTO h_cake_family VALUES(NULL,"巧克力风味蛋糕");
INSERT INTO h_cake_family VALUES(NULL,"大型庆典蛋糕");



/**好利来蛋糕**/
CREATE TABLE h_cake(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属蛋糕系列编号
  title VARCHAR(128),         #主标题
  price DECIMAL(5,2),         #价格
  promise VARCHAR(64),        #服务承诺
  hint VARCHAR(64),           #温馨提示
  spec VARCHAR(64),           #规格/颜色 
  img VARCHAR(128), 
  FOREIGN KEY(family_id) REFERENCES h_cake_family(fid) 
);

INSERT INTO h_cake VALUES(1,1,"福寿绵长蛋糕",205,"100%使用进口天然稀奶油的长寿祝福，绵延整个南山","五环内3小时免费送达","20cm/25cm/30cm","http://127.0.0.1:3000/img/cake/1.jpg");
INSERT INTO h_cake VALUES(2,1,"甜蜜时光蛋糕",169,"100%使用进口干酪与100%使用进口天然稀奶油搭配一起，使得意式风情的甜蜜时光更是浪漫","五环内3小时免费送达","15cm/20cm/25cm","http://127.0.0.1:3000/img/cake/2.jpg");
INSERT INTO h_cake VALUES(3,1,"萌萌兔蛋糕",339,"呆萌兔儿的梦想很简单，就是吃口100%使用进口天然稀奶油的香甜","五环内3小时免费送达","15cm/20cm/25cm/15cm+25cm","http://127.0.0.1:3000/img/cake/3.jpg");
INSERT INTO h_cake VALUES(4,1,"分享蛋糕【聚会推荐款】",168,"100%使用进口天然稀奶油，四种口味四种色彩纵享分享的快乐","蛋糕上的“羊儿造型”，为北京所有门店统一造型，不可更改，请谅解，谢谢~","11cm×11cm","http://127.0.0.1:3000/img/cake/4.jpg");
INSERT INTO h_cake VALUES(5,1,"咩咩羊蛋糕",169,"小羊的聪明才智来源于不断地尝试，不断地创新，不断地发掘100%使用进口天然稀奶油的美味所在","","15cm/20cm/25cm/30cm","http://127.0.0.1:3000/img/cake/5.jpg");
INSERT INTO h_cake VALUES(6,1,"花漾蛋糕",248,"100%使用进口天然稀奶油的香气随风而至，傲娇的味蕾再也按耐不住，心花朵朵开","","20cm/25cm","http://127.0.0.1:3000/img/cake/6.jpg");
INSERT INTO h_cake VALUES(7,1,"芭蕾公主蛋糕【奶油季专款】",198,"可爱的芭蕾公主，凭借曼妙舞姿，在100%使用进口天然稀奶油造就的舞台上，荣获众多鲜花和掌声","订购提示： 1、下单默认芝士奶油鲜草莓夹心口味。 2、酸奶提子夹心口味，杂果罐头夹心口味请备注说明，无备注按默认夹心制作","15cm","http://127.0.0.1:3000/img/cake/7.jpg");
INSERT INTO h_cake VALUES(8,1,"莓果芝士蛋糕",228,"粉色记忆弥足珍贵，100%使用进口干酪的甜美瞬间更是稀少，此时的莓果祝福注定不能少","","15cm/20cm","http://127.0.0.1:3000/img/cake/8.jpg");
INSERT INTO h_cake VALUES(9,1,"魔法森林蛋糕",208,"被100%使用天然稀奶油施了魔法的森林，将毕生的甜美凝于一处，静等有缘人","订购提示：请提前1天16:00前预订","16cm×16cm","http://127.0.0.1:3000/img/cake/9.jpg");


INSERT INTO h_cake VALUES(13,2,"缤纷盛果蛋糕【生日推荐款】",217,"100%使用进口天然稀奶油；搭配丰富的水果。","五环内3小时免费送达","20cm/25cm/30cm","http://127.0.0.1:3000/img/cake/10.jpg");
INSERT INTO h_cake VALUES(14,2,"草莓公主蛋糕",189,"娇艳欲滴草莓公主，在100%使用天然稀奶油的陪衬下鲜美无比，似乎每个人都想咬上一口", "NULL","15cm/20cm/25cm/30cm","http://127.0.0.1:3000/img/cake/11.jpg");
INSERT INTO h_cake VALUES(15,2,"经典100%蛋糕【生日推荐款】",218,"100%使用进口天然稀奶油；奶油丰富，简约时尚，享受经典原味。","五环内3小时免费送达","20cm/25cm/30cm","http://127.0.0.1:3000/img/cake/12.jpg");
INSERT INTO h_cake VALUES(16,2,"华尔兹蛋糕【推荐款】",228,"100%使用进口天然稀奶油；搭配进口扁桃仁片。","订购提示：活动产品，仅限直径20cm规格。Φ20cm规格可提前2小时预订（数量有限），其他规格请提前4小时预订。","15cm","http://127.0.0.1:3000/img/cake/13.jpg");
INSERT INTO h_cake VALUES(17,2,"大黑爱小白蛋糕",208,"大黑的世界，只有小白能懂，甜蜜的童话在100%使用天然稀奶油的保护下更是多彩缤纷","蛋糕上的“2个卡通造型”，为固定款式，不可替换，请谅解，谢谢~","15cm/20cm","http://127.0.0.1:3000/img/cake/14.jpg");
INSERT INTO h_cake VALUES(18,2,"盛夏果实蛋糕",248,"草莓的吻痕与天然稀奶油一起直达味蕾，清香甘甜的感觉立即遍布全身，稍后与舌尖的点点坚果香碰撞，岂是一个“美”字了得","NULL","15cm×15cm","http://127.0.0.1:3000/img/cake/15.jpg");
INSERT INTO h_cake VALUES(19,2,"童梦奇缘蛋糕",198,"孩子们都有个游乐园般的欢乐梦想，就是被100%使用进口天然稀奶油做成的礼物包围。（产品以实物为准）","蛋糕上的“兔子造型”，为固定装饰物，不可替换，请谅解，谢谢~","15cm/20cm","http://127.0.0.1:3000/img/cake/16.jpg");
INSERT INTO h_cake VALUES(20,2,"草莓芳芳蛋糕",248,"100%使用进口天然稀奶油，匠心凝制而成原味蛋糕坯，四周粘有薄脆碎饼干，表层小心翼翼的挤出天然稀奶油球，搭配红艳草莓，春日的音符不禁四散开来","NULL","15cm×15cm","http://127.0.0.1:3000/img/cake/17.jpg");
INSERT INTO h_cake VALUES(21,2,"雪域森林蛋糕",258,"巧克力的甜美，奥利奥的童年，你的那片雪域森林梦想实现了吗？尝过了100%使用进口天然稀奶油的甜美吗？","NULL","15cm","http://127.0.0.1:3000/img/cake/18.jpg");
INSERT INTO h_cake VALUES(22,2,"聚福蛋糕",498,"儿孙满堂的天伦之乐，
只有100%使用进口天然稀奶油的甜才能表达","NULL","15cm","http://127.0.0.1:3000/img/cake/19.jpg");

INSERT INTO h_cake VALUES(23,3,"莓果芝士蛋糕",228,"粉色记忆弥足珍贵，100%使用进口干酪的甜美瞬间更是稀少，此时的莓果祝福注定不能少","订购提示：请提前一天16:00前预订","35cm","http://127.0.0.1:3000/img/cake/20.jpg");
INSERT INTO h_cake VALUES(24,3,"森林狂想曲蛋糕",228,"100%使用进口天然稀奶油，简单时尚的“裸”蛋糕","订购提示：Φ13cm、Φ18cm规格可提前3小时预订（数量有限），其他规格请提前一天16:00前预订。","13cm/18cm/23cm","http://127.0.0.1:3000/img/cake/21.jpg");


INSERT INTO h_cake VALUES(28,4,"莓果芝士蛋糕",228,"粉色记忆弥足珍贵，100%使用进口干酪的甜美瞬间更是稀少，此时的莓果祝福注定不能少","订购提示：请提前一天16:00前预订","15cm/25cm","http://127.0.0.1:3000/img/cake/22.jpg");
INSERT INTO h_cake VALUES(29,4,"轻柔芝士蛋糕【首推3小时】",228,"100%使用进口干酪的轻柔，表达着赤诚的真心，感动你我","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","18cm/23cm","http://127.0.0.1:3000/img/cake/23.jpg");

INSERT INTO h_cake VALUES(30,5,"甜蜜时光蛋糕",228,"100%使用进口干酪与100%使用进口天然稀奶油搭配一起，使得意式风情的甜蜜时光更是浪漫","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","18cm/23cm","http://127.0.0.1:3000/img/cake/24.jpg");


INSERT INTO h_cake VALUES(31,6,"暗香蛋糕",228,"三层巧克力蛋糕坯，双层巧克力奶油，每一块都那么均匀那么平整，逐渐成为聚会分享爆款","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","18cm/23cm","http://127.0.0.1:3000/img/cake/25.jpg");
INSERT INTO h_cake VALUES(32,6,"经典黑森林蛋糕【推荐款】",228,"100%使用进口天然稀奶油，与樱桃层层融合。","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","18cm/23cm","http://127.0.0.1:3000/img/cake/26.jpg");
INSERT INTO h_cake VALUES(33,6,"巧克力盛宴蛋糕",228,"巧克力奶油天堂，每一口都能尝到巧克力的香甜，每一口都有100%使用进口天然稀奶油的自然味道","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","18cm/23cm","http://127.0.0.1:3000/img/cake/27.jpg");

INSERT INTO h_cake VALUES(34,7,"福寿延年",1228,"100%使用进口天然稀奶油，多桃多寿。","订购提示：直径18cm可提前3小时预订，其他规格请提前一天16:00前预订","5层/6层/8层/3层","http://127.0.0.1:3000/img/cake/28.jpg");
INSERT INTO h_cake VALUES(35,7,"挚爱一生",1299,"挚爱一生，见证此刻幸福，天然奶油的甜蜜祝福，由味道铭记。","订购提示：请您提前两天16:00前预订","5层/6层/8层/3层","http://127.0.0.1:3000/img/cake/29.jpg");



/**蛋糕图片**/
CREATE TABLE h_cake_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  cake_id INT,
  pic VARCHAR(128),            #图片路径
  title VARCHAR(64),
  price VARCHAR(30),
  FOREIGN KEY(cake_id) REFERENCES h_cake(cid)

);
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/1.jpg","经典100%生日蛋糕【生日推荐款】","￥218/20cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/2.jpg","缤纷圣果【生日推荐款】","￥308/25cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/3.jpg","草莓公主蛋糕【生日推荐款】","￥228/20cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/4.jpg","大黑爱小白蛋糕","￥228/15cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/5.jpg","萌萌兔蛋糕","￥248/25cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/6.jpg","咩咩羊蛋糕","￥228/20cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/7.jpg","萌萌兔蛋糕","￥248/25cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/8.jpg","甜蜜时光蛋糕","￥194/20cm");
INSERT INTO h_cake_pic VALUES(NULL,1,"http://127.0.0.1:3000/img/cake/9.jpg","福寿延绵蛋糕","￥228/20cm");
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/10.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/11.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/12.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/13.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/14.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/15.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/16.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/17.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/18.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,2,"http://127.0.0.1:3000/img/cake/19.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,3,"http://127.0.0.1:3000/img/cake/20.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,3,"http://127.0.0.1:3000/img/cake/21.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,4,"http://127.0.0.1:3000/img/cake/22.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,4,"http://127.0.0.1:3000/img/cake/23.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,5,"http://127.0.0.1:3000/img/cake/24.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,6,"http://127.0.0.1:3000/img/cake/25.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,6,"http://127.0.0.1:3000/img/cake/26.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,6,"http://127.0.0.1:3000/img/cake/27.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,7,"http://127.0.0.1:3000/img/cake/28.jpg",NULL,NULL);
INSERT INTO h_cake_pic VALUES(NULL,7,"http://127.0.0.1:3000/img/cake/29.jpg",NULL,NULL);



/****首页轮播广告商品****/
CREATE TABLE h_index_carousel(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)  
);
INSERT INTO h_index_carousel VALUES(NULL,"http://127.0.0.1:3000/img/marchat/1s.jpg","轮播广告商品1","");
INSERT INTO h_index_carousel VALUES(NULL,"http://127.0.0.1:3000/img/marchat/2s.jpg","轮播广告商品2","");
INSERT INTO h_index_carousel VALUES(NULL,"http://127.0.0.1:3000/img/marchat/3s.jpg","轮播广告商品3","");


/****首页商品****/
CREATE TABLE h_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  subtitle VARCHAR(128),
  pic VARCHAR(128),
  href VARCHAR(128)
);
INSERT INTO h_index_product VALUES(NULL,"经典系列","CLASSIC SERIES","img/homepage/6.jpg","");
INSERT INTO h_index_product VALUES(NULL,"儿童系列","CHILDREN SERIES","img/homepage/7.jpg","");
INSERT INTO h_index_product VALUES(NULL,"尊爱系列","RESPECT AND LOVE SERIES","img/homepage/8.jpg","");

/**好利来用户表**/
CREATE TABLE h_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(16),     #头像路径
  user_name VARCHAR(32),  #用户名
  gender INT              #性别 0-女  1-男
);
INSERT INTO h_user VALUES(NULL,"lovecake",md5("121456"),"123456@qq.com",18546784261,"","要子杰",1);
INSERT INTO h_user VALUES(NULL,"lovecake1",md5("113456"),"123457@qq.com",18546884261,"","王睿",0);
INSERT INTO h_user VALUES(NULL,"lovecake2",md5("123456"),"123458@qq.com",18546784361,"","Jack",1);
INSERT INTO h_user VALUES(NULL,"lovecake3",md5("123476"),"123459@qq.com",18546784461,"","lisa",0);
INSERT INTO h_user VALUES(NULL,"lovecake4",md5("1234756"),"1234566@qq.com",18546788561,"","张子杰",1);
INSERT INTO h_user VALUES(NULL,"lovecake5",md5("1237756"),"1234568@qq.com",18546784261,"","rose",0);
INSERT INTO h_user VALUES(NULL,"lovecake6",md5("1238856"),"1234569@qq.com",18546784265,"","leo",1);


/**收获地址信息**/
CREATE TABLE h_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,     #用户编码
  receiver VARCHAR(16), #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN ,         #是否为当前用户的默认收货地址
  FOREIGN KEY (user_id) REFERENCES h_user(uid)
);
/**购物车条目**/
CREATE TABLE h_shopping_item(
  iid INT  PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  cake_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN, #是否已勾选，确定购买
  FOREIGN KEY (user_id) REFERENCES h_user(uid),
  FOREIGN KEY (cake_id) REFERENCES h_cake(cid)

);
/**用户订单**/
CREATE TABLE h_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT,   #签收时间
  FOREIGN KEY (user_id) REFERENCES h_user(uid),
  FOREIGN KEY (address_id) REFERENCES h_receiver_address(aid)
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE h_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT,               #购买数量
  FOREIGN KEY (order_id) REFERENCES h_order(aid)
);



/*******************/
/******数据导入******/
/*******************/
/**好利来蛋糕系列**/

