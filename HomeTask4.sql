-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA 

-- Создаём базу данных
DROP DATABASE IF EXISTS HomeTask4;
CREATE DATABASE HomeTask4;
USE HomeTask4;

-- Создаём таблицу AUTO
CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

-- Заполняем таблицу AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES (111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
       (111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
       (111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
       (111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
	   (111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
       (111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
       (111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
       (111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
       (111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT *
  FROM AUTO;
  
-- Выполняем задание (вывести на экран сколько машин каждого цвета для машин марок BMW и LADA)

-- Выводим на экран количество машин BMW и LADA зеленого цвета
SELECT COUNT(REGNUM) AS 'GREEN_COUNT'
  FROM AUTO
WHERE MARK IN ('BMW', 'LADA') AND COLOR = 'ЗЕЛЕНЫЙ';

-- Выводим на экран количество машин BMW и LADA красного цвета
SELECT COUNT(REGNUM) AS 'RED_COUNT'
  FROM AUTO
WHERE MARK IN ('BMW', 'LADA') AND COLOR = 'КРАСНЫЙ';

-- Выводим на экран количество машин BMW и LADA синего цвета
SELECT COUNT(REGNUM) AS 'BLUE_COUNT'
  FROM AUTO
WHERE MARK IN ('BMW', 'LADA') AND COLOR = 'СИНИЙ';


-- Задание №2. Вывести на экран марку авто и количество AUTO не этой марки

-- Выводим на экран количество авто марки не BMW
SELECT COUNT(MARK) AS 'NOT BMW'
  FROM AUTO
WHERE NOT MARK = 'BMW';

-- Выводим на экран количество авто марки не LADA
SELECT COUNT(MARK) AS 'NOT LADA'
  FROM AUTO
WHERE NOT MARK = 'LADA';

-- Выводим на экран количество авто марки не AUDI
SELECT COUNT(MARK) AS 'NOT AUDI'
  FROM AUTO
WHERE NOT MARK = 'AUDI';

-- Выводим на экран количество авто марки не VOLVO
SELECT COUNT(MARK) AS 'NOT VOLVO'
  FROM AUTO
WHERE NOT MARK = 'VOLVO';


/* Задание №3. Напишите запрос, который вернет строки из таблицы test_a, 
id которых нет в таблице test_b, НЕ используя ключевого слова NOT. */

-- Даны 2 таблицы, созданные следующим образом:

create table test_a (id INT, data VARCHAR(1));
create table test_b (id INT);

insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

-- Выполнение задания
SELECT test_a.id, test_a.data
  FROM test_a
  LEFT JOIN test_b
    ON test_a.id = test_b.id
WHERE test_b.id IS NULL;
