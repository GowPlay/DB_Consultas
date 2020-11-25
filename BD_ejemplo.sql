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


-- datos 

INSERT INTO carrera (nombre) 
    VALUES(' ING sistemas'),
          (' Medicina '),
          (' Agroecologia'),
          (' Derecho Penal');


INSERT INTO estudiante (nombre, apellidos, carrera_codigo) 
    VALUES('jefferson andres', 'pedraza salazar', 1),
          ('jennifer andrea', 'pedraza robles', 1),
          ('juan camilo', 'peres salazar', 1),
          ('cristian', 'claros salazar', 2),
          ('cristina ', 'claros restrepo', 2),
          ('camila andrea ', 'restrepo', 3),
          ('maria camila ', 'ruiz restrepo', 3),
          ('juan carlos ', 'claros restrepo', 4);

INSERT INTO clase(nombre) 
    VALUES('filosofia'),
          ('programacion web'),
          ('derecho penal'),
          ('administracion'),
          ('invertegrados');

INSERT INTO maestro(nombre, apellido) 
    VALUES('Juan Andres', 'Ramirez Daza' ),
          ('Flabio Andres', 'Quintana'),
          ('Cristian Camil', 'Rodrigez Paz'),
          ('Oscar', 'Ruiz Quintana'),
          ('Daniel', 'Restrepo ');

INSERT INTO seccion(hora, cupos, aula,codigo_clase, maestro_id ) 
    VALUES('12-04-2019', 25,'A122', 1, 1 ),
          ('12-05-2020', 25,'A102', 2, 2),
          ('12-05-2019', 25,'A022', 2, 2),
          ('12-06-2019', 25,'B022', 3, 3),
          ('12-06-2020', 25,'B202', 4, 1),
          ('12-06-2019', 25,'C122', 5, 5);

INSERT INTO matricula(estudiante_id, seccion_id ) 
    VALUES(1,1),
          (1,2),
          (2,1),
          (3,2),
          (3,3),
          (4,2);
