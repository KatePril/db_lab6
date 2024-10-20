-- Example SELECT queries
SELECT content FROM option_q WHERE question_id=5;
SELECT first_name, last_name FROM user WHERE company IS NULL AND is_admin=0;
SELECT first_name, last_name FROM user WHERE age > 52;
SELECT id FROM question WHERE header LIKE "Economic policies";
SELECT option_id FROM answer WHERE id > 2 AND expert_id = 2;
SELECT * FROM user ORDER BY first_name DESC;
SELECT title FROM survey WHERE owner_id=3;
SELECT title FROM survey WHERE owner_id = (SELECT id FROM user WHERE email = 'critic@example.com');
SELECT name FROM category WHERE parent_id=2;
SELECT name from category WHERE parent_id=2 OR parent_id IS NULL;
SELECT email FROM user WHERE is_admin=1;

-- Count owner's number of surveys
SELECT COUNT(id) FROM survey WHERE owner_id = 1;

-- Get sorted categories
SELECT name FROM category ORDER BY name;

-- Select the content of option and name of expert, who selected it
SELECT content, first_name, last_name
FROM option_q INNER JOIN answer
INNER JOIN user WHERE option_q.id = answer.option_id AND answer.expert_id = user.id;

-- Select complaints and author's names
SELECT ec.description, first_name
FROM expertcomplaint AS ec, user AS u WHERE ec.expert_id = u.id;

-- Select category of the survey and survey title
SELECT c.name, s.title
FROM category AS c
INNER JOIN survey AS s
INNER JOIN surveycategory AS sc ON sc.survey_id = s.id AND sc.category_id = c.id;

-- Select survey author's name, title and description
SELECT user.first_name, survey.title, survey.description
FROM survey
INNER JOIN user
ON survey.owner_id = user.id;

-- Select expert's names and their expertise
SELECT user.first_name, expertise_rate, category.name
FROM expertise
RIGHT JOIN category
ON expertise.category_id = category.id
INNER JOIN user
ON expertise.user_id = user.id
ORDER BY user.first_name, category.name;

-- Select surveys' titles and headers of their question
SELECT survey.title, question.header
FROM question
INNER JOIN survey
ON question.survey_id = survey.id;

-- Select users' names and expertise if their expertise is equal to 5
SELECT user.first_name, expertise.expertise_rate, category.name
FROM expertise
RIGHT JOIN category
ON expertise.category_id = category.id
INNER JOIN user
ON expertise.user_id = user.id
WHERE expertise.expertise_rate = 5;

-- Select all the surveys' titles and matching questions
SELECT  question.header, survey.title
FROM question RIGHT JOIN survey ON survey.id = question.survey_id;

-- Select users, whose id is smaller than 4
SELECT user.first_name, user.last_name, survey.title, survey.description
FROM user INNER JOIN survey ON user.id = survey.owner_id
WHERE user.id < 4;

-- Select users' full names and expertise
SELECT user.first_name, user.last_name,category.name, expertise.expertise_rate
FROM user INNER JOIN expertise ON user.id = expertise.user_id
LEFT JOIN category ON  expertise.category_id=category.id;

-- Select surveys' titles, headers and descriptions of their question
SELECT survey.title AS survey_title,
       question.header AS question_header,
       question.description AS question_description
FROM survey INNER JOIN question ON survey.id = question.survey_id;

-- Select all the surveys and matching complaints
SELECT survey.title AS survey_title,
       surveycomplaint.description AS survey_complaint
FROM survey LEFT JOIN surveycomplaint ON survey.id = surveycomplaint.survey_id;

-- Select users and their expertise
SELECT expertise.expertise_rate,
       user.first_name AS user_first_name
FROM expertise CROSS JOIN user ON expertise.user_id = user.id;

-- Select emails of admins, whose expertise rate is higher than average
SELECT category.name AS category_name,
       user.email AS user_email,
       user.is_admin AS user_admin_status,
       expertise.expertise_rate
FROM user
RIGHT JOIN expertise ON expertise.user_id = user.id
LEFT JOIN category ON category.id = expertise.category_id
WHERE expertise.expertise_rate > (SELECT AVG(expertise_rate) FROM expertise)
AND user.is_admin = 1;

-- Count number of answers per option_q in survey
SELECT content, COUNT(expert_id) AS answer_count
FROM answer
RIGHT JOIN option_q ON answer.option_id = option_q.id
WHERE question_id = 7
GROUP BY content;

-- Get all expert responses to the survey
SELECT header AS question_header, content AS answer_name
FROM answer
JOIN option_q ON answer.option_id = option_q.id
JOIN question ON option_q.question_id = question.id
WHERE expert_id = 13 AND survey_id = 6
ORDER BY question.id;

-- Get experts with higher expertise_rate than average
SELECT user.id, CONCAT(first_name, " ", last_name), expertise_rate
FROM expertise
JOIN user ON expertise.user_id = user.id
WHERE expertise_rate > (SELECT AVG(expertise_rate) FROM expertise WHERE category_id =14)
AND category_id = 14;