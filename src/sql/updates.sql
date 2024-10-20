-- Example UPDATE queries
UPDATE user SET email="kate.pril@gmail.com" WHERE id=3;
UPDATE survey SET close_date = "2024-12-14 23:59:59" WHERE id = 3;

UPDATE survey SET is_active = 0, close_date = "2024-10-14" WHERE id = 1;
UPDATE survey SET title = "Psychological skills" WHERE id = 3;
UPDATE survey SET title = "Best woman" WHERE owner_id = 2;
UPDATE user SET first_name = "Donald" WHERE first_name = "Friedrich";

UPDATE answer SET option_id = "1" WHERE id = 1;

UPDATE surveycategory SET survey_id=4 WHERE id=3;
UPDATE surveycategory SET category_id=1 WHERE survey_id=3;
UPDATE db_labs.expertise SET expertise_rate=3.5, user_id=11 WHERE category_id=4;