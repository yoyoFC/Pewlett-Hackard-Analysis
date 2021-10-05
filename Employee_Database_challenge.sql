--Module 7 Challenge

/* Deliverable 1 */

--Createing retirenment info table 
--Select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date 
--into retirenment_titles
--from employees e
--inner join titles ti
--on e.emp_no = ti.emp_no
--where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--order by emp_no ASC

--Creating unique titles table
--Select Distinct on (emp_no) emp_no, first_name, last_name, title
--into unique_titles
--from retirenment_titles 
--order by emp_no,to_date DESC

--Creating retiring titles 
--Select Count(emp_no) as count, title 
--into retiring_titles
--from unique_titles 
--group by title order by count desc

/* Deliverable 2 */

--Create mentorship elegibility table
--Select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date , ti.title, gender
--into mentorship_eligibilty
--from employees e 
--inner join dept_emp de
--on e.emp_no = de.emp_no
--inner join titles ti
--on e.emp_no = ti.emp_no
--where de.to_date = ('9999-01-01')
--and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--order by e.emp_no, ti.title asc


--Additional validation for one row which didnt match with the challenge screenshot
--It seems screenshot in the module is wrong.
--Select * from titles where emp_no = 10762

--Additional question for the Summary section
--Create mentorship elegibility table
Select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date , ti.title, gender
into mentorship_eligibilty_Additional
from employees e 
inner join dept_emp de
on e.emp_no = de.emp_no
inner join titles ti
on e.emp_no = ti.emp_no
where de.to_date = ('9999-01-01')
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no, ti.title asc

Select Count(emp_no), gender from mentorship_eligibilty_Additional group by gender


Select Count(t1.emp_no) as count, ROUND(Avg(t1.salary)::numeric,2) as salary , t1.title 
from(
Select Distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date, salary 
--into retirenment_titles
from employees e
inner join titles ti
on e.emp_no = ti.emp_no
inner join salaries sa
on e.emp_no = sa.emp_no
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no ASC
)t1
group by t1.title order by salary desc
