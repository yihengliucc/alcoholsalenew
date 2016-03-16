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
-- Create table
create table T_USER
(
  userid   NUMBER(10) not null,
  username VARCHAR2(64) not null,
  passwd   VARCHAR2(16),
  email    VARCHAR2(64),
  phone    VARCHAR2(20),
  regdate  DATE,
  grade    NUMBER(10)
);
-- Add comments to the table 
comment on table T_USER
  is '用户信息表';
-- Add comments to the columns 
comment on column T_USER.userid
  is '用户编号';
comment on column T_USER.username
  is '用户姓名';
comment on column T_USER.passwd
  is '用户密码';
comment on column T_USER.email
  is '用户邮箱';
comment on column T_USER.phone
  is '联系方式';
comment on column T_USER.regdate
  is '注册时间';
comment on column T_USER.grade
  is '权限级别';

alter table T_USER
  add primary key (USERID);


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
  
  
  COMMENT ON TABLE t_user IS '用户信息表';
COMMENT ON COLUMN t_user.userid IS '用户编号';
COMMENT ON COLUMN t_user.username IS '用户姓名';
COMMENT ON COLUMN t_user.password IS '用户密码';
COMMENT ON COLUMN t_user.email IS '用户邮箱';
COMMENT ON COLUMN t_user.phone IS '联系方式';
COMMENT ON COLUMN t_user.regdate IS '注册时间';
COMMENT ON COLUMN t_user.grade IS '权限级别';

COMMENT ON TABLE t_stock IS '库存信息表';
COMMENT ON COLUMN t_stock.stockid IS '库存编号';
COMMENT ON COLUMN t_stock.quantity IS '库存量';

COMMENT ON TABLE t_product IS '商品信息表';
COMMENT ON COLUMN t_product.proid IS '商品信息编号';
COMMENT ON COLUMN t_product.proname IS '商品名称';
COMMENT ON COLUMN t_product.descr IS '商品描述';
COMMENT ON COLUMN t_product.normalprice IS '商品价格';
COMMENT ON COLUMN t_product.memberprice IS '会员价格';
COMMENT ON COLUMN t_product.sales IS '销量';
COMMENT ON COLUMN t_product.pubdate IS '商品入库日期';
COMMENT ON COLUMN t_product.stockid IS '库存编号';

COMMENT ON TABLE tb_image IS '商品图片信息';
COMMENT ON COLUMN tb_image.imageid IS '图片编号';
COMMENT ON COLUMN tb_image.imagename IS '图片名称';
COMMENT ON COLUMN tb_image.product_id IS '商品编号';

COMMENT ON TABLE tb_address IS '收货地址信息表';
COMMENT ON COLUMN tb_address.addressid IS '收货地址编号';
COMMENT ON COLUMN tb_address.addressname IS '收货地址';
COMMENT ON COLUMN tb_address.user_id IS '用户编号';

COMMENT ON TABLE t_order IS '订单信息表';
COMMENT ON COLUMN t_order.orderid IS '订单编号';
COMMENT ON COLUMN t_order.userid IS '用户id';
COMMENT ON COLUMN t_order.addrid IS '收货地址编号';
COMMENT ON COLUMN t_order.oderdate IS '订单生成时间';
COMMENT ON COLUMN t_order.status IS '订单状态';
COMMENT ON COLUMN t_order.orderitem IS '订单详细信息编号';
COMMENT ON COLUMN t_order.paydate IS '订单付款时间';

COMMENT ON TABLE t_orderitem IS '订单详细信息';
COMMENT ON COLUMN t_orderitem.itemid IS '订单详细信息编号';
COMMENT ON COLUMN t_orderitem.proid IS '订单对应商品编号';
COMMENT ON COLUMN t_orderitem.unitprice IS '商品单价';
COMMENT ON COLUMN t_orderitem.pcount IS '购买数量';


CREATE OR REPLACE PROCEDURE p_pay_order(
v_orderid INTEGER,
v_ret IN OUT SMALLINT
)
AS
v_productid INTEGER; --商品编号
v_orderitem INTEGER;--详细订单编号
v_stockid INTEGER; --库存编号
v_quantity INTEGER; --库存量
v_pcount INTEGER;--购买数量
v_sales INTEGER;--商品销售量
v_errorcode NUMBER;
v_errormsg VARCHAR2(100);
BEGIN
 --查询商品库存量
 --查询订单信息表中的订单详细信息编号
 SELECT orderitem INTO v_orderitem FROM t_order WHERE orderid=v_orderid;
 --查询订单详细信息中的商品编号
 SELECT proid,pcount INTO v_productid,v_pcount FROM t_orderitem WHERE itemid=v_orderitem;
 --查询出商品信息的库存编号
  SELECT stockid,sales INTO v_stockid,v_sales FROM t_product  WHERE proid=v_productid; 
  --查询出商品库存量
  SELECT quantity INTO v_quantity FROM t_stock WHERE stockid=v_stockid;
  --判断是否有足够的库存
  IF v_quantity>v_pcount THEN --库存足够
    --修改订单支付时间
    UPDATE t_order SET paydate=TO_date(to_char(SYSDATE,'yyyy-mm-dd'),'yyyy-mm-dd') WHERE orderid=v_orderid;
    --减少库存量
    UPDATE t_stock SET quantity=v_quantity-v_pcount WHERE stockid=v_stockid;
    --修改商品销售量
    UPDATE t_product SET sales=v_sales+v_pcount  WHERE proid=v_productid;
    v_ret:=0;
    COMMIT;
    RETURN;
  ELSE
    v_ret:=99;
    RETURN;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
  ROLLBACK;
  v_errorcode:=SQLCODE;
  v_errormsg:=SQLERRM;
  INSERT INTO tb_log_err VALUES ('p_pay_order',SYSDATE,v_errorcode,v_errormsg);
  COMMIT;
  v_ret:=99;
END;


 






