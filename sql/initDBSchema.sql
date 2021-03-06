CREATE DATABASE `attendance`;

USE `attendance`;

-- CREATE TABLE `warehouse` (
-- 	`id` INT PRIMARY KEY AUTO_INCREMENT,
--     `name` VARCHAR(50) NOT NULL,
--     `address` VARCHAR(250) NOT NULL,
--     `telphone` VARCHAR(50) NOT NULL,
--     `createDate` DATETIME NOT NULL DEFAULT NOW(),
--     `updateDate` DATETIME NOT NULL DEFAULT NOW()
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE `employee_role` (
-- 	`id` INT PRIMARY KEY,
--     `name` VARCHAR(50) NOT NULL,
--     `displayName` VARCHAR(50) NOT NULL
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE `permission` (
-- 	`id` INT PRIMARY KEY,
--     `name` VARCHAR(50) NOT NULL,
--     `displayName` VARCHAR(50) NOT NULL 
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE `role_permission_mapping` (
-- 	`id` INT PRIMARY KEY AUTO_INCREMENT,
--     `roleId` INT NOT NULL,
--     `permissionId` INT NOT NULL
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
observers => employeeId joint by ','
*/
CREATE TABLE `admin` (
    `id` INT PRIMARY KEY AUTO_INCREMENT ,
    `username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grade` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `displayName` VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `class` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `gradeId` INT NOT NULL,
    `displayName` VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `employee` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `gradeId` INT NOT NULL,
    `classId` INT NOT NULL,
    `RFID` VARCHAR(50),
    `observedPhone` VARCHAR(50),
    `isObserved` INT,
    `createDate` DATETIME NOT NULL DEFAULT NOW(),
    `updateDate` DATETIME NOT NULL DEFAULT NOW()
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_information` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `openid` VARCHAR(50),
    `nickname` VARCHAR(50),
    `sex` VARCHAR(10),
    `province` VARCHAR(50),
    `city` VARCHAR(50),
    `country` VARCHAR(50),
    `headimgurl` VARCHAR(200),
    `employeeId` INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
recordType contains IN and OUT
*/

CREATE TABLE `attendance_record` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `employeeId` INT NOT NULL REFERENCES employee(id),
    `recordType` VARCHAR(50) NOT NULL,
    `createDate` DATETIME DEFAULT NOW()
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rfid` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `identity` VARCHAR(50) NOT NULL,
    `status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ALTER TABLE `role_permission_mapping` ADD CONSTRAINT `role_permission_mapping_roleId` FOREIGN KEY (`roleId`) REFERENCES employee_role(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
-- ALTER TABLE `role_permission_mapping` ADD CONSTRAINT `role_permission_mapping_permissionId` FOREIGN KEY (`permissionId`) REFERENCES permission(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
-- ALTER TABLE `employee` ADD CONSTRAINT `employee_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES warehouse(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
-- ALTER TABLE `employee` ADD CONSTRAINT `employee_roleId` FOREIGN KEY (`roleId`) REFERENCES employee_role(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `class` ADD CONSTRAINT `class_gradeId` FOREIGN KEY (`gradeId`) REFERENCES grade(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `employee` ADD CONSTRAINT `employee_gradeId` FOREIGN KEY (`gradeId`) REFERENCES grade(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `employee` ADD CONSTRAINT `employee_classId` FOREIGN KEY (`classId`) REFERENCES class(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `attendance_record` ADD CONSTRAINT `attendance_record_employeeId` FOREIGN KEY (`employeeId`) REFERENCES employee(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `wechat_information` ADD CONSTRAINT `wechat_information` FOREIGN KEY (`employeeId`) REFERENCES employee(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `attendance`.`employee` ADD UNIQUE INDEX `phone_UNIQUE` (`phone` ASC);
