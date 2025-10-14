

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim AS s1 ON j.job_id = s1.job_id
INNER JOIN skills_dim AS s2 ON s1.skill_id = s2.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
    AND job_work_from_home = 'True'
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 10;


/*
The top paying data analyst skills show a clear trend favoring modern big data, cloud, and advanced analytics tools. Skills related to data engineering, machine learning, and cloud platforms command the highest salaries.

-- High-Paying Skill Trends
-- Big Data and Distributed Computing: Skills like PySpark ($208K), Databricks ($142K), Hadoop ($113K), and Snowflake ($113K) are among the top earners. This reflects demand for handling large-scale, distributed data processing.

-- Cloud Platforms and DevOps Tools: Cloud-related skills such as Kubernetes ($133K), GCP ($123K), Azure ($111K), and IBM Cloud ($111K), plus CI/CD tools like Jenkins ($125K), GitLab ($155K), and Bitbucket ($189K), signal strong market value in cloud infrastructure and automation.

-- Advanced Analytics and Machine Learning: Python libraries like Pandas ($152K), NumPy ($144K), Scikit-learn ($126K), and data science environments like Jupyter ($153K) and DataRobot ($155K) indicate high salaries tied to analytics and predictive modeling capabilities.

-- Database and Query Languages: PostgreSQL ($124K) and NoSQL databases like Couchbase ($161K) highlight the premium for database query and management skills, especially in modern NoSQL systems.

-- Programming Languages: Go ($115K), Scala ($125K), and Swift ($154K) suggest specialized programming skills can also drive higher pay, especially when combined with data roles.

-- Collaboration and Project Tools: Atlassian ($131K), Confluence ($114K), and Jira ($105K) indicate value in collaboration and project management within data teams.

-- Summary
-- Top paying data analyst jobs favor expertise in big data frameworks, cloud computing, machine learning environments, and modern DevOps tools. These skillsets enable handling complex, large-scale data pipelines and applying advanced analytics techniques—increasing their market value compared to traditional data analysis skills like basic SQL or Excel.

-- This insight highlights a shift in the data analyst role towards hybrid data engineer/science capabilities and cloud-native tools, commanding top salaries in the market.