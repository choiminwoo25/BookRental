CREATE DATABASE IF NOT EXISTS daelim;
USE daelim;

CREATE TABLE IF NOT EXISTS TB_ADMIN_ACCOUNT (
    no       INT          NOT NULL AUTO_INCREMENT,
    approval INT          NOT NULL DEFAULT 0,
    id       VARCHAR(20)  NOT NULL,
    password VARCHAR(100) NOT NULL,
    name     VARCHAR(20)  NOT NULL,
    gender   CHAR(1)      DEFAULT NULL,
    part     VARCHAR(20)  DEFAULT NULL,
    position VARCHAR(20)  DEFAULT NULL,
    email    VARCHAR(20)  DEFAULT NULL,
    phone    VARCHAR(20)  DEFAULT NULL,
    regDate  DATETIME     DEFAULT NULL,
    modDate  DATETIME     DEFAULT NULL,
    PRIMARY KEY (no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS TB_USER_MEMBER (
    no      INT          NOT NULL AUTO_INCREMENT,
    id      VARCHAR(20)  NOT NULL,
    pw      VARCHAR(100) NOT NULL,
    name    VARCHAR(20)  NOT NULL,
    gender  CHAR(1)      NOT NULL,
    email   VARCHAR(50)  NOT NULL,
    phone   VARCHAR(20)  NOT NULL,
    regDate DATETIME     DEFAULT NULL,
    modDate DATETIME     DEFAULT NULL,
    PRIMARY KEY (no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
