/* 게시판 테이블 
 **/
CREATE TABLE bbs(
	no Number NOT NULL,
 	 title VARCHAR2(50 CHAR) NOT NULL,
	writer VARCHAR2(10 CHAR) NOT NULL,
  	email VARCHAR2(30 CHAR) NOT NULL,
	content VARCHAR2(500 CHAR),
	reg_date TIMESTAMP(0) WITH LOCAL TIME ZONE NOT NULL,
	CONSTRAINTS bbs_no_pk PRIMARY KEY(no)
);

/* 게시판 테이블의 PRIMARY KEY에 사용되는 SEQUENCE 생성
 **/
 CREATE SEQUENCE bbs_seq
  MINVALUE 1
  MAXVALUE 9999999
  INCREMENT BY 1
  START WITH 1;

DROP TABLE bbs;
DROP SEQUENCE bbs_seq;

INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'공지 사항 입니다.','관리자','midastop@naver.com','안녕하세요' || CHR(13) || CHR(10) || '이번에 어쩌구 저쩌구 해서리...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '\r\n\r\n이렇게 운영계획과 약관을 바꾸게 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원님들의 양해를 구하며 사이트 이용해 참고 하시기 바랍니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10),'2016-06-01 01:44:58');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'공지 사항 잘 읽었습니다.','회원1','jsp@naver.com','아~ 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '공지사항 잘 읽었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그런데 궁금한 것이 있어 게시글 남깁니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '이렇게 저렇게 해서리... 궁금합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '답변 부탁 드립니다.','2016-06-01 05:43:38');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'관심을 가져 주셔서...','관리자','midastop@naver.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '이번에 변경된 회원 약관에 대해 관심을 가져 주셔서 감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '사이트를 운영하다 보니.. ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '어쩔수 없이 어쩌구 저쩌구 해서 약관이 변경되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 좋은 하루 되시길 바랍니다.','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'저두 궁금했었는데','회원2','servlet@naver.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '저두 궁금했었는데...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님께서 질문을 해 주셔서 고맙습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '즐공하시고 행복한 하루 되세요..^_^','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'당연히 회원이면 관심을 가져야죠^_^','회원1','jsp@naver.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '당연히 회원이니까 약관 변경에 관심을 가져야죠' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 오늘도 좋은 하루 보내세요','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'많은 회원님들께서 관심을 가져주셔서 감사합니다.','관리자','midastop@naver.com','안녕하세요' || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '많은 회원분들께서 이번 약관 변경에 관심을 가져 주셔서 정말 고맙습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '앞으로 더욱 발전하는 사이트가 되겠습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 언제나 행복하세요.^_^','2016-06-01 16:30:41');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'사이트 발전에 관심이 많은 사람입니다.','회원3','request@daum.net','안녕하삼~ 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '사이트 발전에 관심이 많은 사람으로서 지금 보다 나은 사이트를 위해' || CHR(13) || CHR(10) || '운영계획과 약관을 변경하는 것은 잘 된 일이라 생각합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 수고 많이 하삼~','2016-06-01 05:03:52');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'정말 정말 감사합니다.','관리자','midastop@naver.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원님의 많은 관심에 몸둘바를 모르겠습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '언제나 해복하고 건강하시기 바라겠습니다.','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'네 잘 알겠습니다.','회원4','exception@msn.com','안녕하세요...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '역쉬~ 관리자님은 부지런 하십니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '하하하~ 사이트가 팍팍 발전해 나가는 것이 보이는 것 같습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자님의 끊임없는 노력에 박수를 보냅니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 수고하세요','2016-06-01 03:37:44');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'내용을 줄 바꿈하지 않아서...','관리자','midastop@naver.com','안녕하세요..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님께서 작성한 글이 줄 바꿈되지 않아서..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '테이블이 늘어나내요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || 'ㅋㅋㅋ','2016-06-01 05:04:23');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'저두요~','회원5','response@gmail.com','저두 그게 궁금했는데...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || 'ㅋㅋㅋ 님께서 대신 해주시네요...^_^','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'당연하죠~','회원6','application@jspstudy.com','안녕하세요 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원이니까 관심을 갖는건 당연하죠..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 수고가 많으시네요..','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'별 말씀을 다하시네요','회원1','jsp@naver.com','안녕하세요 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원이면 당연히... 관심을 가져야져..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '헤헤헤' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '수고하세요','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'회원이면 당연한 것을...','회원3','request@naver.com','ㅋㅋㅋ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님들도 다 같은 생각을 가지고 계시군요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '뭐 같은 회원이니...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 모두들 행복하삼~','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'그러게요','회원3','request@naver.com','아~ ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '줄 바꿈 하지 않아도 자동으로 될 줄 알았죠..^_^' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자님이 프로그램 잘 해주셔서... 줄 바꿈 해주삼~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 이만','2016-06-01 04:59:15');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'감사합니다.','관리자','midastop@naver.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '답변글 감사합니다.\r\n\r\n\r\n그럼','2016-06-01 03:40:43');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'아 줄 바꿈 문제 해결 했습니다.','관리자','midastop@naver.com','안녕하세요 관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '먼저 엔터키를 치지않고 글 을 입력하면 줄 바꿈 되지 않는 문제가 발생했는데.. ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '어제 해결 했습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 모두들 즐공 하삼~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '','2016-06-01 04:58:45');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'저두 궁금했는데','회원7','expert@hotmail.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '저두 궁금한 점이 해결 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 모두 수고하삼~','2016-06-01 05:44:32');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'궁금한게 해결 되었네요','회원8','mall@gmail.com','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님 덕분에 궁금한점이 해결 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 이만...^_^','2016-06-01 05:50:21');
INSERT INTO bbs (no,title,writer,email,content,reg_date) VALUES (bbs_seq.NEXTVAL,'감사합니다.','회원1','jsp@naver.com','제 덕분에 궁금한게 해결 되었다니...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '다행입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '즐공하삼~','2016-06-01 05:44:32');
COMMIT;

SELECT * FROM bbs ORDER BY no DESC;

SELECT * FROM 
  (SELECT ROWNUM num, no, title, writer, email, content, reg_date FROM 
    (SELECT * FROM bbs ORDER BY no DESC))
WHERE num >= 1 AND num <= 5;

SELECT COUNT(*) FROM bbs;

show parameters nls_date_format;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
