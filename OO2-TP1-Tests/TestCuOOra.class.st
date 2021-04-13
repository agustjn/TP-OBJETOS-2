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
		assert: (cuOOra obtenerPreguntasDeTopico: topic) first equals: aQuestion.
	self assert: (cuOOra obtenerPreguntasDelUsuario: anUser) equals: aQuestion
]

{ #category : #testing }
TestCuOOra >> testAgregarRespuesta [
	|respuesta pregunta topico|
	respuesta := Respuesta newCon: 'Tenes razon'.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol' .
	pregunta:= Pregunta newConTitulo: 'Messi' yTexto: 'Messi es el mejor'  relacionadoA: topico .
	pregunta agregarRespuesta: respuesta .
	self assert: (pregunta respuestas includes: respuesta) .
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
TestCuOOra >> testLikesAndDislikes [
	| pregunta topico reaccion1 reaccion2 user |
	user := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Messi'
		yTexto: 'Messi es el mejor actual'
		relacionadoA: topico.
	reaccion1 := Reaccion newConEstado: true Usuario: user.
	pregunta agregarReaccion: reaccion1.
	reaccion2 := Reaccion newConEstado: false Usuario: user.
	self assert: pregunta likes equals: 1.
	self assert: pregunta dislikes equals: 0 .
	pregunta agregarReaccion: reaccion2 .
	self assert: pregunta likes equals: 0 .
	self assert: pregunta dislikes equals: 1 .
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
TestCuOOra >> testUsuarioSigueAOtro [
	| user1 user2 |
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'Juan' yContraseña: '123'.
	user1 seguirUsuario:  user2.
	self assert: (user1 seguidos includes: user2)
]
