# SQL Task : Subqueries and Nested Queries

## 📌 Task Objective
To practice and demonstrate the use of **subqueries** in SQL, including:
- Scalar subqueries
- Correlated subqueries
- Subqueries in SELECT, WHERE, FROM clauses
- Use with `IN`, `EXISTS`, `=`, and derived tables

## 🛠 Tools Used
- MySQL Workbench
- Sample table: `employees`

## 🗃️ Table Structure

Table: `employees`

| Column         | Type     |
|----------------|----------|
| emp_id         | INTEGER (Primary Key) |
| name           | TEXT     |
| department_id  | INTEGER  |
| salary         | DOUBLE   |

## ✅ What I Learned
- How to use scalar and correlated subqueries effectively
- Difference between `IN`, `EXISTS`, and `=` with subqueries
- How subqueries can filter, return values, or act as virtual tables

## 🧠 Challenges Faced
- Ensuring subqueries return valid types (especially for scalar usage)
- Debugging correlated subqueries due to column reference errors
- Optimizing derived tables for readability and performance
