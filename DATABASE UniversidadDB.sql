-- Crear la base de datos
CREATE DATABASE UniversidadDB;
GO

-- Usar la base
USE UniversidadDB;
GO

-- Tabla Alumnos
CREATE TABLE Alumnos (
    AlumnoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Edad INT,
    Ciclo NVARCHAR(50) -- Ejemplo: "1er Ciclo", "2do Ciclo"
);

-- Tabla Cursos
CREATE TABLE Cursos (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    Profesor NVARCHAR(100) -- En el futuro será otra tabla relacionada
);

-- Tabla Notas
CREATE TABLE Notas (
    NotaID INT IDENTITY(1,1) PRIMARY KEY,
    AlumnoID INT NOT NULL,
    CursoID INT NOT NULL,
    Nota DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Insertar alumnos
INSERT INTO Alumnos (Nombre, Edad, Ciclo)
VALUES
('Juan Pérez', 19, '1er Ciclo'),
('María López', 20, '2do Ciclo'),
('Carlos Ruiz', 21, '3er Ciclo'),
('Ana Torres', 18, '1er Ciclo'),
('Luis Fernández', 22, '4to Ciclo'),
('Sofía Ramírez', 19, '2do Ciclo');

-- Insertar cursos
INSERT INTO Cursos (NombreCurso, Creditos, Profesor)
VALUES
('Matemáticas I', 4, 'Dr. Ramírez'),
('Comunicación Oral', 3, 'Lic. Torres'),
('Programación I', 5, 'Ing. Fernández'),
('Física I', 4, 'Dr. Morales'),
('Historia Universal', 3, 'Mg. Gutiérrez'),
('Base de Datos', 5, 'Ing. Castillo');

-- Insertar notas 
INSERT INTO Notas (AlumnoID, CursoID, Nota)
VALUES
-- Juan Pérez
(1, 1, 15.5), 
(1, 2, 14.0),
(1, 3, 13.0),

-- María López
(2, 3, 18.0),
(2, 5, 16.5),
(2, 6, 19.0),

-- Carlos Ruiz
(3, 4, 12.5),
(3, 1, 14.5),
(3, 6, 15.0),

-- Ana Torres
(4, 2, 17.0),
(4, 5, 18.5),
(4, 1, 16.0),

-- Luis Fernández
(5, 3, 14.0),
(5, 6, 13.5),
(5, 4, 12.0),

-- Sofía Ramírez
(6, 1, 19.0),
(6, 2, 18.0),
(6, 5, 17.5);

