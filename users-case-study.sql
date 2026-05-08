use UsersDB;

-- Creating table users 
CREATE TABLE users (
    USER_ID INT PRIMARY KEY,
    USER_NAME VARCHAR(20) NOT NULL,
    USER_STATUS VARCHAR(20) NOT NULL
);

-- Creating table logins
CREATE TABLE logins (
    USER_ID INT,
    LOGIN_TIMESTAMP DATETIME NOT NULL,
    SESSION_ID INT PRIMARY KEY,
    SESSION_SCORE INT,
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

-- Inserting data into users table
INSERT INTO USERS VALUES (1, 'Alice', 'Active');
INSERT INTO USERS VALUES (2, 'Bob', 'Inactive');
INSERT INTO USERS VALUES (3, 'Charlie', 'Active');
INSERT INTO USERS  VALUES (4, 'David', 'Active');
INSERT INTO USERS  VALUES (5, 'Eve', 'Inactive');
INSERT INTO USERS  VALUES (6, 'Frank', 'Active');
INSERT INTO USERS  VALUES (7, 'Grace', 'Inactive');
INSERT INTO USERS  VALUES (8, 'Heidi', 'Active');
INSERT INTO USERS VALUES (9, 'Ivan', 'Inactive');
INSERT INTO USERS VALUES (10, 'Judy', 'Active');

-- Inserting data into logins table
INSERT INTO LOGINS VALUES (1, '2025-07-15 09:30:00', 1001, 85);
INSERT INTO LOGINS VALUES (2, '2025-07-22 10:00:00', 1002, 90);
INSERT INTO LOGINS VALUES (3, '2025-08-10 11:15:00', 1003, 75);
INSERT INTO LOGINS VALUES (4, '2025-08-20 14:00:00', 1004, 88);
INSERT INTO LOGINS VALUES (5, '2025-09-05 16:45:00', 1005, 82);

INSERT INTO LOGINS VALUES (6, '2025-10-12 08:30:00', 1006, 77);
INSERT INTO LOGINS VALUES (7, '2025-11-18 09:00:00', 1007, 81);
INSERT INTO LOGINS VALUES (8, '2025-12-01 10:30:00', 1008, 84);
INSERT INTO LOGINS VALUES (9, '2025-12-15 13:15:00', 1009, 79);

INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (1, '2026-02-14 08:25:30', 1011, 86);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (2, '2026-03-03 10:40:15', 1012, 89);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (3, '2026-01-28 12:10:45', 1013, 78);

INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (4, '2026-03-01 14:30:00', 1014, 91);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (5, '2026-03-15 16:00:00', 1015, 83);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (6, '2026-04-12 08:00:00', 1016, 80);

INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (7, '2026-04-05 09:55:10', 1017, 82);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (8, '2026-02-20 11:35:50', 1018, 87);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (9, '2026-03-18 13:20:05', 1019, 76);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (10, '2026-01-22 15:10:25', 1010, 92);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (10, '2026-04-30 16:45:40', 1020, 93);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (10, '2026-02-11 14:05:55', 1021, 92);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (10, '2026-03-27 15:50:35', 1022, 93);

INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (1, '2026-01-09 07:20:10', 1101, 86);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (3, '2026-04-02 09:15:25', 1102, 89);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (5, '2026-02-06 11:45:00', 1103, 78);

INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (2, '2025-11-10 07:45:00', 1201, 82);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (4, '2025-11-25 09:30:00', 1202, 84);
INSERT INTO LOGINS (USER_ID, LOGIN_TIMESTAMP, SESSION_ID, SESSION_SCORE) VALUES (6, '2025-11-15 11:00:00', 1203, 80);


-- SQL complete case study with the use of users database and 2 tables - `users` and `logins`

    -- SQL query to get all the users data stored inside the `users` table
    select * from users;

    -- SQL query to get all the data stored inside the `logins` table
    select * from logins;

    -- Show all Schemas in Database
    SELECT name AS SchemaName
    FROM sys.schemas;

    -- Show Tables with their Schema
    SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES;

    -- Show Schema of a Specific Table
    SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = 'LOGINS';

    -- Show Table Structure (Columns + Data Types)
    SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'LOGINS';

    -- Quick shortcut
    EXEC sp_help 'LOGINS';

    ------------------------------------------------------------------------------------------------------
    -- Q1: Get the list of users who have not logged in since last one month.
        -- STEP 1: Get the date of two months back from today.
        select * , DATEADD(MONTH, -1, GETDATE()) as "BACK_DATE"
        from logins;

        -- STEP 2: Get the details of the logins dated before 1 month
            -- Method 1 : Using direct query that contains group by and having clause
            select USER_ID, MAX(LOGIN_TIMESTAMP) as LOGIN_TIMESTAMP
            from logins
            group by USER_ID
            having MAX(LOGIN_TIMESTAMP) < DATEADD(MONTH, -1, GETDATE());

            -- Method 2: Select query with distinct clause and a sub query
            select distinct USER_ID from logins where USER_ID not in
            (select USER_ID 
            from logins
            where LOGIN_TIMESTAMP > DATEADD(MONTH, -1, GETDATE()));
            
    ------------------------------------------------------------------------------------------------------
    -- Q2: For the business units quarterly analysis, calculate how many sessions were at each quarter.
        -- order by quarter from newest to oldest
        -- Return : first day of the quarter, user_cnt, session_cnt
            -- STEP 1 : Get the quarter number
            select *, DATEPART(QUARTER, LOGIN_TIMESTAMP) as QUARTER_NUMBER
            from logins;

            -- STEP 2: Total sessions in each quarter
            select DATEPART(QUARTER, LOGIN_TIMESTAMP) as QUARTER_NUMBER, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP);

            -- STEP 3: Total sessions in each quarter along with the first login date of each quarter
            select DATEPART(QUARTER, LOGIN_TIMESTAMP) as QUARTER_NUMBER, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT,
            MIN(LOGIN_TIMESTAMP) as QUARTER_FIRST_LOGIN
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP);

            -- STEP 4: Total sessions in each quarter along with the first login date of each quarter and adding the starting date of each quarter in the data
            select DATEPART(QUARTER, LOGIN_TIMESTAMP) as QUARTER_NUMBER, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT,
            MIN(LOGIN_TIMESTAMP) as QUARTER_FIRST_LOGIN,
            DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as FIRST_QUARTER_DATE
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP);

            -- STEP 4: Refined query as per the requirement
            select DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as FIRST_QUARTER_DATE, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP);

            -- STEP 4: (Optional) Getting same details as previous queries but month wise
            select DATEPART(MONTH, LOGIN_TIMESTAMP) as MONTH_NUMBER, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT,
            MIN(LOGIN_TIMESTAMP) as MONTH_FIRST_LOGIN
            from logins
            group by DATEPART(MONTH, LOGIN_TIMESTAMP);

    ------------------------------------------------------------------------------------------------------
    -- Q3: Display user id's that logged-in in March 2026 and did not log-in in November 2025  
        -- Return: USER_ID
            -- STEP 1: Get the users logged-in in March 2026
            select * FROM logins 
            where LOGIN_TIMESTAMP between '2026-03-01' and '2026-03-31';

            -- STEP 2: Get the users logged-in in November 2025
            select * FROM logins 
            where LOGIN_TIMESTAMP between '2025-11-01' and '2025-11-30';

            -- STEP 3: Get the users who logged-in in March 2026 but did not log-in in November 2025
            select distinct * FROM logins 
            where LOGIN_TIMESTAMP between '2026-03-01' and '2026-03-31'
            and USER_ID not in (select USER_ID FROM logins 
            where LOGIN_TIMESTAMP between '2025-11-01' and '2025-11-30');

            -- STEP 4: Refined query of STEP 3 as per the requirement
            select distinct USER_ID FROM logins 
            where LOGIN_TIMESTAMP between '2026-03-01' and '2026-03-31'
            and USER_ID not in (select USER_ID FROM logins 
            where LOGIN_TIMESTAMP between '2025-11-01' and '2025-11-30');

    ------------------------------------------------------------------------------------------------------

    -- Q4: Add to the query from 2 the percentage change in sessions from last quarter
        -- Return: First day of the quarter, session_cnt, session_cnt_prev, session_percent_change
            -- STEP 1: Get the final query from Q2
            select DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as FIRST_QUARTER_DATE, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP)
            order by FIRST_QUARTER_DATE;

            -- STEP 2: get previous quarter session counts
            with cte as (
            select DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as FIRST_QUARTER_DATE, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP))
            
            select * , LAG(SESSION_CNT, 1) over(order by FIRST_QUARTER_DATE) as PREV_SESSION_CNT
            from cte;

            -- STEP 3: get previous quarter session counts along with the percentage change in sessions
            with cte as (
            select DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as FIRST_QUARTER_DATE, 
            COUNT(*) as SESSION_CNT,
            COUNT(distinct USER_ID) as USER_CNT
            from logins
            group by DATEPART(QUARTER, LOGIN_TIMESTAMP))
            
            select * , LAG(SESSION_CNT, 1) over(order by FIRST_QUARTER_DATE) as PREV_SESSION_CNT, 
            (SESSION_CNT - (LAG(SESSION_CNT, 1) over(order by FIRST_QUARTER_DATE))) * 100.0 / (LAG(SESSION_CNT, 1) over(order by FIRST_QUARTER_DATE)) as SESSION_PERCENT_CHANGE
            from cte;

    ------------------------------------------------------------------------------------------------------

    -- Q5: Display the user that had the highest session score (max) for each day
    -- Return: Date, user_id, score 

        -- STEP 1:
        select USER_ID, CAST(LOGIN_TIMESTAMP as date) as LOGIN_DATE, 
        SUM(SESSION_SCORE) as SCORE
        from logins
        group by USER_ID, CAST(LOGIN_TIMESTAMP as date);

        -- STEP 2: added order by
        select USER_ID, CAST(LOGIN_TIMESTAMP as date) as LOGIN_DATE, 
        SUM(SESSION_SCORE) as SCORE
        from logins
        group by USER_ID, CAST(LOGIN_TIMESTAMP as date)
        order by CAST(LOGIN_TIMESTAMP as date), SCORE

        -- STEP 3: final query
        with cte as (
            select USER_ID, CAST(LOGIN_TIMESTAMP as date) as LOGIN_DATE, 
            SUM(SESSION_SCORE) as SCORE
            from logins
            group by USER_ID, CAST(LOGIN_TIMESTAMP as date)
        )
        select * from (
            select *, ROW_NUMBER() over (partition by LOGIN_DATE order by SCORE desc) as USER_RANK
            from cte
        ) a
        where USER_RANK = 1;

        -- The query first aggregates session scores per user per date using a CTE. 
        -- Then ROW_NUMBER with PARTITION BY assigns rankings within each date group based on score, 
        -- and finally the top-ranked user for each date is selected.
    ------------------------------------------------------------------------------------------------------
