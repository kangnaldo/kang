/* KangTodoProject DB */
create table user (
	id int primary key,
    name varchar(50) not null,
    password varchar(50) not null,
    email varchar(40) not null,
    addr varchar(255) not null,
    useno int not null
);

create table board(
	pagenum int primary key,
    subject varchar(100) not null,
    content text not null,
    createdate timestamp not null,
    name varchar(50) not null,
    id int not null references user(id)
);

create table category(
	cano int primary key,
    caname varchar(50) not null
);

create table todo(
	todono int primary key,
    id int references user(id),
    cano int references category(cano),
    createtododate date not null,
    tododate date not null
);