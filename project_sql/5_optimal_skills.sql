
SELECT
    s1.skill_id,
    s2.skills,
    COUNT(j.job_id) AS skill_demand,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS s1 ON j.job_id = s1.job_id
INNER JOIN skills_dim AS s2 ON s1.skill_id = s2.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'True' 
GROUP BY s1.skill_id, s2.skills
HAVING 
    COUNT(j.job_id) > 10 
ORDER BY
    avg_salary DESC,
    skill_demand DESC;
