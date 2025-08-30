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
    Ciclo NVARCHAR(20),
    Universidad NVARCHAR(100),
    CarreraID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carreras(CarreraID)
);

-- Tabla de Profesores
CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(100)
);

-- Tabla de Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

-- Tabla de Notas
CREATE TABLE Notas (
    NotaID INT PRIMARY KEY IDENTITY(1,1),
    AlumnoID INT,
    CursoID INT,
    Nota DECIMAL(4,2),
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Tabla de Aulas
CREATE TABLE Aulas (
    IdAula INT IDENTITY(1,1) PRIMARY KEY,
    CodigoAula VARCHAR(10) NOT NULL,
    Capacidad INT NOT NULL
);

-- ===================================
-- DATOS 
-- ===================================

-- Insertar Profesores
INSERT INTO Profesores (Nombre, Apellido, Especialidad)
VALUES
('Juan', 'Pérez', 'Matemáticas'),
('María', 'López', 'Programación'),
('Carlos', 'Sánchez', 'Base de Datos'),
('Sofía', 'Ramírez', 'Lenguaje'),
('Héctor', 'Gómez', 'Cálculo'),
('Patricia', 'Fernández', 'Estadística'),
('Alberto', 'Castro', 'Física'),
('Laura', 'Medina', 'Historia');

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

-- Insertar Carreras
INSERT INTO Carreras (NombreCarrera, Facultad) VALUES
('Ingeniería de Software', 'Ingeniería'),
('Medicina', 'Ciencias de la Salud'),
('Arquitectura', 'Ingeniería y Diseño'),
('Contabilidad', 'Ciencias Económicas'),
('Psicología', 'Ciencias Sociales'),
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

-- Insertar Alumnos
INSERT INTO Alumnos (Nombre, Apellido, Edad, Ciclo, Universidad, CarreraID)
VALUES
('Luis', 'Torres', 20, '3er Ciclo', 'Universidad Nacional', 1),
('Andrea', 'Gómez', 19, '2do Ciclo', 'Universidad Nacional', 1),
('Pedro', 'Ruiz', 21, '4to Ciclo', 'Universidad Nacional', 3),
('Ana', 'Torres', 18, '1er Ciclo', 'Universidad Nacional', 5),
('Diego', 'Morales', 22, '4to Ciclo', 'Universidad Nacional', 8),
('Lucía', 'Ramos', 20, '3er Ciclo', 'Universidad Nacional', 1),
('Martín', 'Vega', 19, '2do Ciclo', 'Universidad Nacional', 7),
('Valeria', 'Soto', 21, '5to Ciclo', 'Universidad Nacional', 4);

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

-- Insertar Aulas
INSERT INTO Aulas (CodigoAula, Capacidad)
VALUES
('A101', 40),
('B202', 35),
('C303', 50),
('D404', 25);

