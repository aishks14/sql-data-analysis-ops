# SQL User Login Analytics Case Study

A complete SQL case study built using Microsoft SQL Server to analyze user login behavior, session activity, engagement trends, retention patterns, and inactive users using advanced SQL concepts such as CTEs, Window Functions, Aggregations, Recursive Queries, and Date Functions.

---

# Project Overview

This project uses two relational tables:

- `users`
- `logins`

to solve multiple real-world SQL business problems involving:

- User retention analysis
- Login streak tracking
- Quarterly session analysis
- Ranking users by session score
- Detecting inactive users
- Identifying missing login dates

---

# 🛠 Tech Stack

- SQL Server / T-SQL
- SQL Server Management Studio (SSMS)
- Window Functions
- Common Table Expressions (CTEs)
- Recursive Queries
- Aggregate Functions
- Date Functions

---

# Database Schema

## users Table

| Column Name | Data Type | Description |
|---|---|---|
| USER_ID | INT | Unique user identifier |
| USER_NAME | VARCHAR(20) | Name of the user |
| USER_STATUS | VARCHAR(20) | Active/Inactive status |

---

## logins Table

| Column Name | Data Type | Description |
|---|---|---|
| USER_ID | INT | Foreign key referencing users table |
| LOGIN_TIMESTAMP | DATETIME | Login date and timestamp |
| SESSION_ID | INT | Unique session identifier |
| SESSION_SCORE | INT | Session activity score |

---

# Data Used

The dataset contains:
- Multiple users
- Login timestamps across multiple months and quarters
- Session scores
- Continuous and non-continuous login patterns

---

# SQL Concepts Covered

This project demonstrates practical usage of:

- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `DATEADD`
- `DATEDIFF`
- `DATEPART`
- `DATETRUNC`
- `CAST`
- `ROW_NUMBER`
- `LAG`
- `CTE`
- Recursive CTE
- Aggregate Functions
- Window Functions
- Subqueries
- Distinct Counts

---

# Business Problems Solved

## Q1: Identify Inactive Users
Find users who have not logged in within the last month.

### Concepts Used
- `DATEADD`
- `GROUP BY`
- `HAVING`
- Subqueries

---

## Q2: Quarterly Session Analysis
Calculate:
- Total sessions per quarter
- Unique users per quarter
- First day of each quarter

### Concepts Used
- `DATEPART`
- `DATETRUNC`
- Aggregations

---

## Q3: Compare User Activity Across Time Periods
Identify users who:
- logged in during March 2026
- but did not log in during November 2025

### Concepts Used
- `BETWEEN`
- `NOT IN`
- Subqueries

---

## Q4: Quarter-over-Quarter Session Growth
Analyze percentage change in session activity between quarters.

### Concepts Used
- `LAG`
- Window Functions
- CTEs

---

## Q5: Top User Per Day
Find the user with the highest session score each day.

### Concepts Used
- `ROW_NUMBER`
- `PARTITION BY`
- CTEs
- Ranking Functions

---

## Q6: Continuous Login Streak Analysis
Identify users who logged in every single day continuously since their first login.

### Concepts Used
- `DATEDIFF`
- `COUNT(DISTINCT)`
- `HAVING`

---

## Q7: Missing Login Dates Detection
Find dates where no users logged into the system.

### Concepts Used
- Recursive CTE
- `DATEADD`
- Date sequence generation

---

# Key Learnings

Through this project, the following analytical SQL skills were practiced:

- Writing optimized analytical queries
- Solving real-world business problems using SQL
- Understanding window functions deeply
- Working with date-based analysis
- Creating recursive queries
- User behavior and retention analysis
- Ranking and aggregation techniques

---

# How to Run the Project

## Create Database
```sql
CREATE DATABASE UsersDB;
USE UsersDB;
```

---

## Create Tables
Run:
- `users` table creation script
- `logins` table creation script

---

## Insert Sample Data
Execute all INSERT statements provided in the SQL file.

---

## Run Queries
Execute each question/query block sequentially inside SSMS.

---

# Project Structure

```text
sql-user-login-analytics/
│
├── README.md
├── users_logins_case_study.sql
└── screenshots/
```

---

# Real-World Applications

This project simulates real analytics use cases such as:

- SaaS product analytics
- User engagement tracking
- Daily active user analysis
- Customer retention analysis
- Streak tracking systems
- Product usage monitoring

---

# Advanced SQL Features Demonstrated

| Feature | Usage |
|---|---|
| CTE | Query simplification |
| Recursive CTE | Date sequence generation |
| LAG | Previous quarter analysis |
| ROW_NUMBER | User ranking |
| Window Functions | Analytical calculations |
| Date Functions | Time-based analysis |

---

# Future Improvements

Possible future enhancements:
- Power BI dashboard integration
- Stored procedures
- SQL optimization
- Indexing strategies
- Parameterized reports
- User segmentation analysis

---

# Closing Note
SQL Analytics Case Study Project created for practicing advanced SQL concepts and real-world analytical problem solving using SQL Server.

---

# Author

Aishwarya Kumar Singh
