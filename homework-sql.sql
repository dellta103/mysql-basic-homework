create database food_app;
use food_app;
create table users(
	id int auto_increment primary key,
	username varchar(255),
    passwords varchar(16),
    type_login varchar(255)
);
create table category(
	id int auto_increment primary key,
    category_name varchar(255),
    url_image binary
);
create table store(
	id int auto_increment primary key,
    store_name varchar(255),
    url_image binary
);
create table statuses(
	id int auto_increment primary key,
    status_name varchar(255)
);
create table orders(
	id int auto_increment primary key,
    start_date datetime default now(),
    end_date datetime default now(),
    id_status int,
    id_user int,
    foreign key(id_status) references statuses(id),
    foreign key(id_user) references users(id)
);
create table menu(
	id int auto_increment primary key,
    menu_name varchar(255),
    url_image binary,
    rating int,
    price int,
    desciption varchar(1000),
    id_store int,
    id_category int,
    foreign key(id_store) references store(id),
    foreign key(id_category) references category(id)
);
create table review(
	id int auto_increment primary key,
    comments varchar(1000),
    rating int,
    id_store int,
    foreign key(id_store) references store(id)
);
create table submenu(
	id int auto_increment primary key,
    submenu_name varchar(255),
	price int,
    id_store int,
    foreign key(id_store) references store(id)
);
create table ordersdetail(
	id_orders int,
    id_menu int,
    price int,
    id_status int,
    foreign key(id_orders) references orders(id),
    foreign key(id_menu) references menu(id),
    foreign key(id_status) references statuses(id)
);
create table menudetail(
	id int auto_increment primary key,
    id_menu int,
    id_submenu int,
    foreign key(id_menu) references menu(id),
    foreign key(id_submenu) references submenu(id)
);
create table detailuser(
	id_user int primary key,
    fullname varchar(255),
    phone_number int,
    state varchar(255),
    city varchar(255),
    street varchar(100),
    foreign key(id_user) references users(id)
);
create table promo(
	id int auto_increment primary key,
    promo_name varchar(255),
    discount varchar(100),
    expired_data varchar(100)
);
create table menupromo(
	id_menu int,
    id_promo int,
    foreign key(id_menu) references menu(id),
    foreign key(id_promo) references promo(id)
);
create table state(
	id int auto_increment primary key,
    state_name varchar(255)
);
create table city(
	id int auto_increment primary key,
    city_name varchar(255),
    id_state int,
    foreign key(id_state) references state(id)
);