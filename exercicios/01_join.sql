-- Quais clientes mais perderam pontos por Lover?

SELECT t1.idCliente, 
       t1.idTransacao,
       t2.IdProduto,
       sum(t1.QtdePontos) AS totalPontos,
       t3.DescNomeProduto,
       t3.DescCategoriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.idTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.QtdePontos < 0 
AND t3.DescCategoriaProduto LIKE 'lovers'

GROUP BY idCliente
ORDER BY totalPontos ASC

