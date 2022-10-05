-- zombieland=# SELECT * FROM zombies;
--  id |  name  |  type   
-- ----+--------+---------
--   1 | Romero | generic
--   2 | Boyle  | runner
--   3 | Raimi  | deadite
--   4 | Newell | boomer
-- (4 rows)
-----------------------------------------------------------------
-- zombieland=# SELECT * FROM victims;
--  id |   name   | run_speed 
-- ----+----------+-----------
--   1 | Rick     |        12
--   2 | Maggie   |        11
--   3 | Michonne |        15
--   4 | Glenn    |        30
-- (4 rows)
-----------------------------------------------------------------
-- zombieland=# SELECT * FROM bitings;
--  id | victim_id | zombie_id | infected_on 
-- ----+-----------+-----------+-------------
--   1 |         1 |         1 | 2018-03-27
--   2 |         2 |         2 | 2018-03-29
--   3 |         3 |         4 | 2018-03-30
--   4 |         3 |         1 | 2018-03-30
-- (4 rows)
-----------------------------------------------------------------

-- Why is there a dot after victims?
-- STEP 1
-- SELECT victims.* FROM victims
--  id |   name   | run_speed 
-- ----+----------+-----------
--   1 | Rick     |        12
--   2 | Maggie   |        11
--   3 | Michonne |        15
--   4 | Glenn    |        30
-- (4 rows)

-- STEP 2
-- SELECT victims.* FROM victims
-- INNER JOIN bitings
-- ON bitings.victim_id = victims.id;

-- Joins Victims and bitings this is now the left table
-- Michone bitten by 2 zombies
--  id |   name   | run_speed 
-- ----+----------+-----------
--   1 | Rick     |        12
--   2 | Maggie   |        11
--   3 | Michonne |        15
--   3 | Michonne |        15
-- (4 rows)

-- STEP 3
-- SELECT victims.* FROM victims
-- INNER JOIN bitings
-- ON bitings.victim_id = victims.id
-- INNER JOIN zombies
-- ON zombies.id = bitings.zombie_id;

-- -- THIS STILL SHOWS THE SAME INFO BUT NO ERRORS MEANS JOIN SUCCESSFUL
-- id |   name   | run_speed 
-- ----+----------+-----------
--   1 | Rick     |        12
--   2 | Maggie   |        11
--   3 | Michonne |        15
--   3 | Michonne |        15
-- (4 rows)

--STEP 4
SELECT victims.name, zombies.name, bitings.infected_on FROM victims
INNER JOIN bitings
ON bitings.victim_id = victims.id
INNER JOIN zombies
ON zombies.id = bitings.zombie_id

--    name   |  name  | infected_on 
-- ----------+--------+-------------
--  Rick     | Romero | 2018-03-27
--  Maggie   | Boyle  | 2018-03-29
--  Michonne | Newell | 2018-03-30
--  Michonne | Romero | 2018-03-30
-- (4 rows)
