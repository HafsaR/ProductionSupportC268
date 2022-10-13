USE PersonalTrainer;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows
-- ------------------
SELECT * FROM ExerciseCategory ec
INNER JOIN Exercise e ON ec.ExerciseCategoryId = e.ExerciseCategoryId
;

    
-- Select ExerciseCategory.Name and Exercise.Name
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows
-- ------------------
SELECT 
    ec.name, e.name
FROM
    ExerciseCategory ec
        INNER JOIN
    Exercise e ON ec.ExerciseCategoryId = e.ExerciseCategoryId
WHERE
    ec.ParentCategoryId IS NULL
;


-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows
-- ------------------
SELECT 
    ec.name CategoryName, e.name ExerciseName
FROM
    ExerciseCategory ec
        INNER JOIN
    Exercise e ON ec.ExerciseCategoryId = e.ExerciseCategoryId
WHERE
    ec.ParentCategoryId IS NULL
;


-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows
-- ------------------
SELECT * FROM Client;
SELECT * FROM Login;

SELECT 
    c.FirstName, c.LastName, c.BirthDate, l.EmailAddress
FROM
    Client c
        INNER JOIN
    Login l ON l.ClientId = c.ClientId
WHERE
    YEAR(c.BirthDate) BETWEEN '1990' AND '1999'
;

 
-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows
-- ------------------
SELECT 
    w.Name, c.FirstName, c.LastName
FROM
    Client c
        INNER JOIN
    ClientWorkout cw ON c.ClientId = cw.ClientId
        INNER JOIN
    Workout w USING (WorkoutId)
WHERE
    c.LastName LIKE 'C%'
;

-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.
-- ------------------
SELECT 
    g.name GoalName, w.name WorkoutName
FROM
    WorkOut w
        JOIN
    WorkOutGoal wg ON w.WorkOutId = wg.WorkOutId
        JOIN
    Goal g ON g.GoalId = wg.GoalId
;


-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows
-- ------------------
SELECT 
    c.FirstName, c.LastName, c.BirthDate, l.EmailAddress
FROM
    Client c
        LEFT JOIN
    Login l ON l.ClientId = c.ClientId
;


-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows
-- ------------------
SELECT 
    c.FirstName, c.LastName, c.BirthDate, l.EmailAddress
FROM
    Client c
        LEFT JOIN
    Login l ON l.ClientId = c.ClientId
    WHERE l.EmailAddress IS NULL
;

-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(
-- ------------------
SELECT * FROM Client c
INNER JOIN Login l ON l.ClientId = c.ClientId
WHERE c.FirstName = 'Romeo'
AND c.LastName = 'Seaward'
;

SELECT * FROM Login;


-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows
-- ------------------
SELECT * FROM ExerciseCategory p
JOIN ExerciseCategory c ON p.ExerciseCategoryId = c.ParentCategoryId;


    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows
-- ------------------

SELECT * FROM ExerciseCategory;
SELECT * FROM ExerciseCategory p
LEFT JOIN ExerciseCategory c ON p.ExerciseCategoryId = c.ParentCategoryId;

    
-- Are there Clients who are not signed up for a Workout?
-- 50 rows
-- ------------------
SELECT * FROM Login;

SELECT * FROM ClientWorkout;

SELECT * FROM Client c
LEFT JOIN ClientWorkout cw ON cw.ClientId = c.ClientId
WHERE cw.WorkoutId IS NULL;


-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows
-- ------------------
SELECT * FROM Client c
WHERE c.FirstName = 'Shell'
AND c.LastName = 'Creane';

SELECT * FROM Workout 
WHERE Name LIKE 'B%'
;
SELECT * FROM Goal;


SELECT * FROM Workout w
JOIN Level l ON l.LevelId = w.LevelId
WHERE l.Name = 'Beginner'
;

 -- below is a solution for qctivity
SELECT w.WorkoutId, w.`Name` WorkoutName FROM Client c
JOIN ClientGoal cg ON cg.ClientId = c.ClientId 
JOIN WorkoutGoal wg ON wg.GoalId = cg.GoalId 
JOIN Workout w ON w.WorkoutId = wg.WorkoutId
JOIN Level l ON l.LevelId = w.LevelId
WHERE c.FirstName = 'Shell'
AND c.LastName = 'Creane'
AND l.Name = 'Beginner'
;
-- ////////////

-- Select all Workouts. 
-- Join to the Goal, 'Core Strength', but make it optional.
-- You may have to look up the GoalId before writing the main query.
-- If you filter on Goal.Name in a WHERE clause, Workouts will be excluded.
-- Why?
-- 26 Workouts, 3 Goals
-- ------------------
select * from Workout;

select * from Goal g
WHERE g.Name = 'Core Strength'
;
SELECT * FROM Goal;


SELECT * FROM Workout w
LEFT JOIN WorkoutGoal wg ON wg.WorkoutId = w.WorkoutId AND wg.GoalId = 10
LEFT JOIN Goal g ON g.GoalId = wg.GoalId
-- WHERE g.`Name` = 'Core Strength'
;


-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and ExseIercise.Name for related Workouts and Exercises.
-- ------------------

SELECT w.Name WorkoutName, e.Name ExerciseName FROM Workout w
JOIN WorkoutDay wd ON wd.WorkoutId = w.WorkoutId
JOIN WorkoutDayExerciseInstance wi ON wi.WorkoutDayId = wd.WorkoutDayId
JOIN ExerciseInstance ei ON ei.ExerciseInstanceId = wi.ExerciseInstanceId
JOIN Exercise e ON e.ExerciseId = ei.ExerciseId
;

   
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. 
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values
-- ------------------

SELECT * FROM Exercise WHERE NAME = 'Plank';

SELECT * FROM ExerciseCategory;



SELECT e.Name ExerciseName, eiuv.`value` Value, u.`Name` UnitName FROM Exercise e
JOIN ExerciseInstance ei ON ei.ExerciseId = e.ExerciseId
JOIN ExerciseInstanceUnitValue eiuv ON eiuv.ExerciseInstanceId = ei.ExerciseInstanceId
JOIN Unit u ON u.UnitId = eiuv.UnitId 
WHERE e.`Name` = 'Plank'
;
