-- Criando tabela a Pedidos
CREATE TABLE Pedidos(
IDPedido INT AUTO_INCREMENT PRIMARY KEY,
DataPedido DATETIME,
NomeCliente varchar(100)
);

-- Inserindo os dados
INSERT INTO Pedidos (DataPedido, NomeCliente) VALUES
(now(), 'Cliente 1'),
(now(), 'Cliente 2'),
(now(), 'Cliente 3');

-- criando primeiro Trigger
DELIMITER $
CREATE TRIGGER RegistroDataCriacaoPedido
	BEFORE INSERT ON Pedidos
    FOR EACH ROW
    BEGIN
		SET NEW.DataPedido = Now();
	END;
    $
DELIMITER ;

-- inserindo um novo pedido sem fornecer a data dele
INSERT INTO Pedidos (NomeCliente) VALUES ('Novo cliente');

-- Exibe todo o conteudo da tabela Pedidos.
SELECT * FROM Pedidos;