## Korea_Camping
전국의 캠핑 사이트를 보고 다른 사람들과 경험을 공유할 수 있는 웹사이트

# 환경
- Windows 10
- JDK 1.7
- Tomcat 9.0
- MySQL 8.0
- Spring Legacy
- 공공 데이터 포털 API
- 주소 API
- AJAX
- JSON 파싱
- JSTL
- 인코딩 UTF-8
- GIT
- Summernote
- Bootstrap

# MySQL 데이터베이스 생성 및 테이블 생성

```sql
create database nolegaza;
```

- MySQL 테이블 생성

```sql
use nolegaza;

CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `viewCount` int DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  `modifyDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `camp` (
  `contentId` int NOT NULL,
  `steamingCount` int DEFAULT '0',
  `facltNm` varchar(50) NOT NULL,
  `lineIntro` longtext,
  `intro` longtext,
  `induty` varchar(30) NOT NULL,
  `lctCl` varchar(30) DEFAULT NULL,
  `featureNm` longtext,
  `tel` varchar(15) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `sbrsCl` longtext,
  `sbrsEtc` longtext,
  `posblFcltyCl` longtext,
  `homepage` longtext,
  `resveUrl` longtext,
  `doNm` varchar(10) NOT NULL,
  `sigunguNm` varchar(10) NOT NULL,
  `animalCmgCl` varchar(10) NOT NULL,
  `brazierCl` varchar(10) NOT NULL,
  `caravAcmpnyAt` varchar(5) NOT NULL,
  `mapX` double NOT NULL,
  `mapY` double NOT NULL,
  `img1` longtext,
  `img2` longtext,
  `img3` longtext,
  `img4` longtext,
  `img5` longtext,
  `img6` longtext,
  `img7` longtext,
  `img8` longtext,
  `img9` longtext,
  `img10` longtext,
  `createdtime` varchar(20) NOT NULL,
  `modifiedtime` varchar(20) NOT NULL,
  PRIMARY KEY (`contentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boardId` int NOT NULL,
  `userId` int NOT NULL,
  `comment` longtext NOT NULL,
  `createDate` timestamp NOT NULL,
  `modifyDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) NOT NULL,
  `userPassword` varchar(30) NOT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userAddress` varchar(150) NOT NULL,
  `userSteaming` varchar(300) DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

```
