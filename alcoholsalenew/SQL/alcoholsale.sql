/* 
  Use Oracle Database
  Author: 
  Date: 20160310
/*

-- 创建数据库方案
-- create user
CREATE USER alcoholsale IDENTIFIED BY abc123; 
-- grant right to this user
GRANT SELECT ANY DICTIONARY TO alcoholsale;
GRANT CREATE SESSION,CREATE VIEW TO alcoholsale;
GRANT RESOURCE TO alcoholsale;
-- switch user
CONNECT alcoholsale/abc123@VM;

-- 用户表
DROP TABLE t_user;
CREATE TABLE t_user(
  userid NUMBER PRIMARY KEY,
  username VARCHAR2(64) NOT NULL,
  passwd VARCHAR2(16),
  email VARCHAR2(64) ,
  phone VARCHAR2(20),
  addr1 VARCHAR2(255),
  addr2 VARCHAR2(255),
  grade number,
  regdate DATE
);

-- 商品类别表
-- 商品类别
DROP TABLE t_category;
CREATE TABLE t_category(
 catid NUMBER PRIMARY KEY, 	-- 分类id号，当前级别，0为顶级
 catname VARCHAR2(255),     -- 分类名称
 supid NUMBER,				-- 上层级别id号
 descr VARCHAR2(255)        -- 分类描述
);


-- 商品表
DROP TABLE t_product;
CREATE TABLE t_product(
 proid NUMBER PRIMARY KEY,
 proname VARCHAR2(255),
 descr VARCHAR2(255),       -- 商品描述
 img VARCHAR2(255),         -- 商品图片位置
 normalprice NUMBER(8,2),   -- 普通价格
 memberprice NUMBER(8,2),   -- 会员价格
 pubdate DATE,              -- 发布日期
 sales NUMBER,              --销量
 catid1 NUMBER,             -- 商品类别
 FOREIGN KEY(catid1) REFERENCES t_category(catid)
);

-- 库存表
DROP TABLE t_stock;
CREATE TABLE t_stock(
  stockid NUMBER PRIMARY KEY,
  proid NUMBER,
  quantity NUMBER,
  FOREIGN KEY(proid) REFERENCES t_product(proid)
);
-- 订单表
DROP TABLE t_order;
CREATE TABLE t_order(
 orderid NUMBER PRIMARY KEY,
 userid NUMBER,
 addr VARCHAR2(255),			-- 订单收货地址
 oderdate DATE,					-- 订单生成日期
 status NUMBER,					-- 订单状态
 paydate DATE,				-- 订单付款日志
 FOREIGN KEY(userid) REFERENCES t_user(userid)
);

-- 订单详情表
DROP TABLE t_orderitem;
CREATE TABLE t_orderitem(
 itemid NUMBER PRIMARY KEY,
 proid NUMBER,
 unitprice NUMBER(8,2), -- 单价
 pcount NUMBER,         -- 购买数量
 orderid NUMBER,
 FOREIGN KEY(proid) REFERENCES t_product(proid),
 FOREIGN KEY(orderid) REFERENCES t_order(orderid)
);

-- create sequence
CREATE SEQUENCE seq_user
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

CREATE SEQUENCE seq_category
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

CREATE SEQUENCE seq_product
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

CREATE SEQUENCE seq_stock
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

CREATE SEQUENCE seq_order
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

CREATE SEQUENCE seq_orderitem
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE
/

-----------初始化数据----------------
-- 用户数据,普通用户等级为2级
INSERT INTO T_USER
  (USERID, USERNAME, PASSWD, EMAIL, PHONE, ADDR1, REGDATE, GRADE)
VALUES
  (SEQ_USER.NEXTVAL, 'cc', '123', 'liucheng@163.com', '13800000000','江西南昌',SYSDATE, 2);






