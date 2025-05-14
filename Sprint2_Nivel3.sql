-- Nivel 3
-- Ejercicio 1. Presenta el nombre, teléfono, país, fecha y amount, de aquellas empresas que realizaron transacciones con un valor comprendido entre 100 y 200 euros
-- y en alguna de estas fechas: 29 de abril de 2021, 20 de julio de 2021 y 13 de marzo de 2022. Ordena los resultados de mayor a menor cantidad.

SELECT company_name, phone, country, amount, date(timestamp) as Date
FROM company
JOIN transaction ON company.id = transaction.company_id
AND DATE(transaction.timestamp) IN ('2021-04-29', '2021-07-20', '2022-03-13')
ORDER BY transaction.amount DESC;

-- Ejercicio 2
-- Necesitamos optimizar la asignación de los recursos y dependerá de la capacidad operativa que se requiera,
-- por lo que te piden la información sobre la cantidad de transacciones que realizan las empresas,
-- pero el departamento de recursos humanos es exigente y quiere un listado de las empresas donde especifiques si tienen más de 4 o menos transacciones.

SELECT company_name, COUNT(transaction.id) as Transacciones_totales, 
  CASE -- función crear columnas calculadas condicionalmente.
        WHEN COUNT(transaction.id) > 4 THEN 'Más de 4'
        ELSE 'Menos de 4'
    END AS Clasificación
FROM company
LEFT JOIN transaction ON company.id = transaction.company_id -- LEFT JOIN Muestra todas las empresas, aunque no tengan transacciones. Si una empresa no tiene transacciones, será 0.
GROUP BY 1;

-- Code
-- CASE
-- WHEN <condition> THEN <value>,
-- WHEN <other condition> THEN <value>
-- ELSE <value>
-- END AS <column name>