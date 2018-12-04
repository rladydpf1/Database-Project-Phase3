인덱스 생성
팀 5
김요엘, 이현민

PRIMARY KEY는 제외함.

ORDER1 :
Oquantity	int unsigned not null,
Cno		int unsigned not null,
Ino		int unsigned not null,
Rno		int unsigned not null,
Odate		datetime,
FOREIGN KEY(Cno) REFERENCES CUSTOMER (Cnumber),
FOREIGN KEY(Rno, Ino) REFERENCES STOCK (Rnum, Inum)

SHOPPINGBAG :
Bquantity	int 	unsigned

PRODUCERLOCATION :
Origin		varchar(20)	,
Importer 	varchar(20)	,
Producer	varchar(20)	,
FOREIGN KEY(Inum) REFERENCES ITEM (Inumber)

STOCK :
Squantity	int unsigned
FOREIGN KEY(Rnum) REFERENCES RETAILER (Rnumber),
FOREIGN KEY(Inum) REFERENCES ITEM (Inumber)

ITEM :
Date_of_product DATE 		NOT NULL,
Price 		int	 	unsigned NOT NULL,
Iname 		varchar(30) 	NOT NULL,
Expiration_date DATE 		NOT NULL,
Smallc 		varchar(25) 	NOT NULL,
FOREIGN KEY(Smallc) REFERENCES CATEGORY (Small_category)

CATEGORY :
Large_category	varchar(25) 	NOT NULL,
PRIMARY KEY(Small_category)

RETAILER :
Address varchar(50) NOT NULL,
PRIMARY KEY(Rnumber)

CUSTOMER :
Cname	varchar(20) 	NOT NULL,
Address	varchar(50) 	NOT NULL,
Job	varchar(30)		, 
Age	int		unsigned,
Sex	char			,
Phone	varchar(15) 	NOT NULL,
Grade	char	    	NOT NULL,
Pwd	varchar(15) 	NOT NULL,
