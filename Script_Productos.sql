-- Insertar un producto
DELIMITER //
CREATE PROCEDURE spInsertProduct(
  IN p_code VARCHAR(45), 
  IN p_description VARCHAR(100),
  IN p_amount INT, 
  IN p_price DECIMAL, 
  IN p_fkprovider INT, 
  IN p_fkcategory INT
)
BEGIN
    INSERT INTO tbl_productos(
      pro_codigo, pro_descripcion, pro_cantidad, pro_precio,
      tbl_proveedores_prov_id, tbl_categorias_cat_id
    ) 
    VALUES(p_code, p_description, p_amount, p_price, p_fkprovider, p_fkcategory);
END//
DELIMITER ;

-- Actualizar un producto
DELIMITER //
CREATE PROCEDURE spUpdateProduct(
  IN p_id INT, 
  IN p_code VARCHAR(45), 
  IN p_description VARCHAR(100),
  IN p_amount INT, 
  IN p_price DECIMAL, 
  IN p_fkprovider INT, 
  IN p_fkcategory INT
)
BEGIN
    UPDATE tbl_productos
    SET 
      pro_codigo = p_code, 
      pro_descripcion = p_description, 
      pro_cantidad = p_amount,
      pro_precio = p_price, 
      tbl_proveedores_prov_id = p_fkprovider,
      tbl_categorias_cat_id = p_fkcategory
    WHERE pro_id = p_id;
END//
DELIMITER ;

-- Mostrar todos los productos
DELIMITER //
CREATE PROCEDURE spSelectProducts()
BEGIN
    SELECT 
      pro_id, 
      pro_codigo, 
      pro_descripcion, 
      pro_cantidad, 
      pro_precio,
      tbl_productos.tbl_categorias_cat_id AS cat_id,
      tbl_categorias.cat_descripcion,
      tbl_productos.tbl_proveedores_prov_id AS prov_id, 
      tbl_proveedores.prov_nombre
    FROM tbl_productos
    INNER JOIN tbl_categorias
    ON tbl_productos.tbl_categorias_cat_id = tbl_categorias.cat_id
    INNER JOIN tbl_proveedores
    ON tbl_productos.tbl_proveedores_prov_id = tbl_proveedores.prov_id;
END//
DELIMITER ;

-- Eliminar un producto
DELIMITER //
CREATE PROCEDURE spDeleteProduct(IN p_id INT)
BEGIN
    DELETE FROM tbl_productos WHERE pro_id = p_id;
END//
DELIMITER ;
