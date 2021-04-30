Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra',
		'user1',
		'user2',
		'preg1',
		'preg2',
		'preg3',
		'resp1',
		'resp2',
		'reaccion1',
		'reaccion2',
		'topicFutbol',
		'topicBasquet',
		'topicInformatica',
		'user3'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestCuOOra >> setUp [
	cuOOra := CuOOra new.
	topicFutbol := Topico
		newConNombre: 'Futbol'
		yDesc: 'Se habla de partidos de champions'.
	topicBasquet := Topico newConNombre: 'Basquet' yDesc: 'Se habla de Basquet'.
	topicInformatica := Topico newConNombre: 'Informatica' yDesc: 'Se habla de PC'.
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1'.
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: 'pass2'.
	user3 := Usuario nuevoConNombre: 'Diego' yContraseña: 'pass3'.
	resp1 := Respuesta newCon: 'Tenes razon' Usuario: user1.
	preg1 := Pregunta newConTitulo: 'Messi' yTexto: 'Messi es el mejor' relacionadoA: topicFutbol.
	preg2 := Pregunta
	newConTitulo: 'Campazzo'
	yTexto: 'Campazzo es el mejor'
	relacionadoA: topicBasquet.
	preg3 := Pregunta newConTitulo: 'Robert C. Martin ' yTexto: 'Crack de informatica' relacionadoA: topicInformatica.
	reaccion1 := Reaccion newConEstado: true Usuario: user2.
	resp1 := Respuesta newCon:'Tu pregunta esta buena' Usuario:user2.
	resp2 := Respuesta newCon:'Que??????' Usuario:user3.
"	cuOOra agregarTopico: topic1.
	cuOOra agregarTopico: topic2.
	cuOOra agregarUsuario: user1.
	cuOOra agregarUsuario: user2."
	"
	preg1 agregarRespuesta: resp2.
	preg2 agregarRespuesta: resp1.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	user2 agregarPregunta: preg3.
	user1 agregarTopicoDeInteres: topic1.
	user1 seguirUsuario: user2.
	preg1 agregarReaccion: reaccion1 ."
]

{ #category : #testing }
TestCuOOra >> testAgregarPreguntaConTituloDescripcionTopicosUsuario [
	cuOOra agregarUsuario:user1.
   cuOOra agregarPreguntaConTitulo: 'Un titulo' descripcion:'Desc'  topicos:'Futbol' usuario:user1. 
	self assert:(cuOOra obtenerPreguntas size > 0)
	
]

{ #category : #testing }
TestCuOOra >> testAgregarTopico [
	"En este test prueba el funcionamiento de del metodo agregar topico de la clase cuOOra. Se crea un topico, se agrega a la instacia cuOOra, luego se verifica que esta este incluida en los topicos de cuOOra"
	|topicNuevo|
	topicNuevo := Topico newConNombre: 'Testing' yDesc: 'Se habla de test'.
	cuOOra agregarTopico: topicNuevo.
	self assert: (cuOOra topicos includes: topicNuevo)
]

{ #category : #testing }
TestCuOOra >> testAgregarUsuario [
	"En este test se prueba el metodo agregar usuario de la clase cuOOra. Se crean dos usuarios, luego se agregan a la instacia de cuOOra y finalmete se verifica si estos estan incluidos en los usuarios de cuOOra"
	| userNew1 userNew2 |
	userNew1 := Usuario nuevoConNombre: 'Pepe' yContraseña: '123'.
	userNew2 := Usuario nuevoConNombre: 'Pablo' yContraseña: '123'.
	cuOOra
		agregarUsuario: userNew1;
		agregarUsuario: userNew2.
	self
		assert:
			(cuOOra usuarios
				includes: userNew1;
				includes: userNew2)
]

{ #category : #testing }
TestCuOOra >> testCalcularPuntajeDeRespuestas [
	| auxCol |
	auxCol := OrderedCollection new.
	resp1 agregarReaccion: reaccion1.
	auxCol add: resp1.
	self assert:(cuOOra calcularPuntajeDeRespuestas: auxCol) = 51
]

{ #category : #testing }
TestCuOOra >> testObtenerDeUnUserSusRespuestas [
	"En este test se prueba el funcionamiento del metodo obtener las respuestas de un usuario, se crea una instacia de usuario, respuesta, topico y pregunta. Se agregan a cuOOra"
	cuOOra agregarTopico: topicFutbol.
	cuOOra agregarTopico: topicBasquet.
	cuOOra agregarUsuario: user1.
	cuOOra agregarUsuario: user2.
   user1 agregarPregunta: preg1.
	preg1 agregarRespuesta: resp1.
	self
		assert: ((cuOOra obtenerRespuestasDelUsuario: user2) includes: resp1)
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasDeTopico [
	"En este test se prueba el funcionamiento del metodo obtener preguntas de topico de la clase cuOOra"
	cuOOra agregarUsuario: user1.
	cuOOra agregarTopico: topicFutbol.
	cuOOra agregarTopico: topicBasquet.
	user1 agregarPregunta:preg1; agregarPregunta:preg2.
	
	self
		assert: ((cuOOra obtenerPreguntasDeTopico: topicFutbol) includes: preg1).
	self
		assert: ((cuOOra obtenerPreguntasDeTopico: topicBasquet) includes: preg2)
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasRelevantesParaUsuario [
	"En este test se prueba el funcionamiento del metodo obtener preguntas relevantes para un usuario"
	"Se verifica que las preguntas obtenidas por el metedo sean correctas y solo sean esas"
	cuOOra agregarUsuario: user1.
	cuOOra agregarUsuario: user2.
	cuOOra agregarUsuario: user3.
	user1 agregarTopicoDeInteres: topicFutbol.
	user1 seguirUsuario: user2.
	user2 agregarPregunta: preg3 .
	user3 agregarPregunta: preg1.
	

	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user1) includes: preg1).
	self
		assert: ((cuOOra preguntasRelevantesParaUsuario: user1) includes: preg3).
	self
		assert: (cuOOra preguntasRelevantesParaUsuario: user1) size
		identicalTo: 2
]

{ #category : #testing }
TestCuOOra >> testObtenerPuntajeDelUsuario [
	"En este test se prueba el funcionamiento del metodo calcularPuntajeDelUsuario, se crean instancias de las clases usuario, reaccion, respuesta, topico y pregunta"

	| reaccionNew respAux|
	reaccionNew := Reaccion newConEstado: false Usuario: user2.
	cuOOra agregarUsuario: user1.
	cuOOra agregarUsuario: user2.
	preg2 agregarReaccion: reaccion1.
	user2 agregarPregunta: preg1.
	respAux := (Respuesta newCon:'Una respuesta' Usuario:user1).
	preg1 agregarRespuesta: respAux.
	user1 agregarPregunta: preg2.
	
	"Se agregan una reaccion para modificar el puntaje, el usuario agrego una pregunta(20) y una respuesta(50), la pregunta tiene una like(1) da un total de 71"
	self assert: (cuOOra obtenerPuntajeDelUsuario: user1) identicalTo: 71.
	"Se agrega otra reaccion para modifical el puntaje a 70, un dislike a la respuesta"
	respAux agregarReaccion: reaccionNew.
	self assert: (cuOOra obtenerPuntajeDelUsuario: user1) identicalTo: 70
]

{ #category : #testing }
TestCuOOra >> testObtenerRespuestasDelUsuario [
	"En este test se prueba el funcionamiento del metodo obtener las respuestas de un usuario, se crea una instacia de usuario, respuesta, topico y pregunta. Se agregan a cuOOra"
	cuOOra agregarTopico: topicFutbol.
	cuOOra agregarTopico: topicBasquet.
	cuOOra agregarUsuario: user1.
	cuOOra agregarUsuario: user2.
   user1 agregarPregunta: preg1.
	preg1 agregarRespuesta: resp1.
	self
		assert: ((cuOOra obtenerRespuestasDelUsuario: user2) includes: resp1)
]

{ #category : #testing }
TestCuOOra >> testUsuarioNombreConPassword [
	"En este test se prueba el funcionamiento del metodo usuarioNombreConPassword que verifica si el usuario existe en el sistema, se crean instancias de usuario"
	| anUser anUser2 |
	anUser := Usuario nuevoConNombre: 'juan' yContraseña: '123'.
	anUser2 := Usuario nuevoConNombre: 'pedro' yContraseña: '456'.
	"Se agregan al sistema"
	cuOOra agregarUsuario: anUser.
	cuOOra agregarUsuario: anUser2.
	"Se verifican que fueron agregados"
	self
		assert: (cuOOra usuarioNombre: 'juan' conPassword: '123')
		identicalTo: anUser.
	self
		assert: (cuOOra usuarioNombre: 'pedro' conPassword: '456')
		identicalTo: anUser2.
	self
		assert: (cuOOra usuarioNombre: 'asd' conPassword: '5565')
		identicalTo: nil
]
