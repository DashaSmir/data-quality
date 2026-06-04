With validation As(
	SELECT
		txn_id,
		CASE WHEN amount <= 0 THEN 'amount - меньше или равен нулю' END AS error_of_amount,
		CASE WHEN currency NOT IN ('USD' , 'EUR' , 'RUB' , 'CNY') THEN 'Неверный формат currency' END AS error_of_currency,
		CASE WHEN txn_type NOT IN ('debit' , 'credit' , 'refund') THEN 'Неверный формат txn_type' END AS error_of_txn_type,
		CASE WHEN txn_date > CURRENT_DATE THEN 'Неверный формат txn_date' END AS error_of_txn_date
	FROM transactions		
)
SELECT
	txn_id,
	CONCAT_WS(', ', error_of_amount, error_of_currency, error_of_txn_type, error_of_txn_date) AS errors
FROM validation
WHERE
	error_of_amount IS NOT NULL OR
	error_of_currency IS NOT NULL OR
	error_of_txn_type IS NOT NULL OR
	error_of_txn_date IS NOT NULL;
