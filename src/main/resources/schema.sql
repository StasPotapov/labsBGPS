CREATE TABLE mark (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name TEXT NOT NULL,
    value TEXT NOT NULL
);

CREATE TABLE study_group (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    surname TEXT NOT NULL,
    name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    study_group_id INT NOT NULL,
    FOREIGN KEY (study_group_id) REFERENCES study_group(id)
);

CREATE TABLE student_local (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    surname TEXT NOT NULL,
    name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    study_group_id INT NOT NULL
);

CREATE TABLE subject (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name TEXT NOT NULL,
    short_name TEXT NOT NULL
);

CREATE TABLE exam_type (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type TEXT NOT NULL
);

CREATE TABLE study_plan (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    subject_id INT NOT NULL,
    exam_type_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subject(id),
    FOREIGN KEY (exam_type_id) REFERENCES exam_type(id)
);

CREATE TABLE journal (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    student_id INT NOT NULL,
    study_plan_id INT NOT NULL,
    in_time BIT NOT NULL,
    count INT NOT NULL,
    mark_id INT NOT NULL,
    FOREIGN KEY (study_plan_id) REFERENCES study_plan(id),
    FOREIGN KEY (mark_id) REFERENCES mark(id)
);

INSERT INTO mark (id, name, value)
VALUES (1, 'Отлично', '5'),
       (2, 'Хорошо', '4'),
       (3, 'Удовлетворительно', '3'),
       (4, 'Неудовлетворительно', '2'),
       (5, 'Зачет', 'з'),
       (6, 'Незачет', 'н'),
       (7, 'Неявка', '');

INSERT INTO study_group (id, name) VALUES (1, 'ИКБО-02'),
                                          (2, 'ИКБО-03');

INSERT INTO student_local (id, surname, name, second_name, study_group_id)
VALUES (43, 'Потапов', 'Станислав', 'Вячеславович', 1);

INSERT INTO subject (id, name, short_name)
VALUES (1, 'Проектирование информационных систем', 'ПрИС'),
       (2, 'Системы искусственного интеллекта', 'СИИ'),
       (3, 'Программная инженерия', 'ПИ'),
       (4, 'Национальная система информационной безопасности', 'НСИБ'),
       (5, 'Системный анализ', 'СисАнал'),
       (6, 'Распределенные базы данных', 'РБД'),
       (7, 'Системное программное обеспечение', 'СПО');

INSERT INTO exam_type (id, type)
VALUES (1, 'Экзамен'),
       (2, 'Зачет'),
       (3, 'Зачет с оценкой'),
       (4, 'Курсовая');

INSERT INTO study_plan (id, subject_id, exam_type_id)
VALUES (1, 1, 1),
       (2, 1, 4),
       (3, 2, 1),
       (4, 3, 1),
       (5, 4, 2),
       (6, 5, 1),
       (7, 6, 2),
       (8, 7, 1);

INSERT INTO journal (id, student_id, study_plan_id, in_time, count, mark_id)
VALUES (1, 4, 1, true, 2, 1),
       (2, 4, 6, true, 2, 2),
       (3, 4, 4, true, 2, 3),
       (4, 4, 2, true, 2, 4),
       (5, 24, 1, true, 2, 1),
       (6, 24, 6, true, 2, 2),
       (7, 24, 4, true, 2, 3),
       (8, 24, 2, true, 2, 4);