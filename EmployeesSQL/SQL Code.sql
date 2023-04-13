-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.department
(
    dept_no character varying(4) NOT NULL,
    dept_name character varying NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS public.department_employee
(
    emp_no character varying NOT NULL,
    dept_no character varying(4) NOT NULL,
    CONSTRAINT department_employee PRIMARY KEY (emp_no)
);

CREATE TABLE IF NOT EXISTS public.salary
(
    "ID" integer,
    emp_no character varying NOT NULL,
    salary integer NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public.titles
(
    title_id character varying(5) NOT NULL,
    title character varying NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS public.department_manager
(
    "ID" integer,
    dept_no character varying(4) NOT NULL,
    emp_no character varying NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public.employees
(
    "ID" integer,
    emp_no character varying NOT NULL,
    emp_title_id character varying NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sex "char",
    hire_date date NOT NULL,
    PRIMARY KEY ("ID")
);
VALID;

END;
ALTER TABLE IF EXISTS public.department_employee
    ADD CONSTRAINT department_employee FOREIGN KEY (dept_no)
    REFERENCES public.department (dept_no) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.salary
    ADD CONSTRAINT department_employee FOREIGN KEY (emp_no)
    REFERENCES public.department_employee (emp_no) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.department_manager
    ADD CONSTRAINT department FOREIGN KEY (dept_no)
    REFERENCES public.department (dept_no) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_department
    ON public.department_manager(dept_no);


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT title FOREIGN KEY (emp_title_id)
    REFERENCES public.titles (title_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT department_employee FOREIGN KEY (emp_no)
    REFERENCES public.department_employee (emp_no) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT 