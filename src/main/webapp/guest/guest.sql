SHOW TABLES;
CREATE TABLE guest(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	/*방명록 인덱스 번호*/
	name VARCHAR(20) NOT NULL,	/*이름*/
	content TEXT NOT NULL,	/*방명록 글 내용*/
	email VARCHAR(60),	/*메일 주소*/
	homePage VARCHAR(60),	/*홈페이지 주소*/
	visitDate DATETIME DEFAULT now(),	/*방문일자*/
	guestIP VARCHAR(30) NOT NULL	/*방문자의 아이피*/
);

DESC guest;

INSERT INTO guest VALUES (DEFAULT,'관리자','방명록 게시합니다~','ddd1431@naver.com','www.naver.com',DEFAULT,'192.168.50.63');
SELECT count(email) FROM guest;
SELECT * FROM guest ORDER BY idx limit 1,5;
SELECT * FROM guest;
SELECT * FROM hoewon;