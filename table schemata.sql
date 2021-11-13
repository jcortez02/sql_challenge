-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hEhZRz
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

---- Tried to use the schema provided from this site, but it wouldn't work with pgadmin4 and instead i had to change this code to have the ability to import the csv data. 


CREATE TABLE "departments" (
    "dept_no" Int   NOT NULL,
    "dept_name" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" Int   NOT NULL,
    "emp_no" Int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" Int   NOT NULL,
    "emp_title_id" Varchar(30)   NOT NULL,
    "birth_date" Varchar(30)   NOT NULL,
    "first_name" Varchar(30)   NOT NULL,
    "last_name" Varchar(30)   NOT NULL,
    "sex" Varchar(30)   NOT NULL,
    "hire_date" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" Varchar(30)   NOT NULL,
    "title" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" Int   NOT NULL,
    "salary" Int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" Int   NOT NULL,
    "dept_no" Int   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

