CREATE DATABASE seckill;

USE seckill;

CREATE TABLE seckill(
	`seckill_id` BIGINT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(120) NOT NULL,
	`number` INT NOT NULL,
	`start_time` TIMESTAMP NOT NULL,
	`end_time` TIMESTAMP NOT NULL,
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`seckill_id`),
	KEY `idx_start_time` (`start_time`),
	KEY `idx_end_time` (`end_time`),
	KEY `idx_create_time` (`create_time`)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

INSERT INTO
	seckill(name, number, start_time, end_time)
VALUES
	('$1000 iphone17', 100, '2025-08-01 00:00:00', '2015-12-02 00:00:00'),
	('$500 ipad mini', 200, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
	('$300 Transformers Optimus Prime', 300, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
	('$200 Leetcode Membership', 400, '2015-11-01 00:00:00', '2015-11-02 00:00:00');

CREATE TABLE success_killed(
	`seckill_id` BIGINT NOT NULL,
	`user_phone` BIGINT NOT NULL,
	`state` TINYINT NOT NULL DEFAULT -1 COMMENT 'status：-1 invalid，0 success，1 paid，2 sent',
	`create_time` TIMESTAMP NOT NULL,
	PRIMARY KEY (`seckill_id`, `user_phone`),
	KEY `idx_create_time` (`create_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
