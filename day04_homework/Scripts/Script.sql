 SELECT e.employee_id, e.FIRST_NAME , e.SALARY , e.DEPARTMENT_ID, round(s.평균급여, 2)--부서별 평균 급여
  FROM EMPLOYEES e 
  JOIN(
     SELECT DEPARTMENT_ID, AVG(SALARY) AS "평균급여"
     FROM EMPLOYEES
     GROUP BY DEPARTMENT_ID 
  )s ON e.DEPARTMENT_ID = s.department_id
  WHERE SALARY > (SELECT AVG(SALARY)
     FROM EMPLOYEES
     WHERE DEPARTMENT_ID = e.DEPARTMENT_ID);
     
    
    JOIN(
     SELECT DEPARTMENT_ID, AVG(SALARY) AS "평균급여"
     FROM EMPLOYEES
     GROUP BY DEPARTMENT_ID 
  )s ON e.DEPARTMENT_ID = s.department_id
  
   SELECT DEPARTMENT_ID, AVG(SALARY) AS "평균급여"
     FROM EMPLOYEES
     GROUP BY DEPARTMENT_ID 
		ORDER BY DEPARTMENT_ID ;
  

   