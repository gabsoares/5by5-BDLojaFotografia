CREATE TABLE Cliente
(
  codigo_cliente int identity(1,1) not null,
  nome_cliente varchar(50) not null,
  tel_comercial_cliente varchar(14),
  tel_residencial_cliente varchar(14),
  tel_celular_cliente varchar(14) not null,
  CONSTRAINT pk_cliente PRIMARY KEY (codigo_cliente)
);

CREATE TABLE Cliente_PF
(
  id_pf int identity(1,1),
  cpf char(11) not null,
  rg varchar(10) not null,
  data_nascimento date not null,
  sexo char(1) not null,
  complemento varchar(20),
  numero varchar(10),
  CONSTRAINT fk_cliente_pf FOREIGN KEY (id_pf) references Cliente(codigo_cliente),
  CONSTRAINT pk_cliente_pf PRIMARY KEY (id_pf),
  CONSTRAINT uk_cliente_pf UNIQUE (cpf, rg)
);

CREATE TABLE Cliente_PJ
(
  id_pj int identity(1,1) not null,
  cnpj char(14) not null,
  ie char(9) not null,
  data_nascimento date not null,
  sexo char(1) not null,
  complemento varchar(20) not null,
  numero varchar(10) not null,
  CONSTRAINT pk_cliente_pj PRIMARY KEY (id_pj),
  CONSTRAINT uk_cliente_pj UNIQUE (cnpj, ie),
  CONSTRAINT fk_cliente_pj FOREIGN KEY (id_pj) references Cliente(codigo_cliente)
);

CREATE TABLE Funcionario
(
  codigo_funcionario int identity(1,1),
  nome_funcionario varchar(50) not null,
  tel_funcionario varchar(14) not null,
  contato varchar(50) not null,
  funcao varchar(20) not null,
  departamento varchar(20) not null,
  complemento varchar(20) not null,
  numero varchar(10) not null,
  CONSTRAINT pk_funcionario PRIMARY KEY (codigo_funcionario),
);

CREATE TABLE Endereco_Cliente
(
  codigo_cliente int identity(1,1),
  logradouro varchar(30) not null,
  bairro varchar(30) not null,
  cidade varchar(15) not null,
  cep char(8) not null,
  uf char(2) not null,
  CONSTRAINT pk_endereco_cliente PRIMARY KEY (codigo_cliente),
  CONSTRAINT fk_endereco_cliente FOREIGN KEY (codigo_cliente) references Cliente(codigo_cliente)
)

CREATE TABLE Endereco_Funcionario
(
  logradouro varchar(30) not null,
  bairro varchar(30) not null,
  cidade varchar(15) not null,
  cep char(8) not null,
  uf char(2) not null,
  codigo_funcionario int identity(1,1) not null,
  CONSTRAINT pk_endereco_funcionario PRIMARY KEY (codigo_funcionario),
  CONSTRAINT fk_endereco_funcionario FOREIGN KEY (codigo_funcionario) references Funcionario(codigo_funcionario)
)

CREATE TABLE Venda
(
  numero int identity(1,1),
  codigo_funcionario int,
  codigo_cliente int,
  valor_venda float not null,
  data_venda date not null,
  condic_pagamento varchar(20) not null,
  CONSTRAINT pk_venda PRIMARY KEY (numero),
  CONSTRAINT fk_cliente_venda FOREIGN KEY (codigo_cliente) references Cliente(codigo_cliente),
  CONSTRAINT fk_funcionario_venda FOREIGN KEY (codigo_funcionario) references Funcionario(codigo_funcionario)
)

CREATE TABLE Item_Venda
(
  numero_venda int,
  codigo_produto int not null,
  valor_venda float not null,
  qtd_produto int not null,
  valor_total float not null,
  CONSTRAINT fk_item_venda FOREIGN KEY (numero_venda) references Venda(numero),
  CONSTRAINT fk_item_venda_produto FOREIGN KEY (codigo_produto) references Produto(codigo)
);

CREATE TABLE Produto
(
  codigo int identity(1,1),
  descricao varchar(30) not null,
  preco_custo float not null,
  preco_venda float not null,
  qtd_estoque int not null,
  qtd_minima int not null,
  tipo varchar(30) not null,
  CONSTRAINT pk_produto PRIMARY KEY (codigo)
);

INSERT INTO Cliente
VALUES('Gabriel', NULL, NULL, '16981906098');

INSERT INTO Cliente_PF
VALUES('44972444827', '550884476', '11/03/2001', 'M', 'Bloco A3 Apt 35', '400-A')

INSERT INTO Endereco_Cliente
VALUES('Av. Rodrigo Fernando Grillo', 'Jardim dos Manacas', 'Araraquara', '14801534', 'SP')

INSERT INTO Funcionario
VALUES('Fernando', '11999999999', 'Giselle', 'Dev', 'TI', 'Bloco 3 Apt 25', '527')

INSERT INTO Endereco_Funcionario
VALUES('Av. Jose Dois', 'Jardim dos Meia', 'Araraquara', '14801004', 'SP')

INSERT INTO Produto
VALUES('Album fotografico', 10.50, 21.00, 10, 1, 'Album')

INSERT INTO Venda
VALUES(1, 1, 20.50, GetDate(), 'Cartao de Credito')

INSERT INTO Item_Venda
VALUES(1, 1, 21.00, 2, 42.00)

SELECT * FROM Cliente
SELECT * FROM Cliente_PF
SELECT * FROM Endereco_Cliente

SELECT * FROM Funcionario
SELECT * FROM Endereco_Funcionario

SELECT * FROM Produto

SELECT * FROM Venda

SELECT * FROM Item_Venda
