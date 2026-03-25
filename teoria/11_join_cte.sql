-- 11. Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?

WITH tb_primeiro_dia AS (

      SELECT DISTINCT IdCliente
      FROM transacoes
      WHERE substr(dtCriacao, 1, 10) = '2025-08-25'
      -- começou o curso no primeiro dia
),

tb_dias_curso AS (

        SELECT DISTINCT IdCliente, 
        substr(dtCriacao, 1, 10) AS presenteDia
        
        FROM transacoes
        WHERE dtCriacao >= '2025-08-25'
        AND dtCriacao < '2025-08-30'
        -- contando quantas vezes quem participou do curso no primeiro dia, esteve presente nos outros dias do curso

        ORDER BY IdCliente, presenteDia
),

tb_clientes_dias AS (

SELECT t1.IdCliente, 
       COUNT (DISTINCT t2.presenteDia) AS qtdeDiasCurso
FROM tb_primeiro_dia AS t1

LEFT JOIN tb_dias_curso AS t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente
ORDER BY qtdeDiasCurso DESC

-- aqui, para cada cliente que iniciou o curso no primeiro dia, contamos quantos dias ele esteve presente durante o curso, e depois calculamos a média desses dias para obter a resposta final.

) 

SELECT CAST(AVG(qtdeDiasCurso) AS DOUBLE) AS mediaDiasCurso, 
      MAX (qtdeDiasCurso),
      MIN (qtdeDiasCurso)
FROM tb_clientes_dias

-- O resultado da consulta será a média de dias que os clientes que iniciaram o curso no primeiro dia estiveram presentes durante o curso.
-- Utilizei a função cast para garantir que o resultado seja retornado como um número decimal, permitindo uma média mais precisa.
