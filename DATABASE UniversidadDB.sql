-- Crear la base de datos
CREATE DATABASE UniversidadDB;
GO
 
-- Usar la base de datos
USE UniversidadDB;
GO
   
-- ===================================
-- TABLAS
-- ===================================

-- Tabla Carreras
CREATE TABLE Carreras (
    CarreraID INT PRIMARY KEY IDENTITY(1,1),
    NombreCarrera NVARCHAR(100) NOT NULL,
    DuracionAnios INT NOT NULL
);

-- Tabla Alumnos
CREATE TABLE Alumnos (
    AlumnoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Edad INT,
    Universidad NVARCHAR(100),
    Ciclo INT,
    CarreraID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carreras(CarreraID)
);

-- Tabla Profesores
CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100)
);

-- Tabla Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

-- Tabla Aulas
CREATE TABLE Aulas (
    AulaID INT PRIMARY KEY IDENTITY(1,1),
    NombreAula NVARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL
);

-- ========================================
-- NUEVA TABLA: MATRICULAS
-- ========================================
CREATE TABLE Matriculas (
    MatriculaID INT PRIMARY KEY IDENTITY(1,1),
    AlumnoID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaMatricula DATE DEFAULT GETDATE(),
    Estado NVARCHAR(20) DEFAULT 'Activo',
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- ========================================
-- TABLA NOTAS (ahora ligada a Matrículas)
-- ========================================
CREATE TABLE Notas (
    NotaID INT PRIMARY KEY IDENTITY(1,1),
    MatriculaID INT NOT NULL,
    Nota DECIMAL(4,2),
    FOREIGN KEY (MatriculaID) REFERENCES Matriculas(MatriculaID)
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

-- Insertar Matrículas
INSERT INTO Matriculas (AlumnoID, CursoID, AulaID, Ciclo, FechaMatricula)
VALUES
(1, 1, 1, '3er Ciclo', '2025-03-01'), -- Luis en Álgebra Lineal (A101)
(2, 2, 2, '2do Ciclo', '2025-03-02'), -- Andrea en Programación I (B202)
(3, 3, 3, '4to Ciclo', '2025-03-03'), -- Pedro en Base de Datos I (C303)
(4, 4, 4, '1er Ciclo', '2025-03-04'), -- Ana en Literatura Universal (D404)
(5, 5, 1, '4to Ciclo', '2025-03-05'), -- Diego en Cálculo II (A101)
(6, 6, 2, '3er Ciclo', '2025-03-06'), -- Lucía en Estadística I (B202)
(7, 7, 3, '2do Ciclo', '2025-03-07'), -- Martín en Física II (C303)
(8, 8, 4, '5to Ciclo', '2025-03-08'); -- Valeria en Historia Contemporánea (D404)

-- Mostrar todos los alumnos
SELECT * FROM Alumnos;

-- Mostrar todos los cursos
SELECT * FROM Cursos;

-- Mostrar todas las carreras
SELECT * FROM Carreras;

-- Mostrar todas las matrículas
SELECT * FROM Matriculas;

-- Alumnos de Ingeniería de Software
SELECT a.Nombre, a.Apellido
FROM Alumnos a
JOIN Carreras c ON a.CarreraID = c.CarreraID
WHERE c.NombreCarrera = 'Ingeniería de Software';

-- Cursos con más de 4 créditos
SELECT NombreCurso, Creditos
FROM Cursos
WHERE Creditos > 4;

-- Alumnos mayores de 20 ordenados por edad
SELECT Nombre, Apellido, Edad
FROM Alumnos
WHERE Edad > 20
ORDER BY Edad DESC;




