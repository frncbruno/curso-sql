-- Como foi a curva de Churn do Curso de SQL?

-- ALTERNATIVA 1 
-- SELECT
--         substr(DtCriacao, 1, 10) AS dtDia,
--         COUNT(DISTINCT idCliente) AS qtdClientes

-- FROM transacoes

-- WHERE DtCriacao >= '2025-08-25' AND DtCriacao < '2025-08-30' 

-- GROUP BY dtDia

WITH tb_clientes_dia1 AS (
SELECT DISTINCT IdCliente

FROM transacoes 

WHERE DtCriacao >= '2025-08-25' AND DtCriacao < '2025-08-26'
)

SELECT t1.idCliente, 
       substr(t2.DtCriacao, 1, 10) AS dtDia, 
       COUNT(DISTINCT t2.idCliente) AS qtdClientes,
       1.*COUNT(DISTINCT t1.idCliente) / (SELECT COUNT(*) FROM tb_clientes_dia1) AS pctRetencao,
       1 - 1.* COUNT(DISTINCT t1.idCliente) / (SELECT COUNT(*) FROM tb_clientes_dia1) AS pctChurn

FROM tb_clientes_dia1 AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.IdCliente

WHERE t2.DtCriacao >= '2025-08-25' AND t2.DtCriacao < '2025-08-30'
GROUP BY dtDia
