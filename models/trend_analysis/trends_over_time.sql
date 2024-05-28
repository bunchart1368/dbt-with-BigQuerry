SELECT 
  EXTRACT(YEAR FROM q.creation_date) AS year,
  EXTRACT(MONTH FROM q.creation_date) AS month,
  COUNT(q.id) AS num_questions
FROM 
  `bigquery-public-data.stackoverflow.posts_questions` AS q
WHERE 
  REGEXP_CONTAINS(q.tags, 'tensorflow')
GROUP BY 
  year, month
ORDER BY 
  year, month