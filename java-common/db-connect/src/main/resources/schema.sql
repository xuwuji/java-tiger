create table search_record (id int NOT NULL AUTO_INCREMENT PRIMARY KEY,keyword VARCHAR(255),time VARCHAR(255));

create table news_KW (id int NOT NULL AUTO_INCREMENT PRIMARY KEY,keyword VARCHAR(255),NewsId Integer,index(keyword,NewsId));