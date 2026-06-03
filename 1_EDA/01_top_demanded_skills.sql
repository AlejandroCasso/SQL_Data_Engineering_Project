/*
Question: What are the most in-demand skills for data engineers?
* Identify the top 10 in-demand skills for data engineers
* Focus on remote job postings
* Why?
    - Retrieves the top 10 skills qith the highest demand in the
    remote job market, providing insights into the most valuable
    skills for data engineers seeking remote work.
*/

SELECT
s.skills,
COUNT(j.job_id) AS posts
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Data Engineer'
AND job_work_from_home = TRUE
GROUP BY s.skills
ORDER BY posts DESC
LIMIT 10;

/*
┌────────────┬───────┐
│   skills   │ posts │
│  varchar   │ int64 │
├────────────┼───────┤
│ sql        │ 29221 │
│ python     │ 28776 │
│ aws        │ 17823 │
│ azure      │ 14143 │
│ spark      │ 12799 │
│ airflow    │  9996 │
│ snowflake  │  8639 │
│ databricks │  8183 │
│ java       │  7267 │
│ gcp        │  6446 │
└────────────┴───────┘
*/