-- seckill execution procedure
DELIMITER $$ -- console ; to $$
-- start definition
-- in: input; outL output
-- row_count: 0: data not updated; >0: updated rows; <0:sql error/sql not executed
CREATE PROCEDURE `seckill`.`execute_seckill`
(IN v_seckill_id bigint, IN v_phone BIGINT,
IN v_kill_time TIMESTAMP, OUT r_result INT)
	BEGIN
		DECLARE insert_count INT DEFAULT 0;
		START TRANSACTION;
		INSERT ignore INTO success_killed (seckill_id, user_phone, state, create_time)
		VALUES(v_seckill_id, v_phone, 0, v_kill_time);
		SELECT ROW_COUNT() INTO insert_count;
		IF (insert_count = 0) THEN
			ROLLBACK;
			SET r_result = -1;
		ELSEIF (insert_count < 0) THEN
			ROLLBACK ;
			SET r_result = -2;
		ELSE
			UPDATE seckill SET number = number - 1
			WHERE seckill_id = v_seckill_id AND end_time > v_kill_time
			AND start_time < v_kill_time AND number > 0;
			SELECT ROW_COUNT() INTO insert_count;
			IF (insert_count = 0) THEN
				ROLLBACK;
				SET r_result = 0;
			ELSEIF (insert_count < 0) THEN
				ROLLBACK;
				SET r_result = -2;
			ELSE
				COMMIT;
			SET r_result = 1;
			END IF;
		END IF;
	END;
$$
-- end definition

DELIMITER ;

-- test
SET @r_result = -3;
call execute_seckill(1001, 13631231234, now(), @r_result);
SELECT @r_result;