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

select * from (select a.proid, a.classid, a.proname, a.subname, a.proexp, a.proorin, a.proren, a.id, b.testid, b.grade from PROJECT A, test B where a.PROID = b.proid) c inner join userlist d on c.id=d.id where c.proname='1����������'

select * from prolist where classid='C06'

select C.testid, C.proid, C.subname, C.proexp, C.proorin, D.name, C.id, C.grade from (select A.proid, A.subname, A.proexp, A.proorin, A.id, B.grade, B.testid from project A, test B where B.proid = A.proid) C inner join userlist D on C.id = D.id where C.proid='P002' and C.id='stu2'

select A.classid,A.cname,A.statu,A.stuid,A.agreed,B.grade from  where stuid='stu1' and agreed=1) A left join test B on A.classid = B.classid and A.stuid = B.id
select * from STUDENT b inner join class a on a.classid=b.classid where id='stu1'
/*������ �߿��� ���� ���̵� ������ ã�� �װŶ� �´�  */
/*insert*/
/*���� ���̵�/���� ����/���۳�¥/������̵�/�����̸�/���Ǹ�ǥ/��������
  /�����̸�/����(������,��������,������)/����(1,2,0)/�������ϼ�
 /���������̸�/�켱����*/
insert into class values('C01','Ŭ����01','','teac1','�迵��','���� ���� ����ְ� ���� �ǹ����� å������ ����','���� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ ����'
,'HTML5�� �̿��� ��','������',0,180,null,1);
insert into class values('C02','Ŭ����02','','teac2','������','�ڹٿ� ���� �ڹٸ� ���� �ڹ��� ����','�ڹٸ� ���� ����ְ� ���� �ǹ����� å�����ڽ��ϴ�. �������� �������� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ ����'
,'JAVA ���α׷���','������',0,200,null,2);
insert into class values('C03','Ŭ����03','','teac3','������','�����ӿ�ũ�� ���� ����ְ� ���� �ǹ����� å������ ����','�����ӿ�ũ �ǰ��� ��� �����ӿ�ũ�� ���ϴ�. �ǹ����� å������ ����'
,'���� Framework','������',0,180,null,3);
update class set startday='16-12-10' where classid='C01';
update class set startday='16-12-01' where classid='C02';
update class set startday='17-01-15' where classid='C03';
insert into class values('C04','Ŭ����04','16-05-15','teac1','�迵��','�����츦 ���� ����ְ� ���� �ǹ����� å������ ����','�ü�� �ǰ��� ��� �����ӿ�ũ�� ���ϴ�. �ǹ����� å������ ����'
,'OS�� Windows','��������',2,30,null,4);
insert into class values('C05','Ŭ����05','16-07-01','teac2','������','java�� ���� ����ְ� ���� �ǹ����� å������ ����','�ڹٸ� ���� ����ְ� ���� �ǹ����� å�����ڽ��ϴ�. �������� �������� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ ����'
,'JAVA ���α׷���','��������',2,60,null,5);
insert into class values('C06','Ŭ����06','16-10-01','teac3','������','�����ӿ�ũ�� ���� ����ְ� ���� �ǹ����� å������ ����','�����ӿ�ũ �ǰ��� ��� �����ӿ�ũ�� ���ϴ�. �ǹ����� å������ ����'
,'Framework�� �����!','������',1,90,null,6);
insert into class values('C07','Ŭ����07','16-10-01','teac1','�迵��','�ڹٿ� ���� �ڹٸ� ���� �ڹ��� ����','�ڹٸ� ���� ����ְ� ���� �ǹ����� å�����ڽ��ϴ�. �������� �������� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ ����'
,'JAVA ���α׷���','������',1,180,null,7);
insert into class values('C08','Ŭ����08','16-10-15','teac2','������','���� ���� ����ְ� ���� �ǹ����� å������ ����','���� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ �������� ���� ����ְ� ���� �ǹ����� å������ ����'
,'Spring �ǰ���','������',1,180,null,8);


/*���̵�/��й�ȣ/����(�л�1,����2,������3,������4)/�̸�/��ȭ��ȣ/�ּ�/email*/
insert into userlist values('teac1','pw2',2,'�迵��','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('teac2','pw2',2,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('teac3','pw2',2,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu1','pw1',1,'�ڹ̼�','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu2','pw1',1,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu3','pw1',1,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu4','pw1',1,'�Ӱ濵','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('sys1','pw3',3,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('admin1','pw4',4,'�۽�ȣ','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('comp1','pw5',5,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('comp2','pw5',5,'Ȳ����','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');


/*����Ʈ���̵�/ȸ����̵�/����/����/����Ʈ/�����̸� */
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
'comp2',
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
'comp1',
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
'comp2',
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

select * from class where statu=1;
select * from class where statu=2;
/*���������̵�/���Ǿ��̵�/�⼮�ϼ� */
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

insert into userlist values('stu1','pw1',1,'�ڹ̼�','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu2','pw1',1,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu3','pw1',1,'������','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
insert into userlist values('stu4','pw1',1,'�Ӱ濵','010-1234-1234','123#123#�����#���ﵿ','test@yopmail.com');
select * from class where statu=0
/*���ξ��̵�/���������̵�/�������̸�/���Ǿ��̵�/���ο���(����1 �̽���0) */
insert into agreed values('Agr01','stu1','�ڹ̼�','C01',0);
insert into agreed values('Agr02','stu1','�ڹ̼�','C02',0);
insert into agreed values('Agr03','stu1','�ڹ̼�','C03',0);
insert into agreed values('Agr06','stu4','�Ӱ濵','C03',1);
insert into student values('stu4','C03',0);
insert into agreed values('Agr04','stu2','������','C01',1);
insert into student values('stu2','C01',0);
insert into agreed values('Agr05','stu3','������','C01',0);
insert into agreed values('Agr07','stu4','�Ӱ濵','C01',1);
insert into student values('stu4','C01',0);

/*������Ʈ ���̵�, ���� ���̵�, ������Ʈ �̸�, ������ �̸�, ���� ����, �������� �����̸�, re�����̸�, ���������̵�*/
insert into project values('P001','C06','1����������','[�����������ֱ�˶�]','�����������ֱ�˶��� java�� ���� ��������ϴ�.','Desktop.7z','Desktop.7z','stu1');
insert into project values('P002','C06','1����������','ä�����α׷�','��������� �̿��� �ֹ��� ä�� ���α׷�. īīO���� ����Ͽ����ϴ�. ���� ����','Desktop.7z','Desktop.7z','stu2');
insert into project values('P003','C06','1����������','ä�����α׷�','��������� �̿��� �ֹ��� ä�� ���α׷�. īīO���� ����Ͽ����ϴ�. ���� ����','Desktop.7z','Desktop.7z','stu3');
insert into project values('P004','C06','2��DB����','DB����','DB���� �ʹ� ��ƽ��ϴ�.',null,null,'stu1');
insert into project values('P005','C06','2��DB����','DB������ɺ���','DB���� �ʹ� ��ƽ��ϴ�.',null,null,'stu2');
insert into project values('P006','C07','�������� �����ϱ�','������ ���� ��������ϴ�.','������ ���� �Ǵ� �Ѻ� LMS �ý����� ��������ϴ�. ���Ѻ��� �� �ǳ׿�','Desktop.7z','Desktop.7z','stu4');

insert into project values('P007','C04','[����]�������� �����ϱ�','[�����������ֱ�˶�]','�����������ֱ�˶��� java�� ���� ��������ϴ�.','Desktop.7z','Desktop.7z','stu1');
insert into project values('P008','C04','[����]�������� �����ϱ�','ä�����α׷�','��������� �̿��� �ֹ��� ä�� ���α׷�. īīO���� ����Ͽ����ϴ�. ���� ����','Desktop.7z','Desktop.7z','stu2');
insert into project values('P009','C04','[����]�������� �����ϱ�','ä�����α׷�','��������� �̿��� �ֹ��� ä�� ���α׷�. īīO���� ����Ͽ����ϴ�. ���� ����','Desktop.7z','Desktop.7z','stu3');
insert into project values('P0010','C04','[����]�������� �����ϱ�','������ ���� ��������ϴ�.','������ ���� �Ǵ� �Ѻ� LMS �ý����� ��������ϴ�. ���Ѻ��� �� �ǳ׿�','Desktop.7z','Desktop.7z','stu4');
insert into project values('P0011','C05','������ �����ϱ�','������ ���� ��������ϴ�.','������ ���� �Ǵ� �Ѻ� LMS �ý����� ��������ϴ�. ���Ѻ��� �� �ǳ׿�','Desktop.7z','Desktop.7z','stu1');
insert into project values('P0012','C05','������ �����ϱ�','������ ���� ��������ϴ�.','������ ���� �Ǵ� �Ѻ� LMS �ý����� ��������ϴ�. ���Ѻ��� �� �ǳ׿�','Desktop.7z','Desktop.7z','stu2');
insert into project values('P0013','C05','������ �����ϱ�','������ ���� ��������ϴ�.','������ ���� �Ǵ� �Ѻ� LMS �ý����� ��������ϴ�. ���Ѻ��� �� �ǳ׿�','Desktop.7z','Desktop.7z','stu3');

delete PROJECT where id='stu1'
select * from class where statu=2 
select * from prolist where classid='C04'
/*C08*/
/*������Ʈ���̵�, ���������̵�, ���Ǿ��̵�, ������Ʈ �̸�, ������Ʈ ����, ������Ʈ ��¥, �����, ������̵�*/
insert into prolist values('P001','stu1','C06','1����������','1��������Ʈ �����մϴ�. ����� �����ϼ���','16-10-15','������','teac3');
insert into prolist values('P002','stu2','C06','1����������','1��������Ʈ �����մϴ�. ����� �����ϼ���','16-10-15','������','teac3');
insert into prolist values('P003','stu3','C06','1����������','1��������Ʈ �����մϴ�. ����� �����ϼ���','16-10-15','������','teac3');
insert into prolist values('P004','stu1','C06','2��DB����','2��DB���� �����մϴ�. ����� �����ϼ���. ������ Ȯ���ϼ���.','16-11-01','������','teac3');
insert into prolist values('P005','stu2','C06','2��DB����','2��DB���� �����մϴ�. ����� �����ϼ���. ������ Ȯ���ϼ���.','16-11-01','������','teac3');
insert into prolist values('P006','stu4','C07','�������� �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-11-01','�迵��','teac1');
insert into prolist values('P007','stu1','C04','[����]�������� �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-07-01','�迵��','teac1');
insert into prolist values('P008','stu2','C04','[����]�������� �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-07-01','�迵��','teac1');
insert into prolist values('P009','stu3','C04','[����]�������� �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-07-01','�迵��','teac1');
insert into prolist values('P0010','stu4','C04','[����]�������� �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-07-01','�迵��','teac1');
insert into prolist values('P0011','stu1','C05','������ �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-08-01','������','teac2');
insert into prolist values('P0012','stu2','C05','������ �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-08-01','������','teac2');
insert into prolist values('P0013','stu3','C05','������ �����ϱ�','�����Ӱ� ���� �� ���� �ϼ���','16-08-01','������','teac2');
select * from prolist

/*�׽�Ʈ���̵�, ������Ʈ �̸�, ������ ���̵�, ���� ���̵�, ����,������Ʈ���̵�*/
insert into test values('T001','1����������','stu1','C06',80,'P001');
insert into test values('T002','1����������','stu2','C06',55,'P002');
insert into test values('T003','1����������','stu3','C06',83,'P003');
insert into test values('T004','2��DB����','stu1','C06',null,'P004');
insert into test values('T005','2��DB����','stu2','C06',null,'P005');
insert into test values('T006','�������� �����ϱ�','stu4','C07',92,'P006');
insert into test values('T007','[����]�������� �����ϱ�','stu1','C04',53,'P007');
insert into test values('T008','[����]�������� �����ϱ�','stu2','C04',88,'P008');
insert into test values('T009','[����]�������� �����ϱ�','stu3','C04',88,'P009');
insert into test values('T0010','[����]�������� �����ϱ�','stu4','C04',42,'P0010');
insert into test values('T0011','������ �����ϱ�','stu1','C05',68,'P0011');
insert into test values('T0012','������ �����ϱ�','stu2','C05',77,'P0012');
insert into test values('T0013','������ �����ϱ�','stu3','C05',74,'P0013');




/*drop*/
drop table class;
drop table joblist;
drop table agreed;
drop table project;
drop table prolist;
drop table student;
drop table userlist;
drop table test;