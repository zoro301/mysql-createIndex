USE portal;

DELIMITER $$

DROP PROCEDURE IF EXISTS `create_index_if_not_exists`$$

CREATE DEFINER=`datacenter`@`%` PROCEDURE `create_index_if_not_exists`(IN in_table_name VARCHAR(255), IN in_index_name VARCHAR(50), IN in_index_type VARCHAR(10),IN in_filed_list VARCHAR(255))
BEGIN
	SET@index_cnt = (
		SELECT COUNT(1)cnt FROM INFORMATION_SCHEMA.STATISTICS
		WHERE table_name=in_table_name AND index_name=in_index_name
	);

	IF IFNULL(@index_cnt, 0)=0 THEN SET@execute_sql=CONCAT('Alter table ', in_table_name, ' ADD ', in_index_type, ' ',in_index_name, '(',in_filed_list,');');
	PREPARE stmt FROM @execute_sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	END IF;
    END$$

DELIMITER ;
