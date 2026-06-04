# data-quality
# Решение тестового задания для стажировки
**СУБД:** PostgreSQL, pgAdmin 4

## Описание

В этом репозитории представлены решения 5 задач по SQL. 
Каждая задача включает создание тестовых таблиц, наполнение данными и написание запросов для проверки целостности, поиска дубликатов, валидации и анализа продаж. В файлах этого проекта содержатся решение задач, которые необходимо скопировать в pgAdmin для их выполнения.

## Как запустить
   ```sql
1. Установите PostgreSQL и откройте pgAdmin.
2. Выполните скрипты создания таблиц и вставки данных.
3. Выполните SQL-запросы для решения задач.
```
## Задание 1
- Был использован EXTRACT для извлечения из даты - дней месяца.
- Фильтр `updated_at < CURRENT_TIMESTAMP - INTERVAL '7 days'` более надёжен, чем расчёт дней, так как учитывает часы и не зависит от округления.

<img width="974" height="664" alt="image" src="https://github.com/user-attachments/assets/484a7cad-3a30-49d7-ad04-53960a9e0918" />

Рис. №1. Заказы со статусом 'shipped', у которых дата последнего обновления ( updated_at ) не менялась более 7 дней.

## Задание 2
- Вычисление NULL для каждого столбца через `CASE` внутри CTE.

<img width="974" height="996" alt="image" src="https://github.com/user-attachments/assets/aebfde38-62d7-4018-ab7e-592f52f48e3c" />

Рис. №2. Вычисление общего числа строк, количества NULL-значений и процента заполненности.

## Задание 3
### Задание 3.1. 
- На скриншотах показана вся таблица с данными и таблица после выполнения запроса, где показаны количество дубликатов, его sku, минимальный и максимальный product_id.

<img width="974" height="303" alt="image" src="https://github.com/user-attachments/assets/613b4994-55f5-463f-ba7e-b42248985869" />

Рис. №3. Исходная таблица

<img width="974" height="896" alt="image" src="https://github.com/user-attachments/assets/dde6c4d7-b9fe-447c-bc74-15ca6cd1aa15" />

Рис. №4. Группы дубликатов по полю sku.

### Задание 3.2. 
- После удаления дубликатов, заданная таблица содержит следующие строки.

<img width="974" height="137" alt="image" src="https://github.com/user-attachments/assets/32fc0f1b-4e70-4388-891f-f416d6e29eb8" />

Рис. №5. Таблица после удаления дубликатов.

## Задание 4
- Текущие данные в таблице. После выполнения запроса видно, в каких строках содержатся некорректные для заданных условий данные.
- `CONCAT_WS` объединяет только не-NULL значения через запятую.
- В `WHERE` отбираем строки, где хотя бы одна ошибка.

<img width="974" height="223" alt="image" src="https://github.com/user-attachments/assets/0d2df412-8813-4f8e-9afb-699bb12848d4" />

Рис. №6. Исходная таблица с данными.

<img width="974" height="296" alt="image" src="https://github.com/user-attachments/assets/61b682a3-0f71-46db-a417-02268207208d" />

Рис. №7. Подходящие по условию данные.

## Задание 5
### Задание 5.1
- `COALESCE` на случай, если продаж в этот день не было (тогда `daily_sales = 0`).

<img width="974" height="382" alt="image" src="https://github.com/user-attachments/assets/fb2897b4-aca8-497f-b2cb-e3f57a2c4c5f" />

Рис. №8. Данные таблицы order_sales.

<img width="749" height="373" alt="image" src="https://github.com/user-attachments/assets/928e3174-7468-4732-812f-2de1b254f192" />

Рис. №9. Данные таблицы inventory_snapshots.

После выполнения запроса, получаем данные:

<img width="853" height="264" alt="image" src="https://github.com/user-attachments/assets/d3c314a4-5ce6-4c67-8113-76de9525d3d0" />

Рис. №10. Данные, у которых суммарное списанное количество по завершённым заказам ( status = 'completed' ) за конкретную дату превышает остаток на складе на ту же дату.

### Задание 5.2

<img width="974" height="227" alt="image" src="https://github.com/user-attachments/assets/88ec35ce-7f78-4471-83ea-e38404b563e6" />

Рис. №11. Группа, где разница между ( stock_qty - daily_sales ) - отрицательная.
