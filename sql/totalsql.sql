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

insert into prolist values ('P000','user1','C000','�ӽ�����1','�ӽó���1',sysdate,'�Pȣȫ1','kangsa1');
insert into prolist values ('P001','user1','C001','�ӽ�����2','�ӽó���2',sysdate,'�Pȣȫ2','kangsa2');
insert into prolist values ('P002','user1','C002','�ӽ�����3','�ӽó���3',sysdate,'�Pȣȫ3','kangsa3');
insert into prolist values ('P003','user1','C003','�ӽ�����4','�ӽó���4',sysdate,'�Pȣȫ4','kangsa4');
insert into prolist values ('P004','user1','C000','�ӽ�����5','�ӽó���5',sysdate,'�Pȣȫ5','kangsa5');

insert into test values ('T000','�ӽý���','user1','C000',70);
insert into test values ('T001','�ӽý���','user1','C001',80);
insert into test values ('T002','�ӽý���','user1','C002',90);
insert into test values ('T003','�ӽý���','user1','C003',90);
insert into PROJECT values ('P000','C000','�ӽð���1','�ۼ�����1','��������1','Desktop.7z','Desktop.7z','user1');
insert into PROJECT values ('P001','C001','�ӽð���2','�ۼ�����2','��������2','Desktop.7z','Desktop.7z','user1');
insert into PROJECT values ('P002','C002','�ӽð���3','�ۼ�����3','��������3','Desktop.7z','Desktop.7z','user1');
insert into class values('C000','6����',sysdate,'������01','������','�Ϳ� ��� ����','�ڹ�,������,�����ӿ�ũ','�ڹ�','��������',7,180,'����',1);
 insert into class values('C001','6����',sysdate,'������01','������','�Ϳ� ��� ����','�ڹ�,������,�����ӿ�ũ','�� ����','��������',7,180,'����',2);
 insert into class values('C003','6����',sysdate,'������01','������','�Ϳ� ��� ����','�ڹ�,������,�����ӿ�ũ','�����ӿ�ũ','��������',7,180,'����',3);
 insert into class values('C003','6����',sysdate,'������01','������','�Ϳ� ��� ����','�ڹ�,������,�����ӿ�ũ','�ӽ�','��������',7,180,'����',3);


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
/*stuid ���� �ʿ�*/
);


create table test(
testid varchar2(20),
proname varchar2(50),
id varchar2(20),
classid varchar2(20),
grade number(3)
);

-> Class ���̺� 

 insert into class values('class00','6����',sysdate,'teac1','������','�ڹٸ� �����','�ڹ�,������,�����ӿ�ũ�� �����մϴ�','�ڹ�','������',0,180,'����',1);
 insert into class values('class01','6����',sysdate,'teac1','������','�������� ����','�ڹ�,������,�����ӿ�ũ�� �����մϴ�','�� ����','������',0,180,'����',2);
 insert into class values('class02','6����',sysdate,'teac1','������','�����ӿ�ũ�μ���','�ڹ�,������,�����ӿ�ũ�� �����մϴ�','�����ӿ�ũ','������',0,180,'����',3);
 insert into class values('class03','2����','16-10-01','teac1','������','�����ӿ�ũ�μ���','�ڹ�,������,�����ӿ�ũ�� �����մϴ�','�ȵ���̵�','��������',2,60,'����',5);
 insert into class values('class04','6����','16-11-15','teac1','������','�����ӿ�ũ�μ���','�ڹ�,������,�����ӿ�ũ�� �����մϴ�','�������','������',1,180,'����',4);
 
/*������ : 0 ������ : 1 ���� ���� : 2  */
-> Userlist ���̺�  

insert into userlist values('user0','pw0',1,'�ڹ̼�','0101234','����','0000@naver.com');
insert into userlist values('user1','pw0',1,'������','0101234','����','0000@naver.com');
insert into userlist values('user2','pw0',1,'�Ӱ濵','0101234','����','0000@naver.com');
insert into userlist values('user3','pw0',1,'������','01012348888','����','0000@naver.com');
�л�
insert into userlist values('teac1','pw1',2,'������','0101234','����','0000@naver.com');
����
insert into userlist values('sys1','pw2',3,'������1','0101234','����','0000@naver.com');
����
insert into userlist values('admin1','pw3',4,'������1','0101234','����','0000@naver.com');
����
/*�л�:1 ����:2 ������ :3 ������:4 �� ���Ѻ� ����� ������ �ֱ�*/

-> joblist ���̺�

insert into joblist values('jList_comp1', 
'comp1',
'�ۡ۳ʽ� �� ������ ����',
'�ȳ��ϼ���! �Ѻ��������� ��������� �̰��� �븮�Դϴ�.<br/>
ä����� Ȯ�� �� ȸ�翡 ���ؼ�(*��������,�����,�������, �ٹ�������,�޿�����,�ٹ��ð�,�������)
�����ϰ� �˾ƺ��ð� �Ի������� ����Ͻô� �л����� ������ �ֽñ� �ٶ��ϴ�.<br/>
������� �̸����� ����, �Ի縦 ����Ͻô� �л����� �̷¼��� �ڱ�Ұ����� ���� �����Դϴ�.<br/>
�ۼ� ��) �̸� / ���� ������ / ���� ������ / Ȩ�������� �ش�ä������ �۹�ȣ ������<br/>
* ÷������ (�̷¼�,�ڱ�Ұ���,������Ʈ�� ��±����)<br/>
- ����������� -<br/>
1. �̷¼� �ۼ�&����<br/>
2. �̷¼� Ŭ����(�̷¼� �ۼ� ��� ���� �� ����)<br/>
3. �������(1:1 ������)<br/>
4. ����Ŭ����(���� ��� ���� �� ���� ����)<br/>
5. ���ó ����& ��õ<br/>
6. ���',
'www.hanbitedu.co.kr',
'�̷¼�.docx'
);
insert into joblist values('jList_comp2', 
'comp2',
'�� ������ ���մϴ�!',
'�ȳ��ϼ���! �Ѻ��������� ��������� �̰��� �븮�Դϴ�.<br/>
ä����� Ȯ�� �� ȸ�翡 ���ؼ�(*��������,�����,�������, �ٹ�������,�޿�����,�ٹ��ð�,�������)
�����ϰ� �˾ƺ��ð� �Ի������� ����Ͻô� �л����� ������ �ֽñ� �ٶ��ϴ�.<br/>
������� �̸����� ����, �Ի縦 ����Ͻô� �л����� �̷¼��� �ڱ�Ұ����� ���� �����Դϴ�.<br/>
�ۼ� ��) �̸� / ���� ������ / ���� ������ / Ȩ�������� �ش�ä������ �۹�ȣ ������<br/>
* ÷������ (�̷¼�,�ڱ�Ұ���,������Ʈ�� ��±����)<br/>
- ����������� -<br/>
1. �̷¼� �ۼ�&����<br/>
2. �̷¼� Ŭ����(�̷¼� �ۼ� ��� ���� �� ����)<br/>
3. �������(1:1 ������)<br/>
4. ����Ŭ����(���� ��� ���� �� ���� ����)<br/>
5. ���ó ����& ��õ<br/>
6. ���',
'www.hanbitedu.co.kr',
'�̷¼�2.docx'
);
insert into joblist values('jList_comp3', 
'comp3',
'[���α���]���縦 ä���մϴ�.',
'�ȳ��ϼ���! �Ѻ��������� ��������� �̰��� �븮�Դϴ�.<br/>
ä����� Ȯ�� �� ȸ�翡 ���ؼ�(*��������,�����,�������, �ٹ�������,�޿�����,�ٹ��ð�,�������)
�����ϰ� �˾ƺ��ð� �Ի������� ����Ͻô� �л����� ������ �ֽñ� �ٶ��ϴ�.<br/>
������� �̸����� ����, �Ի縦 ����Ͻô� �л����� �̷¼��� �ڱ�Ұ����� ���� �����Դϴ�.<br/>
�ۼ� ��) �̸� / ���� ������ / ���� ������ / Ȩ�������� �ش�ä������ �۹�ȣ ������<br/>
* ÷������ (�̷¼�,�ڱ�Ұ���,������Ʈ�� ��±����)<br/>
- ����������� -<br/>
1. �̷¼� �ۼ�&����<br/>
2. �̷¼� Ŭ����(�̷¼� �ۼ� ��� ���� �� ����)<br/>
3. �������(1:1 ������)<br/>
4. ����Ŭ����(���� ��� ���� �� ���� ����)<br/>
5. ���ó ����& ��õ<br/>
6. ���',
'www.hanbitedu.co.kr',
'test.txt'
);
insert into joblist values('jList_comp4', 
'comp4',
'��) NHSystems(��)����) ����ä��',
'�ȳ��ϼ���! �Ѻ��������� ��������� �̰��� �븮�Դϴ�.<br/>
ä����� Ȯ�� �� ȸ�翡 ���ؼ�(*��������,�����,�������, �ٹ�������,�޿�����,�ٹ��ð�,�������)
�����ϰ� �˾ƺ��ð� �Ի������� ����Ͻô� �л����� ������ �ֽñ� �ٶ��ϴ�.<br/>
������� �̸����� ����, �Ի縦 ����Ͻô� �л����� �̷¼��� �ڱ�Ұ����� ���� �����Դϴ�.<br/>
�ۼ� ��) �̸� / ���� ������ / ���� ������ / Ȩ�������� �ش�ä������ �۹�ȣ ������<br/>
* ÷������ (�̷¼�,�ڱ�Ұ���,������Ʈ�� ��±����)<br/>
- ����������� -<br/>
1. �̷¼� �ۼ�&����<br/>
2. �̷¼� Ŭ����(�̷¼� �ۼ� ��� ���� �� ����)<br/>
3. �������(1:1 ������)<br/>
4. ����Ŭ����(���� ��� ���� �� ���� ����)<br/>
5. ���ó ����& ��õ<br/>
6. ���',
'www.hanbitedu.co.kr',
'�̷¼�2.docx'
);
insert into joblist values('jList_comp5', 
'comp5',
'�ȳ��ϼ���. ���� ����մϴ�',
'�ȳ��ϼ���! �Ѻ��������� ��������� �̰��� �븮�Դϴ�.<br/>
ä����� Ȯ�� �� ȸ�翡 ���ؼ�(*��������,�����,�������, �ٹ�������,�޿�����,�ٹ��ð�,�������)
�����ϰ� �˾ƺ��ð� �Ի������� ����Ͻô� �л����� ������ �ֽñ� �ٶ��ϴ�.<br/>
������� �̸����� ����, �Ի縦 ����Ͻô� �л����� �̷¼��� �ڱ�Ұ����� ���� �����Դϴ�.<br/>
�ۼ� ��) �̸� / ���� ������ / ���� ������ / Ȩ�������� �ش�ä������ �۹�ȣ ������<br/>
* ÷������ (�̷¼�,�ڱ�Ұ���,������Ʈ�� ��±����)<br/>
- ����������� -<br/>
1. �̷¼� �ۼ�&����<br/>
2. �̷¼� Ŭ����(�̷¼� �ۼ� ��� ���� �� ����)<br/>
3. �������(1:1 ������)<br/>
4. ����Ŭ����(���� ��� ���� �� ���� ����)<br/>
5. ���ó ����& ��õ<br/>
6. ���',
'www.hanbitedu.co.kr',
'�̷¼�.docx'
);


-> student ���̺�

insert into student values ('user0','class00', 0);
insert into student values ('user1','class00', 0);
insert into student values ('user2','class00', 100);


-> agreed ���̺�

  insert into agreed values('listID1','user0','�ڹ̼�','class00',1);
  insert into agreed values('listID2','user1','������','class00',0);
  insert into agreed values('listID3','user2','�Ӱ濵','class01',0);
  /*insert into agreed values ('1','class00',(select id,',',name from uno where id='jaorp'),0);*/
 
  -/
-> project ���̺�


insert into project values ('pro01','class00','2������ LMS ������','LMS������Ʈ Ŭ�������̾�׷��Դϴ�','Ŭ�������̾�׷� �����մϴ�. Ȯ���� �ּ���!!!!','classdiagram.xml','classdiagram.xml','user0');
insert into project values ('pro01','class00','2������ LMS ������','[��������]Ŭ�������̾�׷�!','Ŭ�������̾�׷� �����մϴ�. Ȯ���� �ּ���!!!!','classdiagram.xml','classdiagram.xml','user1');
insert into project values ('pro02','class01','1�� JAVA ���α׷���','3�� ������ ���̾�׷� �����մϴ�.','�������� ���ϴٿ�. Ŭ�������̾�׷� �����ߴٿ�. Ȯ���� �ּ���!!!!','classdiagram.xml','classdiagram.xml','user2');

-> prolist ���̺�


insert into prolist values ('pro01','class00','2������ LMS ������','���볻�볻�볻�볻�볻�볻��','16-10-21','������','teac1');
insert into prolist values ('pro02','class00','1������ ��������','���볻�볻�볻�볻�볻�볻��','16-09-01','������','teac1');
delete from prolist where classid='class00'
insert into prolist values ('pro01','class00','2������ LMS ������','���볻�볻�볻�볻�볻�볻��','16-10-21','������','teac1');
insert into prolist values ('pro02','class01','1�� JAVA ���α׷���','���볻�볻�볻�볻�볻�볻�볻�볻�볻��','16-12-31','������','teac1');
insert into prolist values ('pro03','class02','�������LMS�ý��� ���α׷���','���볻�볻�볻�볻�볻�볻�볻�볻��','16-12-31','������','teac1');

select * from prolist

-> test ���̺�

insert into test values ('test1','pro01','user0','class00','80');
insert into test values ('test2','pro01','user1','class00',null);

-/

 select*from class;
 select*from userlist;
 select*from agreed;
 select * from project
 select*from test;
 
 /*/- ������
 select proname, proday from prolist where classid='A1'
 select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id;
 select C.subname, D.name, C.grade from (select * from project A, test B where B.id = A.id) C, userlist D
 select C.subname, D.name, C.grade from (select A.id as id, B.grade as grade, A.subname as subname from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id;
 select name, phone from (select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id) where classid='A1' order by name
 select name, phone from (select * from userlist A, student B where A.id = B.id) where classid='classid' order by name
 select classid,cname,division from class where cname like '%%' and division='������'
 select cname,division from class
 select B.proid, B.subname, B.proexp, B.proorin, B.id, C.name  from (select proid,subname,proexp,proorin,id from project A) B inner join userlist C on B.id = C.id where B.proid='pro2' and B.id='user22'

select name, phone from (select A.id, A.pw, A.lv, A.name, A.phone, A.address, A.mail, B.classid, B.attday from userlist A, student B where A.id = B.id) where classid=(select B.classid from student A,class B where  A.classid=B.classid) order by name

select classid,cname,division from class where cname like '%%' and division='��������'

select C.proid, C.subname, C.proexp, C.proorin, D.name, C.grade, C.id from (select A.proid as proid, A.subname as subname, A.proexp as proexp, A.proorin as proorin, A.id as id, B.grade as grade from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid='pro2' and C.id='user22'
select C.proid, C.subname, C.proexp, C.proorin, D.name, C.grade, C.id from (select A.proid as proid, A.subname as subname, A.proexp as proexp, A.proorin as proorin, A.id as id, B.grade as grade from project A, test B where B.id = A.id) C inner join userlist D on C.id = D.id where C.proid='pro1' and C.id='user1'
-/ 

/-������
select count(*) as cnt from suup where lectid='Lect1'
select * from suup inner join person on suup.stuid = person.id where suup.lectid = 'Lect1';
select * from suup inner join person on suup.stuid = person.id where suup.lectid = 'Lect4' order by attnday
select * from (select * from suup inner join person on suup.stuid = person.id where suup.lectid ='Lect4') where attnday <= 90
select * from (select * from suup inner join person on suup.stuid = person.id where suup.lectid ='Lect1') where name like '%��%'
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