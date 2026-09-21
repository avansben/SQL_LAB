#  SQL Learning Lab

Welcome to an interactive SQL learning environment! This setup provides a local database containing a sample company structure to help you practice reading and writing SQL queries.

##  Quick Start

1. **Start the Environment**:
   ```bash
   docker compose up -d
   ```

## 🌐 Web Interface (GUI)

If you prefer a visual interface over the terminal:
1. Open your browser to: `http://localhost:8080`
2. **Login Details**:
   - **System**: PostgreSQL
   - **Server**: `db`
   - **Username**: `user`
   - **Password**: `password123`
   - **Database**: `company_db`

Click **"SQL command"** in the left sidebar to start writing and running queries immediately.

2. **Run Your First Query**:
   Create a file named `test.sql` with:
   ```sql
   SELECT * FROM employees;
   ```
   Then run it using the helper script:
   ```bash
   chmod +x query.sh
   ./query.sh test.sql
   ```

##  The Database Schema
- `departments`: The company's organizational units.
- `employees`: Staff details, salaries, and their department.
- `projects`: Current company initiatives.
- `employee_projects`: Which employees are working on which projects and for how long.

##  Interactive Learning Path
Try to solve these challenges by creating a `.sql` file for each and running it with `./query.sh`.

### 🟢 Level 1: Basic Retrieval (The "Read" Phase)
- [ ] **Challenge 1**: List all employees' first and last names.
- [ ] **Challenge 2**: Find all employees who earn more than $80,000.
- [ ] **Challenge 3**: List all departments located in 'New York'.

### 🟡 Level 2: Aggregations & Filtering
- [ ] **Challenge 4**: Count how many employees are in each department.
- [ ] **Challenge 5**: Find the average salary of the company.
- [ ] **Challenge 6**: Find the employee with the highest salary.

### 🟠 Level 3: Joins (Connecting Data)
- [ ] **Challenge 7**: List every employee and the name of their department (Join `employees` and `departments`).
- [ ] **Challenge 8**: List all projects and the names of employees working on them (Join `projects`, `employee_projects`, and `employees`).

### 🔴 Level 4: Writing Data (The "Write" Phase)
- [ ] **Challenge 9**: Add a new department called 'Research' in 'Boston'.
- [ ] **Challenge 10**: Give a 10% raise to all employees in the 'Engineering' department.

## 🛑 Shutting Down
To stop the lab:
```bash
docker compose down
```
