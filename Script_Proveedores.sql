-- Inserta un proveedor
DELIMITER //
CREATE PROCEDURE spInsertProvider(IN p_nit VARCHAR(45), IN p_name VARCHAR(100))
BEGIN
    INSERT INTO tbl_proveedores(prov_nit, prov_nombre) VALUES(p_nit, p_name);
END//
DELIMITER ;

-- Selecciona unicamente el id y el nombre de los proveedores
DELIMITER //
CREATE PROCEDURE spSelectProvidersDDL()
BEGIN
    SELECT prov_id, CONCAT(prov_nit, ' ', prov_nombre) AS nombre
    FROM tbl_proveedores;
END//
DELIMITER ;

-- Selecciona todos los atributos de los proveedores
DELIMITER //
CREATE PROCEDURE spSelectProviders()
BEGIN
    SELECT prov_id, prov_nit, prov_nombre
    FROM tbl_proveedores;
END//
DELIMITER ;

-- Actualiza un proveedor
DELIMITER //
CREATE PROCEDURE spUpdateProvider(IN p_id INT, IN p_nit VARCHAR(45), IN p_name VARCHAR(100))
BEGIN
    UPDATE tbl_proveedores
    SET prov_nit = p_nit, prov_nombre = p_name WHERE prov_id = p_id;
END//
DELIMITER ;
