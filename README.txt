인덱스 생성
팀 5
김요엘, 이현민

CREATE INDEX IDX_ORDER ON ORDER1
(Ino, Odate);
-- 매출 계산시에 사용에 용이하도록
-- 매출 계산을 할 때 아이템 번호를 기준으로 그룹핑을 하고 날짜 범위를 계산하기 때문

CREATE INDEX IDX_CUSTOMER ON CUSTOMER
(Age, Sex);
-- 신규 고객 추천 시에 나이와 성별 관련 된 쿼리를 빠르게 수행하도록
-- 신규 고객 추천 서비스는 회원가입한 정보를 기반으로 쿼리를 수행하는데 이 때 나이와 성별이 쓰인다.

CREATE INDEX IDX_RETAILER ON RETAILER
(Address);
-- RETAILER 테이블은 굳이 주소를 정렬해서 사용할 필요가 없음

CREATE INDEX IDX_CATEGORY ON CATEGORY
(Large_category);
-- CATEGORY 테이블도 마찬가지로 사용할 곳이 거의 없으므로 굳이 사용할 필요가 없음

CREATE INDEX IDX_ITEM ON ITEM
(Iname);
-- 추가적으로 아이템의 이름도 사용하면 쿼리시에 빨라 질 수 있음

CREATE INDEX IDX_SHOPPINGBAG ON SHOPPINGBAG
(Inum, Bquantity);
-- 부족한 재고량 쿼리시에 용이하게 사용할 수 있음
-- 관리자 모드에서 재고가 부족한 아이템을 찾아볼 때 아이템으로 그룹핑을 하기 때문에 용이함

CREATE INDEX IDX_STOCK ON STOCK
(Squantity, Inum, Rnum);
-- 주문할 때 쿼리 속도 향상 
-- 주문을 할 때 쿼리가 아이템과 재고 상태, 그리고 매장 별 재고가 필요하므로 사용에 용이함

CREATE INDEX IDX_PRODUCERLOCATION ON PRODUCERLOCATION
(Importer, Producer);
-- Importer에 널 값이 많으므로
