CREATE DATABASE bd_lista_diana;

--TABLA USUARIO
CREATE TABLE USUARIO(
    NICKNAME VARCHAR(20),
    NOMBRE_APELLIDO VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(10) NOT NULL,
    PRIMARY KEY(NICKNAME)
);

-- TABLA GENERO
CREATE TABLE GENERO(
    ID INT AUTO_INCREMENT,
    DESCRIPCION VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID)
);

--TABLA CANCION
CREATE TABLE CANCION(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(100),
    AUTOR VARCHAR(100),
    NICKNAME VARCHAR(20),
    GENERO_ID INT,
    PRIMARY KEY(ID)
);

ALTER TABLE CANCION ADD CONSTRAINT fk_cancion_usuario
FOREIGN KEY (NICKNAME) REFERENCES USUARIO(NICKNAME);

ALTER TABLE CANCION ADD CONSTRAINT fk_cancion_genero
FOREIGN KEY (GENERO_ID) REFERENCES GENERO(ID);

CREATE TABLE LISTA_REPRODUCCION(
    ID INT AUTO_INCREMENT,
    DESCRIPCION VARCHAR(100),
    NICKNAME VARCHAR(20),
    PRIMARY KEY(ID)
);

ALTER TABLE LISTA_REPRODUCCION ADD CONSTRAINT fk_lista_usuario
FOREIGN KEY(NICKNAME) REFERENCES USUARIO(NICKNAME);

CREATE TABLE LISTA_CANCION(
    LISTA_ID INT,
    CANCION_ID INT

);

ALTER TABLE LISTA_CANCION ADD CONSTRAINT pk_lista_cancion
PRIMARY KEY(LISTA_ID, CANCION_ID)

ALTER TABLE LISTA_CANCION ADD CONSTRAINT fk_listac_listar
FOREIGN KEY(LISTA_ID) REFERENCES LISTA_REPRODUCCION(ID)

ALTER TABLE LISTA_CANCION ADD CONSTRAINT fk_listac_cancion
FOREIGN KEY(CANCION_ID) REFERENCES CANCION(ID)

INSERT INTO USUARIO
VALUES ('didz','Didz Delgx','didzdelgx@gmail.com','12345')

INSERT INTO GENERO VALUES (default,'POP')

INSERT INTO CANCION VALUES (default, 'Por Supuesto', 'Marina Sena', 'didz', 1);

INSERT INTO CANCION VALUES (default, 'Bitch', 'Allie X', 'didz', 1);
INSERT INTO CANCION VALUES (default, 'Pretty', 'Coco & Clair Clair', 'didz', 1);

INSERT INTO LISTA_REPRODUCCION VALUES (default, 'Favs 2023', 'didz');

INSERT INTO LISTA_CANCION VALUES (1,1);
INSERT INTO LISTA_CANCION VALUES (1,4);
INSERT INTO LISTA_CANCION VALUES (1,5);

SELECT NOMBRE_APELLIDO FROM USUARIO WHERE NICKNAME LIKE "didz";

SELECT * FROM lista_cancion;

SELECT L. DESCRIPCION, C.NOMBRE
FROM lista_reproduccion L JOIN lista_cancion LC
ON L.ID LIKE LC.LISTA_ID
JOIN CANCION C 
ON LC. CANCION_ID LIKE C.ID
WHERE L.NICKNAME LIKE "didz"