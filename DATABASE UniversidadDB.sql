-- Crear la base de datos
CREATE DATABASE UniversidadDB;
GO

-- Usar la base de datos
USE UniversidadDB;
GO
    
-- ===================================
-- TABLAS
-- ===================================
    
-- Tabla de Carreras
CREATE TABLE Carreras (
    CarreraID INT PRIMARY KEY IDENTITY(1,1),
    NombreCarrera NVARCHAR(100) NOT NULL,
    Facultad NVARCHAR(100)
);

-- Tabla de Alumnos
CREATE TABLE Alumnos (
    AlumnoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Edad INT,
    Universidad NVARCHAR(100),
    CarreraID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carreras(CarreraID)
);

-- Tabla de Profesores
CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Especialida

-- ===================================
-- DATOS 
-- ===================================
    
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

-- Insertar datos en Carreras
INSERT INTO Carreras (NombreCarrera, Facultad) VALUES
('Ingeniería de Software', 'Ingeniería'),
('Medicina', 'Ciencias de la Salud'),
('Arquitectura', 'Ingeniería y Diseño'),
('Contabilidad', 'Ciencias Económicas'),
('Psicología', 'Ciencias Sociales');
('Derecho', 'Ciencias Jurídicas'),
('Administración de Empresas', 'Ciencias Económicas'),
('Ingeniería Civil', 'Ingeniería'),
('Biología', 'Ciencias Naturales'),
('Educación Primaria', 'Ciencias de la Educación'),
('Enfermería', 'Ciencias de la Salud'),
('Diseño Gráfico', 'Artes y Diseño'),
('Física', 'Ciencias Exactas'),
('Sociología', 'Ciencias Sociales'),
('Periodismo', 'Ciencias de la Comunicación');
