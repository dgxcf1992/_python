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