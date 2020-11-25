-- BASE DE DATOS EJEMPLO

DROP DATABASE IF EXISTS consultas;

CREATE DATABASE IF NOT EXISTS consultas;

USE consultas;

CREATE TABLE carrera(
    codigo INT ,
    nombre VARCHAR(150)
);
ALTER TABLE carrera
    ADD  CONSTRAINT pk_codigo_carrera PRIMARY KEY  carrera(codigo);
ALTER TABLE carrera
  MODIFY codigo INT NOT NULL AUTO_INCREMENT;


CREATE TABLE estudiante(
    id INT(12),
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono INT(12) UNIQUE,
    carrera_codigo INT
);
ALTER TABLE estudiante
    ADD CONSTRAINT pk_id_estudiante  PRIMARY KEY estudiante(id);
ALTER TABLE estudiante
  MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE estudiante
    ADD CONSTRAINT fk_carrera_codigo FOREIGN KEY(carrera_codigo) REFERENCES carrera(codigo);

CREATE TABLE clase (
    codigo INT ,
    nombre VARCHAR(150) NOT NULL
);
ALTER TABLE clase
    ADD CONSTRAINT pk_codigo_clase  PRIMARY KEY clase(codigo);
ALTER TABLE clase
  MODIFY codigo INT NOT NULL AUTO_INCREMENT;

CREATE TABLE maestro (
    id INT ,
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150) NOT NULL
);
ALTER TABLE maestro
    ADD CONSTRAINT pk_id_maestro PRIMARY KEY maestro(id);
ALTER TABLE maestro
  MODIFY id INT NOT NULL AUTO_INCREMENT;

CREATE TABLE seccion (
    id INT ,
    hora VARCHAR(100) NOT NULL,
    cupos INT(10) NOT NULL,
    aula VARCHAR(100) NOT NULL,
    codigo_clase INT,
    maestro_id INT
);
ALTER TABLE seccion
    ADD CONSTRAINT pk_id_seccion PRIMARY KEY seccion(id);
ALTER TABLE seccion
  MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE seccion
    ADD CONSTRAINT fk_codigo_clase FOREIGN KEY(codigo_clase) REFERENCES clase(codigo);
ALTER TABLE seccion
    ADD CONSTRAINT fk_maestro_id FOREIGN KEY(maestro_id) REFERENCES maestro(id);

CREATE TABLE matricula (
    id INT ,
    estudiante_id INT,
    seccion_id INT
);
ALTER TABLE matricula
    ADD CONSTRAINT pk_id_matricula PRIMARY KEY matricula(id);
ALTER TABLE matricula
  MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE matricula
    ADD CONSTRAINT fk_estudiante_id FOREIGN KEY(estudiante_id) REFERENCES estudiante(id);
ALTER TABLE matricula
    ADD CONSTRAINT fk_seccion_id FOREIGN KEY(seccion_id) REFERENCES seccion(id);
