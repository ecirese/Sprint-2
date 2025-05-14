
-- Exercici 1
-- Identifica los cinco días que se generó la mayor cantidad de ingresos en la empresa por ventas. 
-- Muestra la fecha de cada transacción junto con el total de las ventas.

SELECT DATE(timestamp) AS fecha, -- The DATE() function extracts the date part from a datetime expression.
       SUM(amount) AS total_ventas
FROM transaction
GROUP BY fecha
ORDER BY total_ventas DESC
LIMIT 5;

-- Exercici 2
-- Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà

SELECT company.country, AVG (transaction.amount) as Venta_media
FROM company
JOIN transaction ON company.id = transaction.company_id
GROUP BY company.country
ORDER BY Venta_media desc;


-- Exercici 3
-- En tu empresa, se plantea un nuevo proyecto para lanzar algunas campañas publicitarias para hacer competencia a la compañía "Non Institute". 
-- Para ello, te piden la lista de todas las transacciones realizadas por empresas que están ubicadas en el mismo país que esta compañía

-- con join
SELECT transaction.id, company.company_name
FROM company
JOIN transaction ON company.id = transaction.company_id
WHERE company.country = ( SELECT country
FROM company 
WHERE company_name = 'Non Institute');

-- con subqueries
SELECT transaction.id, 
       (SELECT company.company_name
        FROM company 
        WHERE company.id = transaction.company_id) AS company_name
FROM transaction 
WHERE transaction.company_id IN (
    SELECT id
    FROM company
    WHERE country = (
        SELECT country
        FROM company
        WHERE company_name = 'Non Institute'));



-- Mostra el llistat aplicant JOIN i subconsultes.
-- Mostra el llistat aplicant solament subconsultes.