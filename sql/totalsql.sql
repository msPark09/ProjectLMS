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
alter table userlist modify(phone varchar2(15))
update userlist set phone=null
update userlist set phone='010-1234-1234'
 create table joblist(
id varchar2(12) primary key,
adminid varchar2(12),
jobname varchar2(50),
jobcont varchar2(1024),
jobweb varchar2(30),
jobfile varchar2(20)
);

 alter table student modify(id varchar2(12))
 alter table class modify(classid varchar2(12))
 alter table agreed modify(id varchar2(12))
 
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

 select * from agreed
 
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

insert into prolist values ('P000','user1','C000','임시제목1','임시내용1',sysdate,'홓호홍1','kangsa1');
insert into prolist values ('P001','user1','C001','임시제목2','임시내용2',sysdate,'홓호홍2','kangsa2');
insert into prolist values ('P002','user1','C002','임시제목3','임시내용3',sysdate,'홓호홍3','kangsa3');
insert into prolist values ('P003','user1','C003','임시제목4','임시내용4',sysdate,'홓호홍4','kangsa4');
insert into prolist values ('P004','user1','C000','임시제목5','임시내용5',sysdate,'홓호홍5','kangsa5');

insert into test values ('T000','임시시험','user1','C000',70);
insert into test values ('T001','임시시험','user1','C001',80);
insert into test values ('T002','임시시험','user1','C002',90);
insert into test values ('T003','임시시험','user1','C003',90);
insert into PROJECT values ('P000','C000','임시강의1','작성제목1','과제설명1','Desktop.7z','Desktop.7z','user1');
insert into PROJECT values ('P001','C001','임시강의2','작성제목2','과제설명2','Desktop.7z','Desktop.7z','user1');
insert into PROJECT values ('P002','C002','임시강의3','작성제목3','과제설명3','Desktop.7z','Desktop.7z','user1');
insert into class values('C000','6개월',sysdate,'관리자01','최정웅','귀에 쏙쏙 강의','자바,웹개발,프레임워크','자바','국비지원',7,180,'없음',1);
 insert into class values('C001','6개월',sysdate,'관리자01','최정웅','귀에 쏙쏙 강의','자바,웹개발,프레임워크','웹 개발','국비지원',7,180,'없음',2);
 insert into class values('C003','6개월',sysdate,'관리자01','최정웅','귀에 쏙쏙 강의','자바,웹개발,프레임워크','프레임워크','국비지원',7,180,'없음',3);
 insert into class values('C003','6개월',sysdate,'관리자01','최정웅','귀에 쏙쏙 강의','자바,웹개발,프레임워크','임시','국비지원',7,180,'없음',3);


drop table project;
drop table prolist;
drop table test;

 create table prolist(
proid varchar2(20),
classid varchar2(20),
proname varchar2(50),
procont varchar2(1025),
proday DATE,
name varchar2(20),
id varchar2(20)
/*stuid varchar2(20)*/
/*stuid 누락 필요*/
);


create table test(
testid varchar2(20),
proname varchar2(50),
id varchar2(20),
classid varchar2(20),
grade number(3)
);

-> Class 테이블 

 insert into class values('class00','6개월',sysdate,'teac1','최정웅','자바를 배우자','자바,웹개발,프레임워크를 진행합니다','자바','모집중',0,180,'없음',1);
 insert into class values('class01','6개월',sysdate,'teac1','최정웅','웹개발을 하자','자바,웹개발,프레임워크를 진행합니다','웹 개발','모집중',0,180,'없음',2);
 insert into class values('class02','6개월',sysdate,'teac1','최정웅','프레임워크부수기','자바,웹개발,프레임워크를 진행합니다','프레임워크','모집중',0,180,'없음',3);
 insert into class values('class03','2개월','16-10-01','teac1','최정웅','프레임워크부수기','자바,웹개발,프레임워크를 진행합니다','안드로이드','수강종료',2,60,'없음',5);
 insert into class values('class04','6개월','16-11-15','teac1','최정웅','프레임워크부수기','자바,웹개발,프레임워크를 진행합니다','윈도우반','수강중',1,180,'없음',4);
 
/*모집중 : 0 수강중 : 1 수강 종료 : 2  */
-> Userlist 테이블  

insert into userlist values('user0','pw0',1,'박미선','0101234','서울','0000@naver.com');
insert into userlist values('user1','pw0',1,'최힘찬','0101234','서울','0000@naver.com');
insert into userlist values('user2','pw0',1,'임경영','0101234','서울','0000@naver.com');
insert into userlist values('user3','pw0',1,'최정웅','01012348888','서울','0000@naver.com');
학생
insert into userlist values('teac1','pw1',2,'최정웅','0101234','서울','0000@naver.com');
강사
insert into userlist values('sys1','pw2',3,'영업팀1','0101234','서울','0000@naver.com');
행정
insert into userlist values('admin1','pw3',4,'행정팀1','0101234','서울','0000@naver.com');
영업
/*학생:1 강사:2 영업팀 :3 행정팀:4 각 권한별 사용자 데이터 넣기*/

-> joblist 테이블

insert into joblist values('jList_comp1', 
'comp1',
'○○너스 웹 개발자 구인',
'안녕하세요! 한빛교육센터 취업지원팀 이경진 대리입니다.<br/>
채용공고 확인 후 회사에 대해서(*직무내용,인재상,고용형태, 근무예정지,급여수준,근무시간,사원수등)
신중하게 알아보시고 입사지원을 희망하시는 학생들은 말씀해 주시기 바랍니다.<br/>
기업으로 이메일을 통해, 입사를 희망하시는 학생들의 이력서와 자기소개서를 보낼 예정입니다.<br/>
작성 예) 이름 / 과정 수료일 / 면접 가능일 / 홈페이지상 해당채용정보 글번호 기재요망<br/>
* 첨부파일 (이력서,자기소개서,프로젝트나 경력기술서)<br/>
- 취업지원절차 -<br/>
1. 이력서 작성&접수<br/>
2. 이력서 클리닉(이력서 작성 비결 제공 및 지도)<br/>
3. 취업전략(1:1 맞춤상담)<br/>
4. 면접클리닉(면접 비결 제공 및 면접 지도)<br/>
5. 취업처 선별& 추천<br/>
6. 취업',
'www.hanbitedu.co.kr',
'이력서.docx'
);
insert into joblist values('jList_comp2', 
'comp2',
'앱 개발자 구합니다!',
'안녕하세요! 한빛교육센터 취업지원팀 이경진 대리입니다.<br/>
채용공고 확인 후 회사에 대해서(*직무내용,인재상,고용형태, 근무예정지,급여수준,근무시간,사원수등)
신중하게 알아보시고 입사지원을 희망하시는 학생들은 말씀해 주시기 바랍니다.<br/>
기업으로 이메일을 통해, 입사를 희망하시는 학생들의 이력서와 자기소개서를 보낼 예정입니다.<br/>
작성 예) 이름 / 과정 수료일 / 면접 가능일 / 홈페이지상 해당채용정보 글번호 기재요망<br/>
* 첨부파일 (이력서,자기소개서,프로젝트나 경력기술서)<br/>
- 취업지원절차 -<br/>
1. 이력서 작성&접수<br/>
2. 이력서 클리닉(이력서 작성 비결 제공 및 지도)<br/>
3. 취업전략(1:1 맞춤상담)<br/>
4. 면접클리닉(면접 비결 제공 및 면접 지도)<br/>
5. 취업처 선별& 추천<br/>
6. 취업',
'www.hanbitedu.co.kr',
'이력서2.docx'
);
insert into joblist values('jList_comp3', 
'comp3',
'[구인구직]인재를 채용합니다.',
'안녕하세요! 한빛교육센터 취업지원팀 이경진 대리입니다.<br/>
채용공고 확인 후 회사에 대해서(*직무내용,인재상,고용형태, 근무예정지,급여수준,근무시간,사원수등)
신중하게 알아보시고 입사지원을 희망하시는 학생들은 말씀해 주시기 바랍니다.<br/>
기업으로 이메일을 통해, 입사를 희망하시는 학생들의 이력서와 자기소개서를 보낼 예정입니다.<br/>
작성 예) 이름 / 과정 수료일 / 면접 가능일 / 홈페이지상 해당채용정보 글번호 기재요망<br/>
* 첨부파일 (이력서,자기소개서,프로젝트나 경력기술서)<br/>
- 취업지원절차 -<br/>
1. 이력서 작성&접수<br/>
2. 이력서 클리닉(이력서 작성 비결 제공 및 지도)<br/>
3. 취업전략(1:1 맞춤상담)<br/>
4. 면접클리닉(면접 비결 제공 및 면접 지도)<br/>
5. 취업처 선별& 추천<br/>
6. 취업',
'www.hanbitedu.co.kr',
'test.txt'
);
insert into joblist values('jList_comp4', 
'comp4',
'급) NHSystems(자)농협) 공개채용',
'안녕하세요! 한빛교육센터 취업지원팀 이경진 대리입니다.<br/>
채용공고 확인 후 회사에 대해서(*직무내용,인재상,고용형태, 근무예정지,급여수준,근무시간,사원수등)
신중하게 알아보시고 입사지원을 희망하시는 학생들은 말씀해 주시기 바랍니다.<br/>
기업으로 이메일을 통해, 입사를 희망하시는 학생들의 이력서와 자기소개서를 보낼 예정입니다.<br/>
작성 예) 이름 / 과정 수료일 / 면접 가능일 / 홈페이지상 해당채용정보 글번호 기재요망<br/>
* 첨부파일 (이력서,자기소개서,프로젝트나 경력기술서)<br/>
- 취업지원절차 -<br/>
1. 이력서 작성&접수<br/>
2. 이력서 클리닉(이력서 작성 비결 제공 및 지도)<br/>
3. 취업전략(1:1 맞춤상담)<br/>
4. 면접클리닉(면접 비결 제공 및 면접 지도)<br/>
5. 취업처 선별& 추천<br/>
6. 취업',
'www.hanbitedu.co.kr',
'이력서2.docx'
);
insert into joblist values('jList_comp5', 
'comp5',
'안녕하세요. 인재 희망합니다',
'안녕하세요! 한빛교육센터 취업지원팀 이경진 대리입니다.<br/>
채용공고 확인 후 회사에 대해서(*직무내용,인재상,고용형태, 근무예정지,급여수준,근무시간,사원수등)
신중하게 알아보시고 입사지원을 희망하시는 학생들은 말씀해 주시기 바랍니다.<br/>
기업으로 이메일을 통해, 입사를 희망하시는 학생들의 이력서와 자기소개서를 보낼 예정입니다.<br/>
작성 예) 이름 / 과정 수료일 / 면접 가능일 / 홈페이지상 해당채용정보 글번호 기재요망<br/>
* 첨부파일 (이력서,자기소개서,프로젝트나 경력기술서)<br/>
- 취업지원절차 -<br/>
1. 이력서 작성&접수<br/>
2. 이력서 클리닉(이력서 작성 비결 제공 및 지도)<br/>
3. 취업전략(1:1 맞춤상담)<br/>
4. 면접클리닉(면접 비결 제공 및 면접 지도)<br/>
5. 취업처 선별& 추천<br/>
6. 취업',
'www.hanbitedu.co.kr',
'이력서.docx'
);


-> student 테이블

insert into student values ('user0','class00', 0);
insert into student values ('user1','class00', 0);
insert into student values ('user2','class00', 100);


-> agreed 테이블

  insert into agreed values('listID1','user0','박미선','class00',1);
  insert into agreed values('listID2','user1','최힘찬','class00',0);
  insert into agreed values('listID3','user2','임경영','class01',0);
  /*insert into agreed values ('1','class00',(select id,',',name from uno where id='jaorp'),0);*/
 
  -/
-> project 테이블


insert into project values ('pro01','class00','2차과제 LMS 제출요망','LMS프로젝트 클래스다이어그램입니다','클래스다이어그램 제출합니다. 확인해 주세요!!!!','classdiagram.xml','classdiagram.xml','user0');
insert into project values ('pro01','class00','2차과제 LMS 제출요망','[과제제출]클래스다이어그램!','클래스다이어그램 제출합니다. 확인해 주세요!!!!','classdiagram.xml','classdiagram.xml','user1');
insert into project values ('pro02','class01','1차 JAVA 프로그래밍','3조 시퀀스 다이어그램 제출합니다.','시퀀스도 냅니다요. 클래스다이어그램 제출했다요. 확인해 주세요!!!!','classdiagram.xml','classdiagram.xml','user2');

-> prolist 테이블


insert into prolist values ('pro01','class00','2차과제 LMS 제출요망','내용내용내용내용내용내용내용','16-10-21','최정웅','teac1');
insert into prolist values ('pro02','class00','1차과제 자유주제','내용내용내용내용내용내용내용','16-09-01','최정웅','teac1');
delete from prolist where classid='class00'
insert into prolist values ('pro01','class00','2차과제 LMS 제출요망','내용내용내용내용내용내용내용','16-10-21','최정웅','teac1');
insert into prolist values ('pro02','class01','1차 JAVA 프로그래밍','내용내용내용내용내용내용내용내용내용내용','16-12-31','최정웅','teac1');
insert into prolist values ('pro03','class02','서브과제LMS시스템 프로그래밍','내용내용내용내용내용내용내용내용내용','16-12-31','최정웅','teac1');

select * from prolist

-> test 테이블

insert into test values ('test1','pro01','user0','class00','80');
insert into test values ('test2','pro01','user1','class00',null);

-/

 select*from class;
 select*from userlist;
 select*from agreed;
 select * from project
 select*from test;
 
 /*/- 강사쪽
 select proname, proday from prolist where classid='A1'
 select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id;
 select C.subname, D.name, C.grade from (select * from project A, test B where B.id = A.id) C, userlist D
 select C.subname, D.name, C.grade from (select A.id as id, B.grade as grade, A.subname as subname from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id;
 select name, phone from (select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id) where classid='A1' order by name
 select name, phone from (select * from userlist A, student B where A.id = B.id) where classid='classid' order by name
 select classid,cname,division from class where cname like '%%' and division='강의중'
 select cname,division from class
 select B.proid, B.subname, B.proexp, B.proorin, B.id, C.name  from (select proid,subname,proexp,proorin,id from project A) B inner join userlist C on B.id = C.id where B.proid='pro2' and B.id='user22'

select name, phone from (select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id) where classid=(select B.classid from student A,class B where  A.classid=B.classid) order by name

select classid,cname,division from class where cname like '%%' and division='강의종료'

select C.proid, C.subname, C.proexp, C.proorin, D.name, C.grade, C.id from (select A.proid as proid, A.subname as subname, A.proexp as proexp, A.proorin as proorin, A.id as id, B.grade as grade from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid='pro2' and C.id='user22'
select C.proid, C.subname, C.proexp, C.proorin, D.name, C.grade, C.id from (select A.proid as proid, A.subname as subname, A.proexp as proexp, A.proorin as proorin, A.id as id, B.grade as grade from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid='pro1' and C.id='user1'
-/ 

/-행정반
select count(*) as cnt from suup where lectid='Lect1'
select * from suup inner join person on suup.stuid = person.id where suup.lectid = 'Lect1';
select * from suup inner join person on suup.stuid = person.id where suup.lectid = 'Lect4' order by attnday
select * from (select * from suup inner join person on suup.stuid = person.id where suup.lectid ='Lect4') where attnday <= 90
select * from (select * from suup inner join person on suup.stuid = person.id where suup.lectid ='Lect1') where name like '%유%'
-/
*/

drop table class;
 drop table userlist;
 drop table student;
 drop table agreed;
/*
 update class set teacid='teacher1';
 update USERLIST set name='test' where id='user22'
 update test set grade=70 where testid='test1' and id='user3';
 update student set attnday=100 where stuid='id2';
 update student set attnday=50 where lectid='Lect2';
 
delete from project 
delete from test;

alter table lecture modify (lect varchar2(50));
alter table lecture add (id varchar) 
alter table person modify(ph varchar2(15));
alter table student add(attnday number(3));
alter table agreed modify(id number(4))*/
 select * from student inner join userlist on student.id = userlist.id where student.classid = 'class00' order by attday
 select * from (select userlist.id, classid, attday,pw,lv,name,phone,address,mail from student inner join userlist on student.id = userlist.id where student.classid ='class00') where attday <= 50