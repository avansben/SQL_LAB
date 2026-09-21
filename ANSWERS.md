# 🔑 SQL Lab Answer Sheet

This guide provides hints and solutions for the challenges in the learning path. Try to use the hints first before looking at the full answers!

---

## 🟢 Level 1: Basic Retrieval

### Challenge 1: List all employees' first and last names.
- **Hint**: Use `SELECT` to specify the columns you want and `FROM` to specify the table.
- **Answer**:
  ```sql
  SELECT first_name, last_name FROM employees;
  ```

### Challenge 2: Find all employees who earn more than $80,000.
- **Hint**: Use the `WHERE` clause to filter results based on a condition.
- **Answer**:
  ```sql
  SELECT * FROM employees WHERE salary > 80000;
  ```

### Challenge 3: List all departments located in 'New York'.
- **Hint**: Similar to Challenge 2, use `WHERE` with a string comparison (remember to use single quotes).
- **Answer**:
  ```sql
  SELECT * FROM departments WHERE location = 'New York';
  ```

---

## 🟡 Level 2: Aggregations & Filtering

### Challenge 4: Count how many employees are in each department.
- **Hint**: Use the `COUNT()` function and the `GROUP BY` clause to group employees by their department ID.
- **Answer**:
  ```sql
  SELECT dept_id, COUNT(*) as employee_count 
  FROM employees 
  GROUP BY dept_id;
  ```

### Challenge 5: Find the average salary of the company.
- **Hint**: Use the `AVG()` aggregate function on the salary column.
- **Answer**:
  ```sql
  SELECT AVG(salary) as average_salary FROM employees;
  ```

### Challenge 6: Find the employee with the highest salary.
- **Hint**: Sort the results using `ORDER BY` in descending order and use `LIMIT 1` to get only the top result.
- **Answer**:
  ```sql
  SELECT * FROM employees 
  ORDER BY salary DESC 
  LIMIT 1;
  ```

---

## 🟠 Level 3: Joins (Connecting Data)

### Challenge 7: List every employee and the name of their department.
- **Hint**: Use an `INNER JOIN` to connect the `employees` table to the `departments` table using the `dept_id` column.
- **Answer**:
  ```sql
  SELECT e.first_name, e.last_name, d.dept_name 
  FROM employees e 
  JOIN departments d ON e.dept_id = d.dept_id;
  ```

### Challenge 8: List all projects and the names of employees working on them.
- **Hint**: This requires a "three-way join". Connect `projects` $\rightarrow$ `employee_projects` $\rightarrow$ `employees`.
- **Answer**:
  ```sql
  SELECT p.proj_name, e.first_name, e.last_name 
  FROM projects p 
  JOIN employee_projects ep ON p.proj_id = ep.proj_id 
  JOIN employees e ON ep.emp_id = e.emp_id;
  ```

---

## 🔴 Level 4: Writing Data (The "Write" Phase)

### Challenge 9: Add a new department called 'Research' in 'Boston'.
- **Hint**: Use the `INSERT INTO` statement.
- **Answer**:
  ```sql
  INSERT INTO departments (dept_name, location) 
  VALUES ('Research', 'Boston');
  ```

### Challenge 10: Give a 10% raise to all employees in the 'Engineering' department.
- **Hint**: Use the `UPDATE` statement. You can use a subquery in the `WHERE` clause to find the `dept_id` for 'Engineering'.
- **Answer**:
  ```sql
  UPDATE employees 
  SET salary = salary * 1.1 
  WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'Engineering');
  ```
