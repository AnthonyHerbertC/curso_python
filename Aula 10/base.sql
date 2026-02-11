if OBJECT_ID('vwFatoVendas', 'V') IS NOT NULL
    DROP VIEW vwFatoVendas;

exec('
    CREATE VIEW vwFatoVendas AS
    SELECT  
        p.idPedido,
        p.dataPedido,
        c.nomeCliente,
        v.nomeVendedor,
        r.nomeRegiao,
        prod.nomeProduto,
        lp.nomeLinhaProduto,
        ip.prcoUnitario,
        (ip.quantidade * (ip.prcoUnitario - ip.desconto)) as ValorTotal

    FROM pedidos p
    LEFT JOIN clientes c ON p.fkCliente = c.idCliente
    LEFT JOIN vendedores v ON p.fkVendedor = v.idVendedor
    LEFT JOIN regionais r ON v.fkRegional = r.idRegional
    LEFT JOIN itensPedido ip ON p.idPedido = ip.fkPedido
    LEFT JOIN produtos prod ON ip.fkProduto = prod.idProduto
    LEFT JOIN linhaProdutos lp ON p.fkLinhaProduto = lp.idLinhaProduto
')