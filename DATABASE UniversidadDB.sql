-- Crear la base de datos
CREATE DATABASE UniversidadDB;
GO

-- Usar la base de datos
USE UniversidadDB;
GO

-- Crear tabla Profesores
CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100)
);

-- Crear tabla Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

-- Crear tabla Alumnos
CREATE TABLE Alumnos (
    AlumnoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Edad INT,
    Ciclo NVARCHAR(50)
);

-- Crear tabla Notas
CREATE TABLE Notas (
    NotaID INT PRIMARY KEY IDENTITY(1,1),
    AlumnoID INT,
    CursoID INT,
    Nota DECIMAL(4,2),
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Insertar Profesores
INSERT INTO Profesores (Nombre, Especialidad)
VALUES
('Juan Pérez', 'Matemáticas'),
('María López', 'Programación'),
('Carlos Sánchez', 'Base de Datos'),
('Sofía Ramírez', 'Lenguaje'),
('Héctor Gómez', 'Cálculo'),
('Patricia Fernández', 'Estadística'),
('Alberto Castro', 'Física'),
('Laura Medina', 'Historia');

-- Insertar Cursos
INSERT INTO Cursos (NombreCurso, Creditos, ProfesorID)
VALUES
('Álgebra Lineal', 4, 1),       
('Programación I', 5, 2),       
('Base de Datos I', 4, 3),      
('Literatura Universal', 3, 4),
('Cálculo II', 5, 5),          
('Estadística I', 4, 6),       
('Física II', 5, 7),           
('Historia Contemporánea', 3, 8);

-- Insertar Alumnos
INSERT INTO Alumnos (Nombre, Edad, Ciclo)
VALUES
('Luis Torres', 20, '3er Ciclo'),
('Andrea Gómez', 19, '2do Ciclo'),
('Pedro Ruiz', 21, '4to Ciclo'),
('Ana Torres', 18, '1er Ciclo'),
('Diego Morales', 22, '4to Ciclo'),
('Lucía Ramos', 20, '3er Ciclo'),
('Martín Vega', 19, '2do Ciclo'),
('Valeria Soto', 21, '5to Ciclo');

-- Insertar Notas
INSERT INTO Notas (AlumnoID, CursoID, Nota)
VALUES
(1, 1, 15.5), -- Luis en Álgebra Lineal
(2, 2, 18.0), -- Andrea en Programación I
(3, 3, 14.0), -- Pedro en Base de Datos I
(4, 4, 16.8), -- Ana en Literatura Universal
(5, 5, 13.5), -- Diego en Cálculo II
(6, 6, 18.0), -- Lucía en Estadística I
(7, 7, 11.0), -- Martín en Física II
(8, 8, 19.0); -- Valeria en Historia Contemporánea
