--数据的准备
	--创建一个数据库	
	create database python_test charset = utf8;

	--使用数据库
	use python_test;

	--显示当前使用的数据库
	select database();

	--创建一个数据表
	create table students(
		id int unsigned primary key auto_increment not null, 
		name varchar(20) default '',
		age tinyint unsigned default 0,
		height decimal(5,2),
		gender enum('男','女','中性','保密') default '保密',
		cls_id int unsigned default 0,
		is_del bit default 0 
		);

	--classes表

	create table classes(
		id int unsigned auto_increment primary key not null,
		name varchar(30) not null
		);


	--插入数据
	insert into students values
		(0,'小明',18,180.00,1,1,0),	
		(0,'小yue',11,180.00,1,2,0),
		(0,'小yu',13,180.00,2,1,0),
		(0,'小liu',128,180.00,2,2,0),
		(0,'小huang',28,180.00,2,1,0),
		(0,'小feng',138,180.00,2,2,0),
		(0,'小wang',48,180.00,3,3,0),
		(0,'小zhou',15,180.00,2,4,0),
		(0,'小chen',138,180.00,2,3,0),
		(0,'小fei',13,180.00,1,4,0),
		(0,'小jin',155,180.00,4,1,0),
		(0,'小xiang',12,180.00,1,1,0),
		(0,'小guo',182,180.00,2,2,0),
		(0,'小zhou',118,180.00,2,1,0);

	insert into classes values (0,'y1'),(1,'y2'),(0,'y3');





--查询
	--查询所有字段：
	--select * from 表名;
	select * from students;
	select * from classes;

	--查询指定字段
	--select 列1,列2 from 表名;
	select name,age from students;

	--使用as 给字段起名
	--select name as ‘姓名' from students;

	--给表起别名
	-- select s.name, s.gender from students as s;

	--去重
	--distinct 字段
	-- select distinct gender from students;

	--逻辑运算符
	> < >= <= != and or not 


	--模糊查询
		--like
		--% 替换1个或者多个
		--_替换1个
		--查询姓名中以“小”开始的名字
		-- select name from students where name like "小%";


		--查询有2个字的姓名
		-- select * from students where name like '__';

		--查询大于2个字的姓名;
		-- select * from students where name like '__%';
		
		--rlike 正则
		--查询以 小 开始的姓名
		--select * from students where name rlike '^小.*$';
		--查询以 小 开始的，g结尾的姓名
		--select * from students where name rlike '^小.*g$';

	--范围查询
		-- in (1,3,8)  表示在一个非连续的范围内
		--not in (1,3,8)  表示在不一个非连续的范围内

		--between ... and ... 在范围内

		select name, age from students where age between 18 and 90;
		select name, age from students where age not between 18 and 90;
		

	--空判断
		--判断空 is null

		--非空  is not null


	--排序
		--order by 字段1,字段2... (字段1相同，按字段2,....)
		--asc  升序
		--desc 降序
		--select * from students order by height asc, age desc, id asc.


	--聚合函数
		--count 总数

		--max 最大值

		--min 最小值

		--sum 求和

		--avg 平均值

		--round(a,int保留的位数) 四射五入

	--分组 group by （配合聚合使用，否则没意义）
	--select gender,count(gender) from students group by gender;

	--group_concat()
	--查询同种性别中的名字
	--select gender,group_concat(name,age,'--') from students group by gender;

	--group by ... having ...  (having 对 group by 进行约束)

	--where 对原表进行判断约束，having 对分组后的表进行判断约束

	--输入性别是一个人的姓名
	--select gender,group_concat(name) from students group by gender having count(*) = 1;


--分页(limit 放在最后)
	--limit start, count
	--start 不写->默认0

	--限制查询出来的数据个数.
	select * from students where gender= 1 limit 5

	--查询id 6-10
	select * from students limit 5,5;


--连接查询
	--内连接查询(取交集)
	--inner join ...on
	select * from students inner join classes; (全映射)
	select * from students inner join classes on students.cls_id=classes.id;

	--按照要求显示姓名、班级
	select s.*, c.name from students as s inner join classes as c on s.cls_id=c.id order by c.name, s.id asc;


	--左连接 left join ...on
	select s.*, c.name from students as s left join classes as c on s.cls_id=c.id ;

	--右连接 right join...on 与左连接相反

	--连接完是形成一个新表, 添加约束用having
	--查询学生表里班级不在班级表里的成员
	select s.*, c.name from students as s left join classes as c on s.cls_id=c.id having c.name is null;


--自关联
 	create table areas(
 		id int primary key,
 		title varchar(20),
 		pid int
 		);

    创建京东数据库：

    create database jing_dong charset=utf8;
        1

    使用京东数据库

    use jing_dong;
        1

    创建一个商品goods数据表

    create table goods(
        id int unsigned primary key auto_increment not null,
        name varchar(150) not null,
        cate_name varchar(40) not null,
        brand_name varchar(40) not null,
        price decimal(10,3) not null default 0,
        is_show bit not null default 1,
        is_saleoff bit not null default 0
    );
        1
        2
        3
        4
        5
        6
        7
        8
        9

    向goods表中插入数据

    insert into goods values(0,'r510vc 15.6英寸笔记本','笔记本','华硕','3399',default,default); 
    insert into goods values(0,'y400n 14.0英寸笔记本电脑','笔记本','联想','4999',default,default);
    insert into goods values(0,'g150th 15.6英寸游戏本','游戏本','雷神','8499',default,default); 
    insert into goods values(0,'x550cc 15.6英寸笔记本','笔记本','华硕','2799',default,default); 
    insert into goods values(0,'x240 超极本','超级本','联想','4880',default,default); 
    insert into goods values(0,'u330p 13.3英寸超极本','超级本','联想','4299',default,default); 
    insert into goods values(0,'svp13226scb 触控超极本','超级本','索尼','7999',default,default); 
    insert into goods values(0,'ipad mini 7.9英寸平板电脑','平板电脑','苹果','1998',default,default);
    insert into goods values(0,'ipad air 9.7英寸平板电脑','平板电脑','苹果','3388',default,default); 
    insert into goods values(0,'ipad mini 配备 retina 显示屏','平板电脑','苹果','2788',default,default); 
    insert into goods values(0,'ideacentre c340 20英寸一体电脑 ','台式机','联想','3499',default,default); 
    insert into goods values(0,'vostro 3800-r1206 台式电脑','台式机','戴尔','2899',default,default); 
    insert into goods values(0,'imac me086ch/a 21.5英寸一体电脑','台式机','苹果','9188',default,default); 
    insert into goods values(0,'at7-7414lp 台式电脑 linux ）','台式机','宏碁','3699',default,default); 
    insert into goods values(0,'z220sff f4f06pa工作站','服务器/工作站','惠普','4288',default,default); 
    insert into goods values(0,'poweredge ii服务器','服务器/工作站','戴尔','5388',default,default); 
    insert into goods values(0,'mac pro专业级台式电脑','服务器/工作站','苹果','28888',default,default); 
    insert into goods values(0,'hmz-t3w 头戴显示设备','笔记本配件','索尼','6999',default,default); 
    insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default); 
    insert into goods values(0,'x3250 m4机架式服务器','服务器/工作站','ibm','6888',default,default); 
    insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default);
        1
        2
        3
        4
        5
        6
        7
        8
        9
        10
        11
        12
        13
        14
        15
        16
        17
        18
        19
        20
        21

2.goods表查询

-- sql强化演练( goods 表练习)

-- 查询类型 cate_name 为 '超级本' 的商品名称 name 、价格 price ( where )
select name,price from goods where cate_name="超级本";

-- 显示商品的种类
-- 1 分组的方式( group by ) 
select cate_name from goods group by cate_name;

-- 2 去重的方法( distinct )
select distinct cate_name from goods;


-- 求所有电脑产品的平均价格 avg ,并且保留两位小数( round )
select round(avg(price),2) from goods;

-- 显示 每种类型 cate_name (由此可知需要分组)的 平均价格
select avg(price),cate_name from goods group by cate_name;


-- 查询 每种类型 的商品中 最贵 max 、最便宜 min 、平均价 avg 、数量 count
select cate_name,max(price),min(price),avg(price),count(*) from goods group by cate_name;

-- 查询所有价格大于 平均价格 的商品，并且按 价格降序 排序 order desc

-- 1 查询平局价格(avg_price)
select avg(price) as avg_price from goods;


-- 2 使用子查询
select * from goods where price>(select avg(price) as avg_price from goods) order by price desc;

-- 查询每种类型中最贵的电脑信息(难)

-- 1 查找 每种类型 中 最贵的 max_price 价格
select max(price) as max_price,cate_name from goods group by cate_name;

-- 2 关联查询 inner join 每种类型 中最贵的物品信息
-- select * from goods 
-- inner join
-- (select cate_name,max(price) as max_price from goods group by cate_name) as max_price_goods
-- on goods.cate_name=max_price_goods.cate_name and goods.price=max_price_goods.max_price;
select * from goods
inner join
(select max(price) as max_price,cate_name from goods group by cate_name) 
as max_price_goods
on goods.cate_name=max_price_goods.cate_name and goods.price=max_price_goods.max_price;



---------------------------------------------------------------------------------
