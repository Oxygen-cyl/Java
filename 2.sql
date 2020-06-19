create table business (
bno char(10) primary key,
bname char(50) not null,
btype enum('企业','事业','私有'),
baddress char(20),
btel char(13)
) ;

create table hospital (
hno char(5) primary key,
hname char(40) not null,
haddress char(60)
) ;

create table card (
cno char(15) primary key,
ctype enum('企业','事业','灵活就业'),
cmoney decimal(7,2) not null
);

create table staff (
sno char(5) primary key,
sname char(20) not null,
ssex enum('男','女'), 
sbirthday date,
saddress char(20),
stel char(20) unique,
cno char(15),
bno char(10),
constraint fk_card_staff
foreign key(cno) references card(cno),
constraint fk_business_staff
foreign key(bno) references business(bno)
);

create table see (
sno char(5),
hno char(5),
sdate date,
primary key (sno,hno,sdate),
constraint fk_staff_see
foreign key(sno) references staff(sno) on delete cascade,
constraint fk_hospital_see
foreign key(hno) references hospital(hno)
);

create table consume(
cno char(15),
hno char(5),
csdate date not null,
mname char(20),
mnum int not null,
csmoney decimal(7,2) not null,
primary key(cno,hno,csdate),
constraint fk_card_consume
foreign key(cno) references card(cno) on delete cascade,
constraint fk_hospital_hno
foreign key(hno) references hospital(hno)
);

create table insurance(
idate date,
cno char(15),
imoney decimal(5,2) not null,
bno char(10),
primary key(idate,cno),
constraint fk_card_insurance
foreign key(cno) references card(cno),
constraint fk_business_insurance
foreign key(bno) references business(bno)
);


