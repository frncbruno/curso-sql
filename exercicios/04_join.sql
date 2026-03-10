-- Clientes mais antigos, tem mais frequência de transação?

SELECT t1.idCliente, 
       substr(t1.DtCriacao, 1, 10) AS data,
       sum(t2.QtdePontos) AS QtdePontosTotal

FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.IdCliente

WHERE t2.QtdePontos > 0

GROUP BY t1.idCliente, t2.DtCriacao
ORDER BY sum(t2.QtdePontos) DESC

LIMIT 15

