CREATE DATABASE gerenciamento_pedidos;
USE gerenciamento_pedidos;

-- Criando tabela Clientes
CREATE TABLE IF NOT EXISTS Clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nome_cliente VARCHAR(45) NOT NULL,
  cpf_cliente VARCHAR(45) NOT NULL UNIQUE,
  total_pedidos_cliente DECIMAL(10,2) NULL,
  PRIMARY KEY (id_cliente)
 );

-- Criando tabela Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  valor_pedido DECIMAL(10,2) NOT NULL,
  detalhe_pedido VARCHAR(45) NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (cliente_id) REFERENCES Clientes (id_cliente)
  );

-- Criando tabela Clientes_Pedidos
CREATE TABLE IF NOT EXISTS Clientes_Pedidos (
  cp_cliente_id INT NOT NULL,
  cp_pedido_id INT NOT NULL,
  PRIMARY KEY (cp_cliente_id, cp_pedido_id),
  FOREIGN KEY (cp_pedido_id) REFERENCES Pedidos (id_pedido),
  FOREIGN KEY (cp_cliente_id) REFERENCES Clientes (id_cliente)
);

-- inserindo dados na tabela clientes
INSERT INTO Clientes VALUES (null, 'Roberto', '512359', null);
INSERT INTO Clientes VALUES (null, 'Cleidison', '123456', null);
INSERT INTO Clientes VALUES (null, 'Mario', '789101', null);

select * from Clientes;

-- inserindo dados na tabela pedidos
INSERT INTO Pedidos VALUES (null, 1, 24.90, 'sem picles');
INSERT INTO Pedidos VALUES (null, 2, 64.99, 'sem arroz');
INSERT INTO Pedidos VALUES (null, 3, 3234.00, 'com tudo que tem direito');

select * from Pedidos;

-- Stored Procedure para inserir um novo pedido na tabela 

delimiter $
create procedure InserirPedido (
  cliente_id INT,
  valor DECIMAL (10,2),
  detalhe VARCHAR(45)
)
BEGIN
	  INSERT INTO Pedidos (cliente_id, valor_pedido, detalhe_pedido) VALUES (cliente_id, valor, detalhe);
END$
DELIMITER ;

call InserirPedido (1, 999.99, 'teste Stored');
select * from pedidos;


-- criando trigger para depois ser acionado depois que um pedido for feito. Ele atualiza o valor total do pedido
DELIMITER $
CREATE TRIGGER AtualizarTotalPedidosCliente
	AFTER INSERT ON Pedidos  
    FOR EACH ROW
    BEGIN
			UPDATE Clientes 
            SET total_pedidos_cliente = (SELECT SUM(valor_pedido) 
								 FROM Pedidos 
								 WHERE cliente_id = NEW.cliente_id)
            WHERE Clientes.id_cliente = NEW.cliente_id;
	END;
    $
DELIMITER ;

call InserirPedido (1, 23.99, 'detalhe trigger');
select * from pedidos;
select * from Clientes;


-- Criando uma view para combinar as informações detalhes dos pedidos e os nomes dos clientes.

CREATE VIEW PedidosClientes as
SELECT Pedidos.cliente_id, Clientes.nome_cliente, Pedidos.detalhe_pedido, Pedidos.valor_pedido
FROM Pedidos
INNER JOIN Clientes
ON cliente_id = id_cliente;

SELECT * FROM PedidosClientes;

-- lista os detalhes dos pedidos de cada cliente.

SELECT  PedidosClientes.nome_cliente, PedidosClientes.valor_pedido, PedidosClientes.detalhe_pedido, 
		Clientes.total_pedidos_cliente
FROM PedidosClientes
JOIN Clientes
ON PedidosClientes.cliente_id = Clientes.id_cliente;