/*create*/
create table class(
	classid varchar2(12),	
	cexp varchar2(100),
	startday date,
	teacid varchar2(12),
	teacname varchar2(20),
	cobj varchar2(1000),
	cinfo varchar2(3000),
	cname varchar2(100),
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
proexp varchar2(300),
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
create table test(
testid varchar2(20),
proname varchar2(50),
id varchar2(20),
classid varchar2(20),
grade number(3),
proid varchar2(20)
);

/*select*/
select * from class;
select * from joblist;
select * from agreed;
select * from project;
select * from prolist;
select * from student;
select * from userlist;
select * from test;

select * from (select A.proid, A.classid, A.proname, A.subname, A.proexp, A.proorin, A.proren, A.id, B.testid, B.grade from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid='P006'

select * from (select a.proid, a.classid, a.proname, a.subname, a.proexp, a.proorin, a.proren, a.id, b.testid, b.grade from PROJECT A, test B where a.PROID = b.proid) c inner join userlist d on c.id=d.id where c.proname='1차자유주제'

select * from prolist where classid='C06'

select C.testid, C.proid, C.subname, C.proexp, C.proorin, D.name, C.id, C.grade from (select A.proid, A.subname, A.proexp, A.proorin, A.id, B.grade, B.testid from project A, test B where B.proid = A.proid) C inner join userlist D on C.id = D.id where C.proid='P002' and C.id='stu2'

select A.classid,A.cname,A.statu,A.stuid,A.agreed,B.grade from  where stuid='stu1' and agreed=1) A left join test B on A.classid = B.classid and A.stuid = B.id
select * from STUDENT b inner join class a on a.classid=b.classid where id='stu1'
/*수강생 중에서 수강 아이디 같은거 찾고 그거랑 맞는  */
/*insert*/
/*강의 아이디/강의 설명/시작날짜/강사아이디/강사이름/강의목표/강의정보
  /강의이름/구분(수강중,수강종료,모집중)/상태(1,2,0)/강의총일수
 /강의파일이름/우선순위*/
insert into class values('C01','클래스01','','teac1','김영조','웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의','웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의'
,'HTML5를 이용한 웹','모집중',0,180,null,1);
insert into class values('C02','클래스02','','teac2','최정웅','자바에 의한 자바를 위한 자바의 강의','자바를 쉽고 재미있게 배우고 실무까지 책임지겠습니다. 빠샤빠샤 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의'
,'JAVA 프로그래밍','모집중',0,200,null,2);
insert into class values('C03','클래스03','','teac3','최힘찬','프레임워크를 쉽고 재미있게 배우고 실무까지 책임지는 강의','프레임워크 뽀개기 모든 프레임워크를 배웁니다. 실무까지 책임지는 강의'
,'쉬운 Framework','모집중',0,180,null,3);
update class set startday='16-12-10' where classid='C01';
update class set startday='16-12-01' where classid='C02';
update class set startday='17-01-15' where classid='C03';
insert into class values('C04','클래스04','16-05-15','teac1','김영조','윈도우를 쉽고 재미있게 배우고 실무까지 책임지는 강의','운영체제 뽀개기 모든 프레임워크를 배웁니다. 실무까지 책임지는 강의'
,'OS의 Windows','수강종료',2,30,null,4);
insert into class values('C05','클래스05','16-07-01','teac2','최정웅','java를 쉽고 재미있게 배우고 실무까지 책임지는 강의','자바를 쉽고 재미있게 배우고 실무까지 책임지겠습니다. 빠샤빠샤 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의'
,'JAVA 프로그래밍','수강종료',2,60,null,5);
insert into class values('C06','클래스06','16-10-01','teac3','최힘찬','프레임워크를 쉽고 재미있게 배우고 실무까지 책임지는 강의','프레임워크 뽀개기 모든 프레임워크를 배웁니다. 실무까지 책임지는 강의'
,'Framework를 배우자!','수강중',1,90,null,6);
insert into class values('C07','클래스07','16-10-01','teac1','김영조','자바에 의한 자바를 위한 자바의 강의','자바를 쉽고 재미있게 배우고 실무까지 책임지겠습니다. 빠샤빠샤 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의'
,'JAVA 프로그래밍','수강중',1,180,null,7);
insert into class values('C08','클래스08','16-10-15','teac2','최정웅','웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의','웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의웹을 쉽고 재미있게 배우고 실무까지 책임지는 강의'
,'Spring 뽀개기','수강중',1,180,null,8);


/*아이디/비밀번호/구분(학생1,강사2,영업팀3,행정팀4)/이름/전화번호/주소/email*/
insert into userlist values('teac1','pw2',2,'김영조','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('teac2','pw2',2,'최정웅','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('teac3','pw2',2,'최힘찬','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu1','pw1',1,'박미선','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu2','pw1',1,'최힘찬','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu3','pw1',1,'최정웅','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu4','pw1',1,'임경영','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('sys1','pw3',3,'최유정','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('admin1','pw4',4,'송승호','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('comp1','pw5',5,'서월성','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('comp2','pw5',5,'황보현','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');


/*리스트아이디/회사아이디/제목/설명/싸이트/파일이름 */
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
'comp2',
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
'comp1',
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
'comp2',
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

select * from class where statu=1;
select * from class where statu=2;
/*수강생아이디/강의아이디/출석일수 */
insert into student values('stu1','C06',35);
insert into student values('stu2','C06',46);
insert into student values('stu3','C06',46);
insert into student values('stu4','C07',46);
insert into student values('stu1','C04',30);
insert into student values('stu2','C04',30);
insert into student values('stu3','C04',10);
insert into student values('stu4','C04',20);
insert into student values('stu1','C05',60);
insert into student values('stu2','C05',25);
insert into student values('stu3','C05',60);

insert into userlist values('stu1','pw1',1,'박미선','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu2','pw1',1,'최힘찬','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu3','pw1',1,'최정웅','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
insert into userlist values('stu4','pw1',1,'임경영','010-1234-1234','123#123#서울시#서울동','test@yopmail.com');
select * from class where statu=0
/*승인아이디/수강생아이디/수강생이름/강의아이디/승인여부(승인1 미승인0) */
insert into agreed values('Agr01','stu1','박미선','C01',0);
insert into agreed values('Agr02','stu1','박미선','C02',0);
insert into agreed values('Agr03','stu1','박미선','C03',0);
insert into agreed values('Agr06','stu4','임경영','C03',1);
insert into student values('stu4','C03',0);
insert into agreed values('Agr04','stu2','최힘찬','C01',1);
insert into student values('stu2','C01',0);
insert into agreed values('Agr05','stu3','최정웅','C01',0);
insert into agreed values('Agr07','stu4','임경영','C01',1);
insert into student values('stu4','C01',0);

/*프로젝트 아이디, 강의 아이디, 프로젝트 이름, 제출한 이름, 제출 내용, 오리지널 파일이름, re파일이름, 수강생아이디*/
insert into project values('P001','C06','1차자유주제','[강아지먹이주기알람]','강아지먹이주기알람을 java를 통해 만들었습니다.','Desktop.7z','Desktop.7z','stu1');
insert into project values('P002','C06','1차자유주제','채팅프로그램','소켓통신을 이용해 쌍방향 채팅 프로그램. 카카O톡을 모방하였습니다. 공부 위주','Desktop.7z','Desktop.7z','stu2');
insert into project values('P003','C06','1차자유주제','채팅프로그램','소켓통신을 이용해 쌍방향 채팅 프로그램. 카카O톡을 모방하였습니다. 공부 위주','Desktop.7z','Desktop.7z','stu3');
insert into project values('P004','C06','2차DB시험','DB시험','DB시험 너무 어렵습니다.',null,null,'stu1');
insert into project values('P005','C06','2차DB시험','DB시험재셤봐여','DB시험 너무 어렵습니다.',null,null,'stu2');
insert into project values('P006','C07','자유주제 구현하기','반응형 웹을 만들었습니다.','반응형 웹이 되는 한빛 LMS 시스템을 만들었습니다. 권한별로 잘 되네요','Desktop.7z','Desktop.7z','stu4');

insert into project values('P007','C04','[과제]자유주제 구현하기','[강아지먹이주기알람]','강아지먹이주기알람을 java를 통해 만들었습니다.','Desktop.7z','Desktop.7z','stu1');
insert into project values('P008','C04','[과제]자유주제 구현하기','채팅프로그램','소켓통신을 이용해 쌍방향 채팅 프로그램. 카카O톡을 모방하였습니다. 공부 위주','Desktop.7z','Desktop.7z','stu2');
insert into project values('P009','C04','[과제]자유주제 구현하기','채팅프로그램','소켓통신을 이용해 쌍방향 채팅 프로그램. 카카O톡을 모방하였습니다. 공부 위주','Desktop.7z','Desktop.7z','stu3');
insert into project values('P0010','C04','[과제]자유주제 구현하기','반응형 웹을 만들었습니다.','반응형 웹이 되는 한빛 LMS 시스템을 만들었습니다. 권한별로 잘 되네요','Desktop.7z','Desktop.7z','stu4');
insert into project values('P0011','C05','뭐든지 구현하기','반응형 웹을 만들었습니다.','반응형 웹이 되는 한빛 LMS 시스템을 만들었습니다. 권한별로 잘 되네요','Desktop.7z','Desktop.7z','stu1');
insert into project values('P0012','C05','뭐든지 구현하기','반응형 웹을 만들었습니다.','반응형 웹이 되는 한빛 LMS 시스템을 만들었습니다. 권한별로 잘 되네요','Desktop.7z','Desktop.7z','stu2');
insert into project values('P0013','C05','뭐든지 구현하기','반응형 웹을 만들었습니다.','반응형 웹이 되는 한빛 LMS 시스템을 만들었습니다. 권한별로 잘 되네요','Desktop.7z','Desktop.7z','stu3');

delete PROJECT where id='stu1'
select * from class where statu=2 
select * from prolist where classid='C04'
/*C08*/
/*프로젝트아이디, 수강생아이디, 강의아이디, 프로젝트 이름, 프로젝트 내용, 프로젝트 날짜, 강사명, 강사아이디*/
insert into prolist values('P001','stu1','C06','1차자유주제','1차프로젝트 진행합니다. 여기다 제출하세요','16-10-15','최힘찬','teac3');
insert into prolist values('P002','stu2','C06','1차자유주제','1차프로젝트 진행합니다. 여기다 제출하세요','16-10-15','최힘찬','teac3');
insert into prolist values('P003','stu3','C06','1차자유주제','1차프로젝트 진행합니다. 여기다 제출하세요','16-10-15','최힘찬','teac3');
insert into prolist values('P004','stu1','C06','2차DB시험','2차DB시험 진행합니다. 여기다 제출하세요. 성적도 확인하세요.','16-11-01','최힘찬','teac3');
insert into prolist values('P005','stu2','C06','2차DB시험','2차DB시험 진행합니다. 여기다 제출하세요. 성적도 확인하세요.','16-11-01','최힘찬','teac3');
insert into prolist values('P006','stu4','C07','자유주제 구현하기','자유롭게 구현 후 제출 하세요','16-11-01','김영조','teac1');
insert into prolist values('P007','stu1','C04','[과제]자유주제 구현하기','자유롭게 구현 후 제출 하세요','16-07-01','김영조','teac1');
insert into prolist values('P008','stu2','C04','[과제]자유주제 구현하기','자유롭게 구현 후 제출 하세요','16-07-01','김영조','teac1');
insert into prolist values('P009','stu3','C04','[과제]자유주제 구현하기','자유롭게 구현 후 제출 하세요','16-07-01','김영조','teac1');
insert into prolist values('P0010','stu4','C04','[과제]자유주제 구현하기','자유롭게 구현 후 제출 하세요','16-07-01','김영조','teac1');
insert into prolist values('P0011','stu1','C05','뭐든지 구현하기','자유롭게 구현 후 제출 하세요','16-08-01','최정웅','teac2');
insert into prolist values('P0012','stu2','C05','뭐든지 구현하기','자유롭게 구현 후 제출 하세요','16-08-01','최정웅','teac2');
insert into prolist values('P0013','stu3','C05','뭐든지 구현하기','자유롭게 구현 후 제출 하세요','16-08-01','최정웅','teac2');
select * from prolist

/*테스트아이디, 프로젝트 이름, 수강생 아이디, 강의 아이디, 성적,프로젝트아이디*/
insert into test values('T001','1차자유주제','stu1','C06',80,'P001');
insert into test values('T002','1차자유주제','stu2','C06',55,'P002');
insert into test values('T003','1차자유주제','stu3','C06',83,'P003');
insert into test values('T004','2차DB시험','stu1','C06',null,'P004');
insert into test values('T005','2차DB시험','stu2','C06',null,'P005');
insert into test values('T006','자유주제 구현하기','stu4','C07',92,'P006');
insert into test values('T007','[과제]자유주제 구현하기','stu1','C04',53,'P007');
insert into test values('T008','[과제]자유주제 구현하기','stu2','C04',88,'P008');
insert into test values('T009','[과제]자유주제 구현하기','stu3','C04',88,'P009');
insert into test values('T0010','[과제]자유주제 구현하기','stu4','C04',42,'P0010');
insert into test values('T0011','뭐든지 구현하기','stu1','C05',68,'P0011');
insert into test values('T0012','뭐든지 구현하기','stu2','C05',77,'P0012');
insert into test values('T0013','뭐든지 구현하기','stu3','C05',74,'P0013');




/*drop*/
drop table class;
drop table joblist;
drop table agreed;
drop table project;
drop table prolist;
drop table student;
drop table userlist;
drop table test;