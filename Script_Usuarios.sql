-- Selecciona todos los usuarios
DELIMITER //
CREATE PROCEDURE spSelectUsers()
BEGIN
    SELECT *
    FROM tbl_usuarios;
END//
DELIMITER ;

-- Selecciona un usuario por su correo
DELIMITER //
CREATE PROCEDURE spSelectUsersMail(IN p_mail VARCHAR(80))
BEGIN
    SELECT usu_correo, usu_contrasena, usu_salt, usu_estado
    FROM tbl_usuarios
    WHERE usu_correo = p_mail;
END//
DELIMITER ;

-- Inserta un nuevo usuario
DELIMITER //
CREATE PROCEDURE spInsertUsers(IN p_mail VARCHAR(80), IN p_password TEXT, IN p_salt TEXT, IN p_state VARCHAR(15))
BEGIN
    INSERT INTO tbl_usuarios(usu_correo, usu_contrasena, usu_salt, usu_estado) VALUES(p_mail, p_password, p_salt, p_state);
END//
DELIMITER ;

-- Actualiza un usuario
DELIMITER //
CREATE PROCEDURE spUpdateUsers(IN p_id INT, IN p_mail VARCHAR(80), IN p_password TEXT, IN p_salt TEXT, IN p_state VARCHAR(15))
BEGIN
    UPDATE tbl_usuarios
    SET usu_correo = p_mail, usu_contrasena = p_password, usu_salt = p_salt, usu_estado = p_state WHERE usu_id = p_id;
END//
DELIMITER ;
