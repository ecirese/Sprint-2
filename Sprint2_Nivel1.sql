-- Exercici 2. Utilitzant JOIN realitzaràs les següents consultes:

-- 1. Países que están haciendo compras:
SELECT DISTINCT company.country
FROM company 
JOIN transaction ON company.id = transaction.company_id; -- Si figura en la tabla transaction, implica que los países tienen transacciones realizadas

-- 2. Número de países compradores:
SELECT COUNT(DISTINCT company.country) AS Paises_compradores
FROM company
JOIN transaction ON company.id = transaction.company_id;

-- 3. Empresa con la media más alta de ventas:
SELECT company.company_name, company.id, AVG(transaction.amount) AS media_ventas
FROM company
JOIN transaction ON company.id = transaction.company_id
GROUP BY company.company_name, company.id
ORDER BY media_ventas DESC
LIMIT 1;

-- Exercici 3. Utilitzant només subconsultes (sense utilitzar JOIN):
-- Mostra totes les transaccions realitzades per empreses d'Alemanya.

SELECT id, company_id, amount, timestamp
FROM transaction
WHERE company_id IN (
	SELECT id
    FROM company
    WHERE country = 'Germany');
 
-- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.

SELECT company_name, id
FROM company
WHERE id IN (
    SELECT company_id
    FROM transaction
    WHERE amount > (
        SELECT AVG(amount)
        FROM transaction));

-- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.

SELECT company_name, id 
FROM company
WHERE id NOT IN (
    SELECT company_id
    FROM transaction);