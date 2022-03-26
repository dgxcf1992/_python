-- 数据库的操作

	--连接数据库
	mysql -uroot -p
	mysql -uroot -p'password'
	
	--退出数据库
	exit/quit/ctrl+d

	--sql豫剧最后要由分号结尾
	
	--显示时间
	select now();

	--显示数据库版本
	select version();

	--查看所有数据库
	show databases;
	
	--创建数据库
	create database 数据库名字 charset = utf8;

	--查看创建数据库的语句
	show create database 数据库名字

	--查看当前使用的数据库
	select database();

	--使用数据库
	use 数据库名字;

	--删除数据库
	drop database 数据库名字


--数据表的操作

	--查看当前数据库所有的表
	show tables;

	--创建表
	--create table 数据表名字(字段  类型  约束[,字段 类型 约束]);
	create table xxxx(id int, name varchar(30));
	约束--
		auto_increment 
		not null
		primary key
		default
		
	--desc 表名 查看表结构
	create table students(
		id int unsigned not null auto_increment primary key,
		name varchar(30),
		age tinyint unsigned default 0,
		high decimal(5,2),
		gender enum("boy", "girl", "zhongxing", "baomi") default "baomi",
		cls_id int unsigned
	);
		

	--修改表
		--添加字段：alter table 表名 add 字段 类型 约束

		--修改字段:1、alter table 表名 modify 字段类型约束；
		--        2、alter table 表名 change 原子段 新字段 类型 约束;

		--删除字段: alter table 表名 drop 字段；

	--删除表
		--drop table 表名;

