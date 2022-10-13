
USE PersonalTrainer;
SELECT * FROM Client
WHERE ClientId="818u7faf-7b4b-48a2-bf12-7a26c92de20c"
;

SELECT count(*) FROM GOAL;

SELECT `Name`, LevelId FROM WORKOUT;

-- activity 7
select Name, LevelId, Notes from Workout where LevelId = 2;

-- activity 8

select FirstName, LastName, City from Client
where City = 'Metairie'
OR
City = 'Kenner'
OR
City = "Gretna"
;

-- activity 9

select FirstName, LastName, BirthDate from Client where YEAR(BirthDate) >= '1980' AND YEAR(BirthDate) <= '1989' ; 


-- Activity 10
select FirstName, LastName, BirthDate from Client where YEAR(BirthDate) between '1980' AND '1989'; 

select FirstName, LastName, BirthDate from Client where YEAR(BirthDate) like '198_%'; 

-- activity 11
SELECT count(*) FROM Login 
WHERE EmailAddress LIKE '%.gov'
;

-- activity 12

SELECT * FROM Login 
WHERE EmailAddress NOT LIKE '%.com'
;

-- activity 13
select FirstName, LastName from Client 
where BirthDate IS NULL;
;

-- activity 14
SELECT * FROM ExerciseCategory where PArentCategoryId is not null;

-- activity 15
SELECT * FROM WORKOUT 
WHERE LevelId = 3
AND Notes LIKE '%you%';

-- Activity 16
SELECT FirstName, LastName, City FROM Client where (LastName Like 'L%' 
OR LastName Like 'M%'
OR LastName Like 'N%')
AND
city = "LaPlace"
;

-- activity 17
SELECT InvoiceId, Description,Price, Quantity, ServiceDate, InvoiceLineItemId, (Price * Quantity) as LineItemTotal
 FROM InvoiceLineItem
 WHERE (Price * Quantity) Between '15' AND '25'
;

-- activity 18 Estrella Bazely
SELECT 
    *
FROM
    `PersonalTrainer`.`Client` c
        LEFT JOIN
    Login l ON c.ClientId = l.ClientId
WHERE
    c.FirstName = 'Estrella'
        AND c.LastName = 'Bazely'
;

-- activity 19

SELECT * FROM PersonalTrainer.Workout w
LEFT JOIN PersonalTrainer.WorkoutGoal wg ON w.WorkoutId = wg.WorkoutId 
LEFT JOIN Goal g ON g.GoalId = wg.GoalId 
WHERE w.Name = 'This Is Parkour'
;

