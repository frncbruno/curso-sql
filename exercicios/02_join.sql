-- Quais clientes assinaram a lista de presença no dia 2025/08/25?

SELECT t1.IdCliente, 
       substr(t1.DtCriacao, 1, 10) AS data,
       t3.DescNomeProduto
       -- COUNT(DISTINCT t1.idCliente) AS qtdClientes 
       -- contar total de clientes que assinaram a lista no dia

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao, 1, 10) = '2025-08-25'
AND DescNomeProduto = 'Lista de presença'

