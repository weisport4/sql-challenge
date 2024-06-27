-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/T7GRz5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar(25)   NOT NULL,
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employee" (
    "emp_no" SERIAL   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(25)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" Varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "ID" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "title" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(25)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept_manager" (
    "ID" SERIAL   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "salary" (
    "ID" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "salary" FLOAT   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_title" FOREIGN KEY("emp_title")
REFERENCES "title" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

