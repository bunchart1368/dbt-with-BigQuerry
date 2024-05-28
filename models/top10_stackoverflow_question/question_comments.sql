WITH question_comments AS (
  SELECT 
    q.id AS question_id,
    COUNT(c.id) AS num_comments
  FROM 
    `bigquery-public-data.stackoverflow.posts_questions` AS q
  LEFT JOIN 
    `bigquery-public-data.stackoverflow.comments` AS c
  ON 
    q.id = c.post_id
  WHERE 
    REGEXP_CONTAINS(q.tags, 'tensorflow')
  GROUP BY 
    question_id
)
SELECT * FROM question_comments