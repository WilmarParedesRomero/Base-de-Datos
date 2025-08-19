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
('Carlos Ruiz', 21, '3er Ciclo');

-- Insertar cursos
INSERT INTO Cursos (NombreCurso, Creditos, Profesor)
VALUES
('Matemáticas I', 4, 'Dr. Ramírez'),
('Comunicación Oral', 3, 'Lic. Torres'),
('Programación I', 5, 'Ing. Fernández'),
('Física I', 4, 'Dr. Morales');

-- Insertar notas 
INSERT INTO Notas (AlumnoID, CursoID, Nota)
VALUES
(1, 1, 15.5), -- Juan en Matemáticas I
(1, 2, 14.0), -- Juan en Comunicación Oral
(2, 3, 18.0), -- María en Programación I
(3, 4, 12.5); -- Carlos en Física I
