
-- WITH remote_job_skills AS(
-- SELECT
--     skill_id,
--     COUNT(*) AS skill_count
-- FROM 
--     job_postings_fact AS j
-- INNER JOIN skills_job_dim AS s1 ON j.job_id = s1.job_id 
-- WHERE 
--     job_title_short = 'Data Analyst' AND
--     job_work_from_home = 'True'
-- GROUP BY skill_id
-- )
-- SELECT
--     s2.skill_id,
--     skills AS skill_name,
--     skill_count
-- FROM 
--     skills_dim AS s2
-- INNER JOIN remote_job_skills AS r ON r.skill_id = s2.skill_id 
-- ORDER BY 
--     skill_count DESC
-- LIMIT 5;


SELECT 
    skills,
    COUNT(s1.job_id) AS demand_count
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim AS s1 ON j.job_id = s1.job_id
INNER JOIN skills_dim AS s2 ON s1.skill_id = s2.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'True'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;