-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Strong App

CREATE TABLE `User` (
    `user_id` char(12)  NOT NULL ,
    `creation_date` timestamp NOT NULL ,
    PRIMARY KEY (
        `user_id`
    )
);

CREATE TABLE `Routine` (
    `routine_id` int  NOT NULL AUTO_INCREMENT ,
    `user_id` char(12)  NOT NULL ,
    `routine_name` varchar(15)  NOT NULL ,
    `description` varchar(50)  NOT NULL,
    `creation_date` timestamp  NOT NULL ,
    `last_modification_date` timestamp  NOT NULL ,
    PRIMARY KEY (
        `routine_id`
    )
);

CREATE TABLE `RoutineElement` (
    `routine_element_id` int  NOT NULL AUTO_INCREMENT ,
    `routine_id` int  NOT NULL ,
    `exercise_id` int  NOT NULL ,
    PRIMARY KEY (
        `routine_element_id`
    )
);

CREATE TABLE `RoutineSet` (
    `set_id` int  NOT NULL AUTO_INCREMENT ,
    `routine_element_id` int  NOT NULL ,
    `reps` int  NOT NULL ,
    PRIMARY KEY (
        `set_id`
    )
);

CREATE TABLE `Exercise` (
    `exercise_id` int  NOT NULL AUTO_INCREMENT ,
    `exercise_name` varchar(50)  NOT NULL ,
    `video_link` varchar(100)  NOT NULL ,
    `creation_date` timestamp  NOT NULL ,
    PRIMARY KEY (
        `exercise_id`
    )
);

CREATE TABLE `MuscleWorkedExercise` (
    `worked_id` int  NOT NULL AUTO_INCREMENT ,
    `exercise_id` int  NOT NULL ,
    `muscle_id` int  NOT NULL ,
    PRIMARY KEY (
        `worked_id`
    )
);

CREATE TABLE `Muscle` (
    `muscle_id` int  NOT NULL AUTO_INCREMENT ,
    `muscle_name` varchar(50)  NOT NULL ,
    `group_id` int  NOT NULL ,
    PRIMARY KEY (
        `muscle_id`
    )
);

CREATE TABLE `MuscleGroup` (
    `group_id` int  NOT NULL AUTO_INCREMENT ,
    `group_name` varchar(30)  NOT NULL ,
    PRIMARY KEY (
        `group_id`
    )
);

ALTER TABLE `Routine` ADD CONSTRAINT `fk_Routine_user_id` FOREIGN KEY(`user_id`)
REFERENCES `User` (`user_id`);

ALTER TABLE `RoutineElement` ADD CONSTRAINT `fk_RoutineElement_routine_id` FOREIGN KEY(`routine_id`)
REFERENCES `Routine` (`routine_id`);

ALTER TABLE `RoutineElement` ADD CONSTRAINT `fk_RoutineElement_exercise_id` FOREIGN KEY(`exercise_id`)
REFERENCES `Exercise` (`exercise_id`);

ALTER TABLE `RoutineSet` ADD CONSTRAINT `fk_RoutineSet_routine_element_id` FOREIGN KEY(`routine_element_id`)
REFERENCES `RoutineElement` (`routine_element_id`);

ALTER TABLE `MuscleWorkedExercise` ADD CONSTRAINT `fk_MuscleWorkedExercise_exercise_id` FOREIGN KEY(`exercise_id`)
REFERENCES `Exercise` (`exercise_id`);

ALTER TABLE `MuscleWorkedExercise` ADD CONSTRAINT `fk_MuscleWorkedExercise_muscle_id` FOREIGN KEY(`muscle_id`)
REFERENCES `Muscle` (`muscle_id`);

ALTER TABLE `Muscle` ADD CONSTRAINT `fk_Muscle_group_id` FOREIGN KEY(`group_id`)
REFERENCES `MuscleGroup` (`group_id`);

