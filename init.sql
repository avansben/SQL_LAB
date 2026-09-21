-- Sample Data for SQL Lab
-- Setup Departments
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- Setup Employees
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE DEFAULT CURRENT_DATE,
    salary DECIMAL(10, 2),
    dept_id INTEGER REFERENCES departments(dept_id)
);

-- Setup Projects
CREATE TABLE projects (
    proj_id SERIAL PRIMARY KEY,
    proj_name VARCHAR(100) NOT NULL,
    budget DECIMAL(15, 2),
    start_date DATE
);

-- Setup Employee-Project Mapping (Many-to-Many)
CREATE TABLE employee_projects (
    emp_id INTEGER REFERENCES employees(emp_id),
    proj_id INTEGER REFERENCES projects(proj_id),
    hours_worked INTEGER,
    PRIMARY KEY (emp_id, proj_id)
);

-- Insert Sample Data
INSERT INTO departments (dept_name, location) VALUES
('Engineering', 'New York'),
('Marketing', 'San Francisco'),
('Sales', 'Chicago'),
('HR', 'Austin');

INSERT INTO employees (first_name, last_name, email, hire_date, salary, dept_id) VALUES
('Alice', 'Smith', 'alice@company.com', '2020-01-15', 85000, 1),
('Bob', 'Johnson', 'bob@company.com', '2021-03-22', 72000, 1),
('Charlie', 'Brown', 'charlie@company.com', '2019-07-10', 95000, 2),
('Diana', 'Prince', 'diana@company.com', '2022-11-05', 60000, 3),
('Ethan', 'Hunt', 'ethan@company.com', '2018-05-12', 110000, 1),
('Fiona', 'Gallagher', 'fiona@company.com', '2023-02-01', 55000, 4),
('George', 'Costanza', 'george@company.com', '2015-10-20', 45000, 3);

INSERT INTO projects (proj_name, budget, start_date) VALUES
('Cloud Migration', 500000, '2023-01-01'),
('Brand Refresh', 150000, '2023-06-01'),
('Q4 Sales Push', 80000, '2023-10-01'),
('Employee Portal', 200000, '2024-01-01');

INSERT INTO employee_projects (emp_id, proj_id, hours_worked) VALUES
(1, 1, 120), (1, 4, 40),
(2, 1, 150), (2, 4, 20),
(3, 2, 200),
(4, 3, 100),
(5, 1, 300), (5, 4, 100),
(6, 4, 80),
(7, 3, 150);
