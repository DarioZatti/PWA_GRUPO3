// CREO LOS NODOS Alumno, Aula, Materia

CREATE (a1:Alumno{Nombre:'Alumno1', Edad:21, DNI:26000001, Nacionalidad: 'Argentina', Sexo: 'Masculino'}),
(a2:Alumno{Nombre:'Alumno2', Edad:22, DNI:26000002, Nacionalidad: 'Argentina', Sexo: 'Femenino'}),
(a3:Alumno{Nombre:'Alumno3', Edad:23, DNI:26000003, Nacionalidad: 'Argentina', Sexo: 'Masculino'}),
(a4:Alumno{Nombre:'Alumno4', Edad:24, DNI:26000004, Nacionalidad: 'Argentina', Sexo: 'Femenino'}),
(a5:Alumno{Nombre:'Alumno5', Edad:25, DNI:26000005, Nacionalidad: 'Argentina', Sexo: 'Masculino'}),
(a6:Alumno{Nombre:'Alumno6', Edad:26, DNI:26000006, Nacionalidad: 'Argentina', Sexo: 'Femenino'}),
(a7:Alumno{Nombre:'Alumno7', Edad:27, DNI:26000007, Nacionalidad: 'Argentina', Sexo: 'Masculino'}),
(a8:Alumno{Nombre:'Alumno8', Edad:28, DNI:96000008, Nacionalidad: 'Alemania', Sexo: 'Femenino'}),
(a9:Alumno{Nombre:'Alumno9', Edad:29, DNI:96000009, Nacionalidad: 'Italia', Sexo: 'Masculino'}),
(a10:Alumno{Nombre:'Alumno10', Edad:30, DNI:96000010, Nacionalidad: 'Brasil', Sexo: 'Femenino'}),
(a11:Alumno{Nombre:'Alumno11', Edad:31, DNI:96000011, Nacionalidad: 'Chile', Sexo: 'Masculino'}),
(a12:Alumno{Nombre:'Alumno12', Edad:32, DNI:96000012, Nacionalidad: 'Bolivia', Sexo: 'Femenino'}),
(a13:Alumno{Nombre:'Alumno13', Edad:33, DNI:96000013, Nacionalidad: 'Paraguay', Sexo: 'Masculino'}),
(a14:Alumno{Nombre:'Alumno14', Edad:34, DNI:96000014, Nacionalidad: 'Uruguay', Sexo: 'Femenino'}),
(a15:Alumno{Nombre:'Alumno15', Edad:35, DNI:26000015, Nacionalidad: 'Argentina', Sexo: 'Masculino'}),
(a331:Aula{Nombre:'331', Capacidad:20, Ocupado: 0}), (a332:Aula{Nombre:'332', Capacidad:25, Ocupado: 0}),
(a333:Aula{Nombre:'333', Capacidad:30, Ocupado: 0}), (a334:Aula{Nombre:'334', Capacidad:35, Ocupado: 0}),
(a335:Aula{Nombre:'335', Capacidad:60, Ocupado: 0}), (a341:Aula{Nombre:'341', Capacidad:20, Ocupado: 0}),
(a342:Aula{Nombre:'342', Capacidad:25, Ocupado: 0}), (a343:Aula{Nombre:'343', Capacidad:30, Ocupado: 0}), 
(a344:Aula{Nombre:'344', Capacidad:45, Ocupado: 0}), (a345:Aula{Nombre:'345', Capacidad:60, Ocupado: 0}),
(m1:Materia{Nombre:'Materia1', CantidadDeAlumnos:15, Alocada: 0}), (m2:Materia{Nombre:'Materia2', CantidadDeAlumnos:20, Alocada: 0}),
(m3:Materia{Nombre:'Materia3', CantidadDeAlumnos:25, Alocada: 0}), (m4:Materia{Nombre:'Materia4', CantidadDeAlumnos:30, Alocada: 0}),
(m5:Materia{Nombre:'Materia5', CantidadDeAlumnos:35, Alocada: 0}), (m6:Materia{Nombre:'Materia6', CantidadDeAlumnos:40, Alocada: 0}),
(m7:Materia{Nombre:'Materia7', CantidadDeAlumnos:45, Alocada: 0}), (m8:Materia{Nombre:'Materia8', CantidadDeAlumnos:15, Alocada: 0}),
(m9:Materia{Nombre:'Materia9', CantidadDeAlumnos:20, Alocada: 0}), (m10:Materia{Nombre:'Materia10', CantidadDeAlumnos:50, Alocada: 0})



// CREO LAS RELACIONES Materia se dicta en Aula

CREATE (m1)-[Asignam1:SeDictaEn]->(a341), (m2)-[Asignam2:SeDictaEn]->(a331), (m3)-[Asignam3:SeDictaEn]->(a332),
(m4)-[Asignam4:SeDictaEn]->(a333), (m5)-[Asignam5:SeDictaEn]->(a334), (m6)-[Asignam6:SeDictaEn]->(a335),
(m7)-[Asignam7:SeDictaEn]->(a344), (m8)-[Asignam8:SeDictaEn]->(a342), (m9)-[Asignam9:SeDictaEn]->(a343),
(m10)-[Asignam10:SeDictaEn]->(a345)

// CREO LAS RELACIONES Alumno cursa la Materia

CREATE (a1)-[Asignaa1m1:CursaLa]->(m1), (a2)-[Asignaa2m1:CursaLa]->(m1),(a3)-[Asignaa3m1:CursaLa]->(m1),
(a4)-[Asignaa4m1:CursaLa]->(m1), (a5)-[Asignaa5m1:CursaLa]->(m1)

*** CONSULTAS ***

MATCH (n:Aula) 
RETURN n 


MATCH (n:Aula)
RETURN n.Ocupado

MATCH (n:Materia)
RETURN n.Alocada

MATCH (n:Materia)
RETURN n.Nombre
-------------

CREATE (m1)-[Asignam1:SeDictaEn]->(a331)

MATCH (m1:Materia{Nombre:'Materia1', CantidadDeAlumnos:15, Alocada: 0})
SET m1.Alocada = 1 

MATCH (a331:Aula{Nombre:'331', Capacidad:20, Ocupado: 0})
SET a331.Ocupado = 1 

MATCH (m2:Materia{Nombre:'Materia2', CantidadDeAlumnos:20, Alocada: 0})
SET m2.Alocada = 1 

MATCH (a341:Aula{Nombre:'341', Capacidad:20, Ocupado: 0})
SET a341.Ocupado = 1 

MATCH (m3:Materia{Nombre:'Materia3', CantidadDeAlumnos:25, Alocada: 0})
SET m3.Alocada = 1 

MATCH (a332:Aula{Nombre:'332', Capacidad:25, Ocupado: 0})
SET a332.Ocupado = 1 

