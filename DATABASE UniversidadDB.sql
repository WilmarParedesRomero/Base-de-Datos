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
('Sofía Ramírez', 19, '2do Ciclo'),
('Pedro Salazar', 20, '3er Ciclo'),
('Daniela Vargas', 21, '4to Ciclo'),
('Andrés Castillo', 18, '1er Ciclo'),
('Valeria Soto', 19, '2do Ciclo'),
('Miguel Rojas', 23, '5to Ciclo'),
('Elena Chávez', 21, '3er Ciclo');

-- Insertar profesores 
INSERT INTO Profesores (Nombre, Especialidad, Email)
VALUES
('Dr. Ramírez', 'Matemáticas', 'ramirez@uni.edu'),
('Lic. Torres', 'Comunicación', 'torres@uni.edu'),
('Ing. Fernández', 'Programación', 'fernandez@uni.edu'),
('Dr. Morales', 'Física', 'morales@uni.edu'),
('Mg. Gutiérrez', 'Historia', 'gutierrez@uni.edu'),
('Ing. Castillo', 'Bases de Datos', 'castillo@uni.edu'),
('Dr. Salinas', 'Química', 'salinas@uni.edu'),
('Lic. Paredes', 'Inglés', 'paredes@uni.edu'),
('Dr. Rivas', 'Estadística', 'rivas@uni.edu'),
('Ing. Mendoza', 'Redes', 'mendoza@uni.edu');

-- Insertar cursos 
INSERT INTO Cursos (NombreCurso, Creditos, ProfesorID)
VALUES
('Matemáticas I', 4, 1),
('Comunicación Oral', 3, 2),
('Programación I', 5, 3),
('Física I', 4, 4),
('Historia Universal', 3, 5),
('Base de Datos', 5, 6),
('Química General', 4, 7),
('Inglés Técnico', 3, 8),
('Estadística I', 4, 9),
('Redes y Comunicaciones', 5, 10);

-- Insertar notas 
INSERT INTO Notas (AlumnoID, CursoID, Nota)
VALUES
-- Juan Pérez (1)
(1, 1, 15.5), (1, 2, 14.0), (1, 3, 13.0), (1, 8, 16.5),

-- María López (2)
(2, 3, 18.0), (2, 5, 16.5), (2, 6, 19.0), (2, 9, 17.5),

-- Carlos Ruiz (3)
(3, 4, 12.5), (3, 1, 14.5), (3, 6, 15.0), (3, 7, 13.0),

-- Ana Torres (4)
(4, 2, 17.0), (4, 5, 18.5), (4, 1, 16.0), (4, 10, 15.5),

-- Luis Fernández (5)
(5, 3, 14.0), (5, 6, 13.5), (5, 4, 12.0), (5, 9, 16.0),

-- Sofía Ramírez (6)
(6, 1, 19.0), (6, 2, 18.0), (6, 5, 17.5), (6, 8, 18.5),

-- Pedro Salazar (7)
(7, 3, 12.5), (7, 6, 15.0), (7, 7, 14.0), (7, 10, 13.5),

-- Daniela Vargas (8)
(8, 4, 16.5), (8, 1, 15.0), (8, 9, 17.0), (8, 8, 19.0),

-- Andrés Castillo (9)
(9, 2, 14.5), (9, 5, 16.0), (9, 6, 15.5), (9, 7, 13.5),

-- Valeria Soto (10)
(10, 3, 18.5), (10, 9, 17.5), (10, 1, 16.5), (10, 8, 19.0),

-- Miguel Rojas (11)
(11, 10, 15.0), (11, 6, 14.5), (11, 3, 16.0), (11, 4, 13.5),

-- Elena Chávez (12)
(12, 5, 18.0), (12, 2, 17.0), (12, 7, 14.5), (12, 1, 15.5);


