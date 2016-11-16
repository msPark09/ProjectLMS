/*create*/
create table class(
	classid varchar2(12),	
	cexp varchar2(100),
	startday date,
	teacid varchar2(12),
	teacname varchar2(20),
	cobj varchar2(1000),
	cinfo varchar2(3000),
	cname varchar2(20),
	division varchar2(20),
	statu number(2),
	lectday number(4),
	cfname varchar2(50),
	priority number(5)
 );
 create table userlist(
 	id varchar2(12),
 	pw varchar2(20),
 	lv number,
 	name varchar2(20),
 	phone varchar2(15),
 	address varchar2(100),
 	mail varchar2(50)
 );
create table joblist(
id varchar2(12) primary key,
adminid varchar2(12),
jobname varchar2(50),
jobcont varchar2(1024),
jobweb varchar2(30),
jobfile varchar2(20)
);
create table student(
id varchar2(20),
classid varchar2(20),
attday number(5)
);
create table agreed(
 	id varchar2(12),
 	stuid varchar2(12),
 	stuname varchar2(20),
 	lectid varchar2(20),
 	agreed number(1)
 );
 create table project(
proid varchar2(20),
classid varchar2(20),
proname varchar2(50),
subname varchar2(50),
proexp varchar2(100),
proorin varchar2(20),
proren varchar2(20),
id varchar2(20)
);
create table prolist(
	proid varchar2(12),
	stuid varchar2(12),
	classid varchar2(12),
	proname varchar2(50),
	procont varchar2(1025),
	proday date,  
	name varchar2(20), 
	id varchar2(20),
	PRIMARY KEY(proid)
);

/*select*/
select * from class;
select * from joblist;
select * from agreed;
select * from project;
select * from prolist;
select * from student;
select * from userlist;

/*insert*/
/*강의 아이디/강의 설명/시작날짜/강사아이디/강사이름/강의목표/강의정보
  /강의이름/구분(수강중,수강종료,모집중)/상태(1,2,0)/강의총일수
 /강의파일이름/우선순위*/
insert into class values('');


/*drop*/
drop table class;
drop table joblist;
drop table agreed;
drop table project;
drop table prolist;
drop table student;
drop table userlist;