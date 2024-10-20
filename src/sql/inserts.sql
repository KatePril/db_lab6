-- Fill database with data
 USE db_labs;

INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin)
VALUES ("Dima", "Valai", "dima@gmail.com", "+380113223344", "jagiq273ty", 0);
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin)
VALUES ("Vasya", "Vasylenko", "vasya@gmail.com", "+380113223334", "jagiq2732y", 1);
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin)
VALUES ("Kate", "Pril", "kate@gmail.com", "+380112223344", "jagiq973ty", 1);
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin, description, age, gender)
VALUES ("John", "Doe", "john.doe@example.com", "+1234567890", "q23xttrfg", 0, "Expert in psychology with 10 years of experience in behavioral research.", 45, "Male");
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin, company)
VALUES ("Jane", "Smith", "jane.smith@example.com", "+0987654321", "gqd2ex3fc", 0, "MindTech Solutions");
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin, description, age, gender)
VALUES ("Alice", "Johnson", "alice.johnson@example.com", "+1987654321", "p9lmdsk34", 0, "Data analyst specializing in machine learning and data-driven decision making.", 30, "Female");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, age, gender)
VALUES("Maksim", "Zinets", "Makson@example.com", "+123124124", "1234567890", 1, 18, "Male");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES("Immanuel", "Kant", "critic@example.com", "+14881488", "0987654321", 0, "No description given", 52, "Male", "Phenomen Industries");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, age, gender)
VALUES("Friedrich", "Nietzsche", "ubermensch@example.com", "+1357924680", "securepassword", 0, 56, "Male");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES("Margaret", "Thatcher", "godsavethequeen@example.com", "+23469346", "26343464", 0, "British Statewoman", 88, "Female", "British Parliament");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES("Napoleon", "Bonaparte", "vivalafrance@example.com", "+11111111", "11111111", 0, "Emperor of France", 45, "Male", "French Empire");
INSERT INTO user (first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES ("Andrii", "Solomka", "asolomka@gmail.com", "+3806666666", "12345", 1, "Node js developer", 52, "Male", "Donbass Coil");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES("Loli", "Crop", "brawlstars@example.com", "+774329602", "pididivdidi", 0, "Beer-drink master", 25, "Male", "Beer World");
INSERT INTO User(first_name, last_name, email, phone_number, password, is_admin, description, age, gender, company)
VALUES("Andrii", "Cruco", "kapibara@example.com", "+0664326434", "********", 0, "Non expert expert", 39, "Male", "Beer World");



INSERT INTO category (name) VALUES ("psychology");
INSERT INTO category (name) VALUES ("math");
INSERT INTO category (name) VALUES ("music");
INSERT INTO category (name) VALUES ("machine learning");
INSERT INTO category (name, parent_id) VALUES ("deep learning", 2);
INSERT INTO category (name, parent_id) VALUES ("children psychology", 1);
INSERT INTO category (name) VALUES("IT");
INSERT INTO category (name) VALUES("Philosophy");
INSERT INTO category (name) VALUES("Politics");
INSERT INTO category (name, parent_id) VALUES("Analytical philosophy", 2);
INSERT INTO category (name, parent_id) VALUES("Continental philosophy", 2);
INSERT INTO category (name, parent_id) VALUES("Conquests", 3);
INSERT INTO category (name, parent_id) VALUES("Backend development", 7);
INSERT INTO category (name) VALUES("Physics");

INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (5, 1, 2);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (5, 6, 8);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (4.5, 5, 8);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (5, 5, 11);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (2, 1, 4);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (4.5, 2, 4);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (5, 3, 4);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (5, 2, 2);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (1, 1, 1);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (5, 4, 2);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (4, 2, 3);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (5, 5, 3);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (3, 3, 4);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (5, 3, 5);
INSERT INTO expertise(expertise_rate, category_id, user_id) VALUES (5, 6, 5);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (4, 13, 14);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (4, 14, 14);
INSERT INTO expertise (expertise_rate, category_id, user_id) VALUES (2, 14, 13);


INSERT INTO survey (title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES ("Psychology Behavior Survey", "A survey focused on understanding behavioral patterns in adults.",
        '2024-10-14 09:00:00', '2024-11-14 23:59:59', 0, 1, 3);
INSERT INTO survey (title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES ("Discovery of the inheritance of Bach", "This survey explores the legacy and impact of Johann Sebastian Bach's compositions.",
        '2024-10-14 14:00:00', '2024-11-14 23:59:59', 0, 1, 8);
INSERT INTO survey (title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES ("Children Psychology Survey", "A survey aimed at understanding the psychological development of children.",
        '2024-10-14 10:00:00', '2024-12-01 23:59:59', 1, 1, 3);
INSERT INTO survey(title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES("Pure reason critique", "This test is to show your knowledge about pure reason critique", '2024-11-14 23:59:59', '2024-12-14 23:59:59', 1, 1, 2);
INSERT INTO survey(title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES("Margaret Thatcher presidency", "In this survey, we want you to rate Margaret Thatcher policies as a prime-minister", '1979-5-4 8:00:00', '1900-11-28 23:59:59', 0, 0, 4);
INSERT INTO survey (title, description, creation_date, close_date, is_changable, is_active, owner_id)
VALUES ("Importance of physics", "A survey focused on importance of physics for people.",
        '2024-10-14 23:00:00', '2024-11-16 23:59:59', 0, 1, 14);

INSERT INTO surveycategory (survey_id, category_id) VALUES (1, 1);
INSERT INTO surveycategory (survey_id, category_id) VALUES (2, 1);
INSERT INTO surveycategory (survey_id, category_id) VALUES (1, 4);
INSERT INTO surveycategory(category_id, survey_id) VALUES (2, 1);
INSERT INTO surveycategory(category_id, survey_id) VALUES (4, 1);
INSERT INTO surveycategory(category_id, survey_id) VALUES (3, 2);

INSERT INTO question (header, description, survey_id)
VALUES
("How often do you experience stress?", "Please select the frequency that best matches your experience of stress.", 1),
("How would you describe your overall emotional well-being?", "Rate your emotional well-being on a scale of 1 to 5.", 1);

INSERT INTO question (header, description, survey_id)
VALUES
("How does the child interact with peers?", "Select the option that best describes the child’s social interactions.", 2),
("How does the child usually respond to stressful situations?", "Select the typical response the child has to stress.", 2);
INSERT INTO question(header, description, survey_id)
VALUES("Economic policies", "How are you satisfied with Thatchers economic policies?", 2);
INSERT INTO question(header, description, survey_id)
VALUES("What is phenomenon in Kant`s philosophy?", "There`s only one right answer", 1);
INSERT INTO question (header, description, survey_id)
VALUES
("Physics is important?", "Many people mean that physics is unimportant. Do you think so?", 6),
("How dificult is it to answer the previous question?", "Scale of 1 to 5.", 6);

INSERT INTO option_q(content, question_id)
VALUES("An object that exists independently of our perception", 1);
INSERT INTO option_q(content, question_id)
VALUES("An object as it appears in our experience through the senses and cognitive faculties", 1);
INSERT INTO option_q(content, question_id)
VALUES("An abstract idea, unrelated to actual perception", 1);
INSERT INTO option_q(content, question_id)
VALUES("An emotional reaction of a person to external objects", 1);

INSERT INTO option_q(content, question_id) VALUES("Very satisfied", 1);
INSERT INTO option_q(content, question_id) VALUES("Satisfied", 1);
INSERT INTO option_q(content, question_id) VALUES("It didn`t affect me", 1);
INSERT INTO option_q(content, question_id) VALUES("Unsatisfied", 1);
INSERT INTO option_q(content, question_id) VALUES("Very unsatisfied", 1);
INSERT INTO option_q (content, question_id) VALUES ("Never", 3);
INSERT INTO option_q (content, question_id) VALUES ("Sometimes", 3);
INSERT INTO option_q (content, question_id) VALUES ("Always", 3);
INSERT INTO option_q (content, question_id) VALUES ("1", 4);
INSERT INTO option_q (content, question_id) VALUES ("2", 4);
INSERT INTO option_q (content, question_id) VALUES ("3", 4);
INSERT INTO option_q (content, question_id) VALUES ("5", 4);
INSERT INTO option_q (content, question_id) VALUES ("Very friendly", 5);
INSERT INTO option_q (content, question_id) VALUES ("Neutral", 5);
INSERT INTO option_q (content, question_id) VALUES ("Aggressive", 5);
INSERT INTO option_q (content, question_id) VALUES ("Remains calm", 6);
INSERT INTO option_q (content, question_id) VALUES ("Shows moderate anxiety", 6);
INSERT INTO option_q (content, question_id) VALUES ("Has a breakdown", 6);
INSERT INTO option_q(content, question_id) VALUES("Yes", 7);
INSERT INTO option_q(content, question_id) VALUES("No", 7);
INSERT INTO option_q(content, question_id) VALUES("Easy", 8);
INSERT INTO option_q(content, question_id) VALUES("Medium", 8);
INSERT INTO option_q(content, question_id) VALUES("Hard", 8);



INSERT INTO answer (option_id, expert_id) VALUES (2, 2);
INSERT INTO answer (option_id, expert_id) VALUES (3, 4);
INSERT INTO answer (option_id, expert_id) VALUES (5, 2);
INSERT INTO answer (option_id, expert_id) VALUES (6, 4);
INSERT INTO answer (option_id, expert_id) VALUES (8, 4);
INSERT INTO answer (option_id, expert_id) VALUES (12, 4);
INSERT INTO answer (option_id, expert_id) VALUES(7, 2);
INSERT INTO answer (option_id, expert_id) VALUES(24, 13);
INSERT INTO answer (option_id, expert_id) VALUES(27, 13);

INSERT INTO expertcomplaint (description, date, researcher_id, expert_id)
VALUES ('Complaint regarding expert feedback', '2024-10-14 09:30:00', 3, 4);
INSERT INTO surveycomplaint (description, date, survey_id, expert_id)
VALUES ('Complaint about survey data handling by expert', '2024-10-14 09:30:00', 1, 2);


INSERT INTO expertcomplaint (description, date, researcher_id, expert_id)
VALUES ('Complaint about expert`s options are biased', '2024-10-14 09:30:00', 4, 3);
INSERT INTO surveycomplaint (description, date, survey_id, expert_id)

VALUES ('Complaint about test`s complication', '2024-10-14 09:30:00', 2, 2);

INSERT INTO surveycategory (id, survey_id, category_id) VALUES (7, 5, 11);
INSERT INTO surveycategory (id, survey_id, category_id) VALUES (8, 3, 1);
INSERT INTO surveycategory (id, survey_id, category_id) VALUES (9, 2, 7);
INSERT INTO surveycategory (survey_id, category_id) VALUES (6, 14);