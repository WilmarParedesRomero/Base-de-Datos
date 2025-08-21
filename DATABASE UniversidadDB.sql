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
    Ciclo NVARCHAR(50) 
);

-- Tabla Profesores
CREATE TABLE Profesores (
    ProfesorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100),
    Email NVARCHAR(100)
);

-- Tabla Cursos
CREATE TABLE Cursos (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
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

-- Insertar profesores
INSERT INTO Profesores (Nombre, Especialidad, Email)
VALUES
('Dr. Ramírez', 'Matemáticas', 'ramirez@uni.edu'),
('Lic. Torres', 'Comunicación', 'torres@uni.edu'),
('Ing. Fernández', 'Programación', 'fernandez@uni.edu'),
('Dr. Morales', 'Física', 'morales@uni.edu'),
('Mg. Gutiérrez', 'Historia', 'gutierrez@uni.edu'),
('Ing. Castillo', 'Bases de Datos', 'castillo@uni.edu');

-- Insertar cursos (con relación a profesores)
INSERT INTO Cursos (NombreCurso, Creditos, ProfesorID)
VALUES
('Matemáticas I', 4, 1),
('Comunicación Oral', 3, 2),
('Programación I', 5, 3),
('Física I', 4, 4),
('Historia Universal', 3, 5),
('Base de Datos', 5, 6);

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
