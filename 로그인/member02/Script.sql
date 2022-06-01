create table member02 (
    u_id varchar2(50) not null primary key,
    u_pass varchar2(50) not null,
    u_name varchar2(50) not null,
    r_date date default sysdate not null,
    u_address varchar(200) not null,
    u_tell varchar(50) not null,
    u_birthday date not null
    )
    
select * from member02;
insert into member02 values('admin@kosmo.com', '1234', '관리자', default, '서울', '010-0000-1111', sysdate)
insert into member02 values('hongkd@kosmo.com', '1234', '홍길동', default, '경기도', '010-2222-1111', sysdate)
commit;

logon02 : LogonDTO.java, LogonDAO.java 
member02 : 회원 가입 처리(DB에 Insert), ID와 Pass 인증 처리 : <== AJAX 사용해서 처리 