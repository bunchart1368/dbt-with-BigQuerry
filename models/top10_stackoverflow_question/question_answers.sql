WITH question_answers AS (
  SELECT 
    q.id AS question_id,
    q.title AS question_title,
    COUNT(a.id) AS num_answers
  FROM 
    `bigquery-public-data.stackoverflow.posts_questions` AS q
  LEFT JOIN 
    `bigquery-public-data.stackoverflow.posts_answers` AS a
  ON 
    q.id = a.parent_id
  WHERE 
    REGEXP_CONTAINS(q.tags, 'tensorflow')
  GROUP BY 
    question_id, question_title
)
SELECT * FROM question_answers