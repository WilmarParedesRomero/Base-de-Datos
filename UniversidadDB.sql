
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
