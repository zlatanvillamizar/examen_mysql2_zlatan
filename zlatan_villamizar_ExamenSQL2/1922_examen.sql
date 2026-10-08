CREATE DATABASE IF NOT EXISTS examen_sql2;
USE examen_sql2;

CREATE TABLE IF NOT EXISTS membresias (
    id_membresia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    fecha_inicio DATE,
    fecha_vencimiento DATE
);


DELIMITER $$
DROP TRIGGER IF EXISTS trg_calcular_fecha_vencimiento_30_dias $$
CREATE TRIGGER trg_calcular_fecha_vencimiento_30_dias
BEFORE INSERT ON membresias
FOR EACH ROW
BEGIN
    SET NEW.fecha_vencimiento = DATE_ADD(NEW.fecha_inicio, INTERVAL 30 DAY);
END$$

DELIMITER ;

INSERT INTO membresias (nombre_usuario, fecha_inicio) 
VALUES ('Laura Gómez', '2026-03-01');
SELECT * FROM membresias;

