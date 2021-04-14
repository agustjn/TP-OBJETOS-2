Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestCuOOra >> setUp [
   cuOOra := CuOOra new.
]

{ #category : #testing }
TestCuOOra >> testAgregarPreguntaDeTopicosDelUsuario [
	| anUser aQuestion topic |
	anUser := Usuario nuevoConNombre: 'Agustin' yContraseña: '123'.
	topic := Topico
		newConNombre: 'Futbol'
		yDesc: 'Se habla de partidos de champions'.
	aQuestion := Pregunta
		newConTitulo: 'Autos'
		yTexto: 'Habia unos autos'
		relacionadoA: topic.
	cuOOra agregarUsuario: anUser.
	cuOOra agregarTopico: topic.
	cuOOra agregarPregunta: aQuestion deTopicos: topic delUsuario: anUser.
	self
		assert: (cuOOra obtenerPreguntasDeTopico: topic) first == aQuestion.
	self
		assert: (cuOOra obtenerPreguntasDelUsuario: anUser)  == aQuestion
]

{ #category : #testing }
TestCuOOra >> testAgregarTopico [
	| topic |
	topic := Topico newConNombre: 'Futbol' yDesc: 'Se habla de partidos de champions' . 
	cuOOra agregarTopico: topic.
	self assert: (cuOOra topicos includes: topic).
]

{ #category : #testing }
TestCuOOra >> testAgregarUsuario [
	|user1 user2|
	
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1' .
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: 'pass2' .
	cuOOra agregarUsuario: user1 ; agregarUsuario: user2.
	self assert: (cuOOra usuarios includes:user1 ; includes:user2).
	

	
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasDeTopico [
	
	|topic topic2 user1 preg1 preg2 auxCollection auxCollection2|
	"auxCollection va a contener los topicos creados, para despues comprobar si la pregunta1
	esta relacionada a los topicos creados (topic y topic2)
	auxCollection 2 va a contener las preguntas 1 y 2 (preg1 y preg2) para despues comprobar
	si el mensaje '#obtenerPreguntasDeTopico' devuelve la coleccion deseada (auxCollection2)"

	topic := Topico newConNombre: 'Futbol' yDesc: 'Se habla de partidos de champions' .
	topic2 := Topico newConNombre: 'Deporte' yDesc: 'Se habla de deportes' .
	cuOOra agregarTopico: topic ; agregarTopico: topic2.
	auxCollection := OrderedCollection new.
	auxCollection add:topic ; add:topic2.
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: 'pass1'.
	cuOOra agregarUsuario: user1.
	preg1 := Pregunta newConTitulo: 'Messi salva la seleccion' yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a brasiluski' relacionadoA: auxCollection.
	preg2:= Pregunta newConTitulo: 'Messi salva al barcelona'  yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a madrid' relacionadoA: auxCollection.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	auxCollection2 := OrderedCollection new.
	auxCollection2 add: preg1 ; add: preg2.
	self assert: (cuOOra obtenerPreguntasDeTopico: topic ) equals: auxCollection2.

	

]

{ #category : #testing }
TestCuOOra >> testUsuarioNombreConPassword [
	| anUser anUser2 |
	anUser := Usuario nuevoConNombre: 'juan' yContraseña: '123'.
	anUser2 := Usuario nuevoConNombre: 'pedro' yContraseña: '456'.
	cuOOra agregarUsuario: anUser.
	cuOOra agregarUsuario: anUser2.
	self assert:(cuOOra usuarioNombre: 'juan' conPassword: '123') == anUser.
	self assert:(cuOOra usuarioNombre: 'pedro' conPassword: '456') == anUser2.
	self assert:(cuOOra usuarioNombre: 'asd' conPassword: '5565') == nil.
]

{ #category : #testing }
TestCuOOra >> testUsuarioNombrePassword [
]
