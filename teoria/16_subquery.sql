-- Exercício apenas com finalidade didática
-- Essa query seria a mesma coisa que usar
-- DtCriacao >= '2025-01-01' AND DtCriacao < '2025-07-01'

SELECT * 

FROM (
    SELECT *
    FROM transacoes
    WHERE DtCriacao >= '2025-01-01'
)

WHERE DtCriacao < '2025-07-01'

