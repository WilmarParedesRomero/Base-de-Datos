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

-- Agregar nuevas carreras
INSERT INTO Carreras (NombreCarrera, DuracionAnios)
VALUES ('Ingeniería de Software', 5),
       ('Psicología', 5);

-- Agregar nuevos alumnos
INSERT INTO Alumnos (Nombre, Apellido, Edad, Universidad, Ciclo, CarreraID)
VALUES ('Christian', 'Morales', 21, 'Universidad Nacional', '5to Ciclo', 1),
       ('Lesly', 'Ramos', 20, 'Universidad Nacional', '4to Ciclo', 2);

-- Agregar profesor
INSERT INTO Profesores (Nombre, Especialidad)
VALUES ('Héctor Gómez', 'Cálculo');

-- Agregar curso
INSERT INTO Cursos (NombreCurso, Creditos, ProfesorID)
VALUES ('Cálculo Avanzado', 5, 1);

-- Agregar aula
INSERT INTO Aulas (NombreAula, Capacidad)
VALUES ('A101', 40);

-- Agregar matrícula
INSERT INTO Matriculas (AlumnoID, CursoID, FechaMatricula)
VALUES (1, 1, GETDATE());

-- Agregar nota
INSERT INTO Notas (MatriculaID, Nota)
VALUES (1, 18.5);

-- Cambiar la nota del alumno matriculado con ID 1
UPDATE Notas
SET Nota = 19.0
WHERE MatriculaID = 1;

-- Cambiar el ciclo de Christian a "6to Ciclo"
UPDATE Alumnos
SET Ciclo = '6to Ciclo'
WHERE Nombre = 'Christian';

-- Cambiar el estado de la matrícula a "Finalizado"
UPDATE Matriculas
SET Estado = 'Finalizado'
WHERE MatriculaID = 1;

-- Eliminar una nota baja
DELETE FROM Notas
WHERE Nota < 12;

-- Eliminar un curso que ya no se dicta
DELETE FROM Cursos
WHERE NombreCurso = 'Historia Contemporánea';

-- TRY--
USE UniversidadDB;
GO

BEGIN TRY
    BEGIN TRANSACTION; -- Inicia la transacción

    PRINT 'Iniciando proceso de matrícula...';

    -- Insertar un nuevo alumno
    INSERT INTO Alumnos (Nombre, Apellido, Edad, Universidad, Ciclo, CarreraID)
    VALUES ('Camila', 'Herrera', 19, 'Universidad Nacional', 2, 1);

    DECLARE @NuevoAlumnoID INT = SCOPE_IDENTITY();  -- Captura el ID del alumno recién insertado

    PRINT 'Alumno insertado correctamente con ID: ' + CAST(@NuevoAlumnoID AS NVARCHAR(10));

    --  Registrar su matrícula en un curso existente
    INSERT INTO Matriculas (AlumnoID, CursoID, FechaMatricula, Estado)
    VALUES (@NuevoAlumnoID, 2, GETDATE(), 'Activo');  -- CursoID 2 = Programación I

    DECLARE @NuevaMatriculaID INT = SCOPE_IDENTITY();

    PRINT 'Matrícula creada con ID: ' + CAST(@NuevaMatriculaID AS NVARCHAR(10));

    --  Registrar una nota inicial para esa matrícula
    INSERT INTO Notas (MatriculaID, Nota)
    VALUES (@NuevaMatriculaID, 17.5);

    PRINT 'Nota registrada correctamente.';

    --  Si todo sale bien, se confirma la transacción
    COMMIT TRANSACTION;
    PRINT 'Transacción completada exitosamente.';

END TRY
BEGIN CATCH
    --  Si ocurre un error, se revierte todo
    PRINT 'Error detectado. Revirtiendo cambios...';
    ROLLBACK TRANSACTION;

    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
END CATCH;
GO
-- Iniciando proceso de matrícula...
-- Alumno insertado correctamente con ID: 9
-- Matrícula creada con ID: 9
-- Nota registrada correctamente.
-- Transacción completada exitosamente.

 -- Tabla de   Relaciones 
1:N Carreras → Alumnos
1:N Profesores → Cursos
1:N Cursos → Matrículas
1:N Alumnos → Matrículas
1:N Matrículas → Notas
N:M Alumnos ↔ Cursos
------------------------
    
USE UniversidadDB;
GO

SELECT 
    a.AlumnoID,
    a.Nombre + ' ' + a.Apellido AS Alumno,
    m.MatriculaID,
    m.CursoID,
    m.Estado
FROM Alumnos a
LEFT JOIN Matriculas m
    ON a.AlumnoID = m.AlumnoID;
-- Muestra en pantalla 
--AlumnoID	Alumno	MatriculaID	CursoID	Estado
--1	Luis Torres	1	1	Activo
--2	Andrea Gómez	2	2	Activo
--9	Camila Herrera	NULL	NULL	NULL

SELECT 
    c.CursoID,
    c.NombreCurso,
    m.MatriculaID,
    m.AlumnoID
FROM Matriculas m
RIGHT JOIN Cursos c
    ON m.CursoID = c.CursoID;
-- Muestra en pantalla 
--CursoID	NombreCurso	MatriculaID	AlumnoID
--1	Álgebra Lineal	1	1
--2	Programación I	2	2
--9	Filosofía Moderna	NULL	NULL






