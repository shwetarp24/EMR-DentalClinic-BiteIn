DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserAuth`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
    SELECT @present := COUNT(uname) FROM users WHERE concat(uname,pwd,role) = concat(@USERNAME,@PASS,@ROLE);
    IF @present > 0 THEN
        SET @User_exists = 1;
	ELSE
		SET @User_exists = 0;
    END IF;
    SELECT @User_exists;
-- CALL `bitein`.`Dentist>5`('ROLE');
END$$
DELIMITER ;