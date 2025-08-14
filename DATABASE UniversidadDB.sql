CREATE DATABASE UniversidadDB;
GO

USE UniversidadDB;
GO

CREATE TABLE Alumnos (
    AlumnoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Edad INT,
    Ciclo INT
);

CREATE TABLE Notas (
    NotaID INT IDENTITY(1,1) PRIMARY KEY,
    AlumnoID INT NOT NULL,
    Curso NVARCHAR(100) NOT NULL,
    Nota DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID)
);

INSERT INTO Alumnos (Nombre, Edad, Ciclo)
VALUES
('Juan Pérez', 19, '1'),
('María López', 20, '2'),
('Carlos Ruiz', 21, '3');

INSERT INTO Notas (AlumnoID, Curso, Nota)
VALUES
(1, 'Matemáticas I', 15.5),
(1, 'Comunicación Oral', 14.0),
(2, 'Programación I', 18.0),
(3, 'Física I', 12.5);