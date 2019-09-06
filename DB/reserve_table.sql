
drop table reserve;
select * from reserve;

insert into reserve (idx, sidx, tidx) values ('dahee' ,12, 20);

create table reserve (
ridx int(20) auto_increment,
idx int(20) not null,
sidx int(20) not null,
tidx int(20) not null,
rDate datetime default current_timestamp,
primary key(ridx),
unique key r_primary_(ridx)
)default char set=utf8;

create table movieticket (
tidx int(20) auto_increment,
midx int(20) not null,
cidx int(20) NOT NULL,
tDate int(10) not null,
tTime time not null,
mRunTime int not null,
cSeatCnt int(100) not null,
primary key(tidx),
unique key t_auto_(tidx)
)default char set=utf8;

select idx, sidx, date_format(tDate, '%Y-%m-%d') 'tDate', midx, cidx, cDate, cTime, DATE_ADD(cTime, INTERVAL 120 MINUTE) 'totalTime'
from reserve r join movieticket m
using(tidx) where idx=1;

select * from movieticket;

drop table movieticket;

rollback;

select DISTINCT date_format(cDate,'%d') 'cDate' 
from movieticket where cidx=4 
order by cDate;

select distinct cidx
from movieticket where cDate='19-10-'
order by cDate;

select midx, time_format(ctime,'%H : %i') 'cTime', time_format(cTime+runningTime,'%H : %i') 'totalTime' 
from movieticket where cidx=3 and  cDate=27
order by cTime;

select DISTINCT cDate
from movieticket where cidx=3
order by cDate;

select * from movieticket;

select seatCnt from movieticket where cidx=1;

select distinct cdate from movieticket order by cdate;

select DISTINCT date_format(cDate,'%d') 'cDate' from movieticket order by cDate;

select midx, time_format(cTime+runningTime,'%H : %i') 'totalTime' from movieticket;

select DISTINCT seatCnt from movieticket where cidx=1;

select DISTINCT cidx  from movieticket order by cidx;
select * from movieticket;

-- totalTime
SELECT DATE_ADD(cTime, INTERVAL 120 MINUTE) 'totalTiem' from movieticket;


delete from movieticket where tidx=17;

select tidx from movieticket where cidx=3 and cDate=27 and cTime ='10:10';



select * from movieticket where midx = 2;



-- ------------------------------------------------------

alter database project default character set utf8;

CREATE TABLE movie(
   midx   int(20) auto_increment, 
   mName varchar(50) Not null,
   mCont  VARCHAR(1000) NOT NULL, 
   mPer varchar(100) NOT NULL,
   mDate date Not Null,
   mPhoto VARCHAR(150)  NULL,
   primary key(midx),
   unique key unique_midx(midx)
);

insert into movie (mName, mCont, mPer, mDate, mPhoto) values ('home', 'home', 'home', '2019/08/28', 'home.jpg');


select * from movie;

select mRunTime from movie where midx=1;

-- ------------------------------------------------------
drop table cinema;
drop table movie;
drop table movieticket;
drop table reserve;


CREATE TABLE movie(
   midx   int(20) auto_increment, 
   mName varchar(50) NOT NULL,
   mCont  VARCHAR(1000) NOT NULL, 
   mPer varchar(100) NOT NULL,
   mDate date NOT NULL,
   mPhoto VARCHAR(150) NOT NULL,
   mRunTime int(20) NOT NULL,
   primary key(midx),
   unique key unique_midx(midx)
);

insert into movie (mName, mCont, mPer, mDate, mPhoto, mRunTime) values ('애프터22', '재밌다22', '누구더라22', '2019/08/28', 'zz2221.jpg', 110);

CREATE TABLE cinema (
   cidx   int auto_increment, -- 극장코드
   cName  VARCHAR(50) , -- 극장명
   cRot   VARCHAR(255)  NOT NULL, -- 극장위치
   cCont  VARCHAR(1000) NOT NULL, -- 극장소개
   cPhoto VARCHAR(150),  -- 극장사진
   cSeatCnt int(20) NOT NULL, -- 좌석개수
   primary key(cidx),
   unique key unique_cidx(cidx)
);

insert into cinema (cName, cRot, cCont, cPhoto, cSeatCnt) values ('부산', '부산...어디', '좋음', 't2222.jpg', 10);

create table movieticket (
tidx int(20) auto_increment,
midx int(20) NOT NULL,
cidx int(20) NOT NULL,
tDate int(10) NOT NULL,
tTime time NOT NULL,
mRunTime int(20) NOT NULL,
cSeatCnt int(20) NOT NULL,
primary key(tidx),
unique key t_auto_(tidx)
);

select * from movieticket;

select tidx from movieticket where cidx=3 and tDate=30 and tTime ='14:15';
 
select midx, time_format(tTime,'%H:%i') 'tTime', time_format(DATE_ADD(tTime, INTERVAL mRunTime MINUTE), '%H:%i') 'totalTime'
from movieticket where cidx=3 and tDate=30
order by tTime;


select DISTINCT tDate
from movieticket where cidx=3
order by tDate;

insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (1, 3, 27, '09:10', 120, 35);
insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (2, 3, 29, '11:30', 100, 35);
insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (3, 3, 30, '14:15', 160, 35);
insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (1, 3, 30, '18:10', 153, 35);
insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (2, 3, 28, '20:20', 150, 35);
insert movieticket (midx, cidx, tDate, tTime, mRunTime, cSeatCnt) values (4, 3, 29, '11:20', 120, 35);


create table reserve (
ridx int(20) auto_increment,
idx int(20) NOT NULL,
sidx int(20) NOT NULL,
tidx int(20) NOT NULL,
rDate datetime default current_timestamp,
primary key(ridx),
unique key r_primary_(ridx)
);

alter table reserve change tDate rDate datetime default current_timestamp;

select * from reserve;
select * from movieticket;

select distinct cSeatCnt from movieticket where cidx=1;
select distinct cSeatCnt from movieticket where tidx=1;

select distinct cSeatCnt from reserve join movieticket
using(tidx)
where tidx=1;

select r.ridx, r.idx, r.sidx, r.rDate, m.midx, m.cidx,m.tDate,time_format(tTime,'%H:%i') 'tTime',time_format(DATE_ADD(tTime, INTERVAL mRunTime MINUTE), '%H:%i') 'totalTime'
from reserve r join movieticket m
using(tidx)
where idx=1
;

select * from reserve;
insert into reserve (idx,sidx,tidx) values(1, 25, 1);

-- 이게 cSeatCnt 랑 숫자같으면 매진
select count(*) from reserve join movieticket
using(tidx)
where tidx=1;

select sidx from reserve join movieticket
using(tidx)
where tidx=1;


select DISTINCT cidx  from movieticket order by cidx;

select distinct cidx, cName from cinema c join movieticket m
using(cidx)
order by cidx
;

select * from movie;
select midx,mName,mRunTime from movie;
select cidx,cName,cSeatCnt from cinema;
select * from movieticket;

select cSeatCnt from cinema where cidx=1;

select midx, time_format(tTime,'%H:%i') 'tTime', time_format(DATE_ADD(tTime, INTERVAL mRunTime MINUTE), '%H:%i') 'totalTime'
from movieticket
where cidx=1 and tDate=30
order by tTime;

select m.midx, m.mName, time_format(mt.tTime,'%H:%i') 'tTime', time_format(DATE_ADD(mt.tTime, INTERVAL m.mRunTime MINUTE), '%H:%i') 'totalTime'
from movieticket mt join movie m
using(midx)
where cidx=1 and tDate=30
order by tTime;

delete from movie where midx=3;

select midx, mName, time_format(tTime,'%H:%i') 'tTime', time_format(DATE_ADD(tTime, INTERVAL m.mRunTime MINUTE), '%H:%i') 'totalTime'
from movie m join movieticket mt
using(midx)
where cidx=1 and tDate=29;


select r.ridx, r.idx, r.sidx, r.rDate, m.midx, m.cidx,m.tDate,time_format(tTime,'%H:%i') 'tTime',time_format(DATE_ADD(tTime, INTERVAL mRunTime MINUTE), '%H:%i') 'totalTime'
from reserve r join movieticket m
using(tidx)
where idx=22;

select * from reserve;


delete from reserve where ridx=52;
select * from movie;

insert into cinema (cName,cRot,cCont,cPhoto, cSeatCnt) values('MOVIES 강남점','서울특별시 강남구','쾌적함 문의:1544-1122','GangNam.png',20);
insert into cinema (cName,cRot,cCont,cPhoto, cSeatCnt) values('MOVIES 목동점','서울특별시 목동','주자창넓음 문의 : 1544-1122','Mokdong.png',30);
insert into cinema (cName,cRot,cCont,cPhoto, cSeatCnt) values('MOVIES 구로점','서울특별시 구로구','넓음 문의 : 1544-1122','Guro.png',40);

select * from cinema;


select * from movieticket;
delete from movieticket where tidx>0;

INSERT INTO movie (midx, mName,mCont, mPer, mDate, mRunTime,mPhoto) VALUES (20181416,'유열의 음악앨범','\"오늘 기적이 일어났어요.\"  1994년 가수 유열이 라디오 DJ를 처음 진행하던 날,  엄마가 남겨준 빵집에서 일하던 미수(김고은)는 우연히 찾아 온 현우(정해인)를 만나   설레는 감정을 느끼게 되지만 뜻하지 않은 사건으로 인해 연락이 끊기게 된다.    \"그때, 나는 네가 돌아오지 않을 거라고 생각했어. 그래도 기다렸는데…\"  다시 기적처럼 마주친 두 사람은 설렘과 애틋함 사이에서 마음을 키워 가지만 서로의 상황과 시간은 자꾸 어긋나기만 한다.  계속되는 엇갈림 속에서도 라디오 ‘유열의 음악앨범’과 함께 우연과 필연을 반복하는 두 사람…     함께 듣던 라디오처럼 그들은 서로의 주파수를 맞출 수 있을까?','정지우,김고은,정해인','2019-08-28',122,'20181416_음악앨범.png'),(20184462,'봉오동 전투','임무는 단 하나! 달리고 달려, 일본군을 죽음의 골짜기로 유인하라! 1919년 3.1운동 이후 봉오동 일대에서 독립군의 무장항쟁이 활발해진다.    일본은 신식 무기로 무장한 월강추격대를 필두로 독립군 토벌 작전을 시작하고,  독립군은 불리한 상황을 이겨내기 위해 봉오동 지형을 활용하기로 한다.    항일대도를 휘두르는 비범한 칼솜씨의 해철(유해진)과 발 빠른 독립군 분대장 장하(류준열)  그리고 해철의 오른팔이자 날쌘 저격수 병구(조우진)는  빗발치는 총탄과 포위망을 뚫고 죽음의 골짜기로 일본군을 유인한다.    계곡과 능선을 넘나들며 귀신같은 움직임과 예측할 수 없는 지략을 펼치는 독립군의 활약에  일본군은 당황하기 시작하는데...    1920년 6월, 역사에 기록된 독립군의 첫 승리  봉오동 죽음의 골짜기에 묻혔던 이야기가 지금부터 시작된다.','원신연,유해진,류준열,조우진','2019-08-07',134,'20184462_봉오동전투.png'),(20184543,'변신','“어제 밤에는 아빠가 두 명이었어요” 사람의 모습으로 변신하는 악마가 우리 가족 안에 숨어들면서  기이하고 섬뜩한 사건들이 벌어진다  서로 의심하고 증오하고 분노하는 가운데  구마 사제인 삼촌 \'중수\'가 예고없이 찾아오는데…    절대 믿지도 듣지도 마라','김홍선,배성우,성동일,장영남,김혜준,조이현,김강훈','2019-08-21',112,'20184543_변신.png'),(20184621,'엑시트','짠내 폭발 청년백수, 전대미문의 진짜 재난을 만나다! 대학교 산악 동아리 에이스 출신이지만  졸업 후 몇 년째 취업 실패로 눈칫밥만 먹는 용남은  온 가족이 참석한 어머니의 칠순 잔치에서  연회장 직원으로 취업한 동아리 후배 의주를 만난다  어색한 재회도 잠시, 칠순 잔치가 무르익던 중  의문의 연기가 빌딩에서 피어 오르며  피할 새도 없이 순식간에 도심 전체는 유독가스로 뒤덮여 일대혼란에 휩싸이게 된다.  용남과 의주는 산악 동아리 시절 쌓아 뒀던 모든 체력과 스킬을 동원해  탈출을 향한 기지를 발휘하기 시작하는데…','이상근,조정석,윤아','2019-07-31',103,'20184621_엑시트.png'),(20193665,'47미터 2','물에 잠긴 고대 마야의 수중도시 \'시발바\'를 향해   짜릿한 동굴 다이빙에 나선 \'미아\'와 친구들은   예기치 못한 사고로 미로 같은 동굴 속에 갇혀 헤매던 중   오랜 시간 굶주린 블라인드 샤크와 맞닥뜨리게 된다.      산소도, 탈출구도 없는 칠흑 같은 어둠 속에 갇힌 이들은   눈 보다 예민한 제3의 감각으로 좁혀오는 상어떼를 피해   목숨을 건 극한의 숨바꼭질을 시작하는데..','요하네스 로버츠,소피 넬리스, 시스틴 로즈 스탤론, 브리안느 쥬, 코린 폭스, 브렉 베싱어','2019-08-28',90,'20193665_47미터.png'),(20196850,'분노의 질주: 홉스&쇼','드디어 그들이 만났다! 공식적으로만 세상을 4번 구한 전직 베테랑 경찰 ‘루크 홉스’(드웨인 존슨)   분노 조절 실패로 쫓겨난 전직 특수요원 ‘데카드 쇼’(제이슨 스타뎀)   99.9% 완벽히 다른 두 남자는 전 세계를 위협하는 불가능한 미션을 해결하기 위해   어쩔 수 없이 한 팀이 되고 마는데…','데이빗 레이치, 드웨인 존슨, 제이슨 스타뎀','2019-08-14',135,'20196850_분노의질주.png');