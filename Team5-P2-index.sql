CREATE INDEX IDX_ORDER ON ORDER1
(Ino, Odate);
-- 매출 계산시에 사용에 용이하도록 

CREATE INDEX IDX_CUSTOMER ON CUSTOMER
(Age, Sex);
-- 신규 고객 추천 시에 나이와 성별 관련 된 쿼리를 빠르게 수행하도록

CREATE INDEX IDX_RETAILER ON RETAILER
(Address);
-- RETAILER 테이블은 굳이 주소를 정렬해서 사용할 필요가 없음

CREATE INDEX IDX_CATEGORY ON CATEGORY
(Large_category);
-- CATEGORY도 마찬가지로 굳이 사용할 필요가 없음.

CREATE INDEX IDX_ITEM ON ITEM
(Iname);
-- 추가적으로 아이템의 이름도 사용하면 쿼리시에 빨라 질 수도 있음

CREATE INDEX IDX_SHOPPINGBAG ON SHOPPINGBAG
(Inum, Bquantity);
-- 부족한 재고량 쿼리시에 용이하게 사용할 수 있음.

CREATE INDEX IDX_STOCK ON STOCK
(Squantity, Inum, Rnum);
-- 주문할 때 쿼리 속도 향상 

CREATE INDEX IDX_PRODUCERLOCATION ON PRODUCERLOCATION
(Importer, Producer);
-- Importer에 널 값이 많으므로
