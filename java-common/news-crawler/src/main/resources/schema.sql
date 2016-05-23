CREATE TABLE news (id int NOT NULL AUTO_INCREMENT PRIMARY KEY , title VARCHAR(255), link VARCHAR(255), time  VARCHAR(255),type VARCHAR(255),bigCategory VARCHAR(255),subCategory  VARCHAR(255),content longtext )ENGINE=InnoDB DEFAULT CHARACTER SET=gb2312;

CREATE TABLE news (id int NOT NULL AUTO_INCREMENT PRIMARY KEY , title VARCHAR(255), link VARCHAR(255), time  VARCHAR(255),content longtext, typeId int )ENGINE=InnoDB DEFAULT CHARACTER SET=gb2312;

create table news_meta (id int NOT NULL AUTO_INCREMENT PRIMARY KEY,type VARCHAR(255),bigCategory VARCHAR(255),subCategory  VARCHAR(255));

insert into news_meta( subCategory,bigCategory,type) select DISTINCT(subCategory) as subCategory,bigCategory,type from news;
