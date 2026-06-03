SELECT *
LIMIT 10
FROM job_postings_fact;



/*
Find the top 10 companies for posting jobs
They must have > 3000 postings
Limit to only US jobs
*/

EXPLAIN ANALYZE
SELECT 
j.company_id,
c.name,
COUNT(*) AS postings
FROM job_postings_fact J
LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE j.job_country = 'United States'
GROUP BY j.company_id, c.name
HAVING COUNT(*) > 3000
ORDER BY postings DESC
LIMIT 10;