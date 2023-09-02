-- criação do banco de dados para cenario de E-comerce

create database ecomerce;
use ecomerce;

-- criar tabela cliente
create table cliente(
idCliente int auto_increment primary key,
Fname varchar(10),
Minit char(5),
Lname varchar(20),
CPF char(11) not null,
constraint unique_cpf_cliente unique(CPF)
);

-- criar tabela produto
create table Produto(
idProduto int auto_increment primary key,
Pname varchar(10),
classification_kids bool,
category enum("Eletronico","Vestimenta","Brinquedo","Alimentos"),
avaliação float,
size varchar(10),
constraint unique_cpf_cliente unique(CPF)
);


-- criar tabela payments
create table payments(
idCliente int,
idPayment int,
typePayment enum("Boleto","Cartão","Dois Cartoes"),
primary key(idCliente, id_payment)
);


-- criar tabela orders
create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderSatus enum("Cancelado","Confirmado","Em processamento") not null,
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_ordes_client foreign key (idOrderClient) references clients(idCliente)
);

-- criar tabela estoque
create table productStorage(
idProdStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0
);

-- criar tabela fornecedor 
create table supplier(
idSupplier int auto_increment primary key,
SocialName varchar(255) not null,
CNPJ char(15) not null,
contact char(11) not null,
constraint unique_supplier unique(CNPJ)
);


-- criar tabela vendedor 
create table seller(
idSeller int auto_increment primary key,
SocialName varchar(255) not null,
AbstName varchar(255),
CNPJ char (15),
CPF char(9),
location varchar(255),
contact char(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);

-- criar tabela productSeller 
create table productSeller(
idPSeller int,
idProduct int,
prodQuantity int default 1,
constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productorder(
idpoproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum("Disponivel", "Sem estoque") default "Disponivel",
primary key (idPOproduct, idPOorder),
constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_product_product foreign key (idPOorder) references orders (idorder)
);

create table storagelocation(
idLproduct int,
idustorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_product_seller foreign key (idLproduct) references product(idProduct),
constraint fk_product_product foreign key (idLstorage) references orders(productSeller)
);


create table productsupplier(
idpssupplier int,
idpsroduct int,
quantity int not null,
primary key (idPssupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idsupplier),
constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(ideProduct)
);


show tables;
use informaction_schema;


insert into Clients (Frame, Minit, Lname, CPF, Address)
values("Maria", "stiva", L12346789, "rua silva de prata 29", "Carangola - Cidade das flores"),
("Matheus", 0, "Pimentel", 987654321, "rua alemeda 289, Centro - Cidade das flores"),
("Ricardo",0, "Silva", 45678913, "avenida alemeda vinha 1009", "Centro - Cidade das flores"),
("julia",0 ,"Franca", 789123456, "rua lareijras 861", "Centro - Cidade das flores"),
("Roberta","G", "Assis", 98745631, "avenidade koller 19", "Centro - Cidade das flores"),
("Isabela","M","Cruz", 654789123, "rua alemeda das flores 28", "Centro - Cidade das flores");

insert into product(Pname,classification_kids, category, avaliaclo, size) values
("Fone de ouvido",false, "Eletrdnico","4",null),
("Barbie Elsa", true, "Brinquedos", "3",null),
("Body Carters", true, "Vestimenta","5",null),
("Microfone Vedo - Youtuber",False, "Eletronico", "4" ,null),
("Sofé retratil", False, "Moveis","3",null),
("arinha de arroz’,False, Alinentos’,'2", null),
("Fire Stick Amazon",False, "Eletronico","3", null);


select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

insert into orders (idOrderClient, orderStatus, orderescription, sendValue, paymentCash) values
(1, null,"compra via aplicativo",null,1),
(2,null, "compra via aplicativo",50,0),
(3,null,  "Confirmado",null, null, 1),
(4,null, "compra via web site",150);

-- 1dPOproduct, idPOorder, poQuantity, poStatus
select * from orders; 

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1,1,2,nu11),
(2,1,1,nu11),
(3,2,1,null);


insert into productStorage (storagelocation,quantity) values
("Rio de Janeiro",1000),
("Rio de Janeiro",500),
("Sao Paulo", 10),
("Sao Paulo", 100),
("Sao Paulo", 10),
("Brasilia", 60);   

select count(*) from client;
select Fname,Lname, idOrder, orderStatus from clients ¢, orders o where c.idClient =idOrderClient;
select concat(Fname,” °,Lname) as Client, 1dOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values (2, default, "compra via aplicativo",null,1);

