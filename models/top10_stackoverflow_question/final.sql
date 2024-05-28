WITH question_answers AS (
  SELECT * FROM {{ ref('question_answers') }}
),
question_comments AS (
  SELECT * FROM {{ ref('question_comments') }}
)
SELECT 
  qa.question_id,
  qa.question_title,
  qa.num_answers,
  qc.num_comments,
  (qa.num_answers + qc.num_comments) AS total_interactions
FROM 
  question_answers AS qa
JOIN 
  question_comments AS qc
ON 
  qa.question_id = qc.question_id
ORDER BY 
  total_interactions DESC
LIMIT 10