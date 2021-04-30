Class {
	#name : #TestUsuario,
	#superclass : #TestCase,
	#instVars : [
		'user1',
		'user2',
		'topicFutbol',
		'topicTenis',
		'topicsCol',
		'preg1',
		'preg2',
		'preg3'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestUsuario >> setUp [
	user1 := Usuario nuevoConNombre: 'pedro' yContraseña: '123'.
	user2 := Usuario nuevoConNombre: 'juan' yContraseña: '456'.
   	topicFutbol := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	topicTenis := Topico newConNombre: 'Tenis' yDesc: 'Se habla de basquet'.
	topicsCol:= OrderedCollection new.
	topicsCol add: topicFutbol ; add: topicTenis.
	preg1 := Pregunta newConTitulo: 'Messi gol?' yTexto: '...' relacionadoA: topicFutbol.
	preg2 := Pregunta newConTitulo: 'Federer?' yTexto: '...' relacionadoA: topicTenis.
	preg3 := Pregunta newConTitulo: 'Federer?' yTexto: '...' relacionadoA: topicsCol.
	
]

{ #category : #testing }
TestUsuario >> testAgregarPregunta [
	"En este test se verifica el funcionamiento del metodo agregar pregunta, se crean instancias de topico y preguntas"
	user1 agregarPregunta: preg1.
	self assert: (user1 preguntas includes: preg1).
	
]

{ #category : #testing }
TestUsuario >> testAgregarTopicoDeInteres [
	"En este test se verifica el funcionamiento del metodo agregar topico de interes, se crea una instancia de topico"
	
	user1 agregarTopicoDeInteres: topicFutbol .
	"Se verifica que la pregunta este agregada correctamente"
	self assert: (user1 topicosDeInteres includes: topicFutbol)
	
]

{ #category : #testing }
TestUsuario >> testBorrarPregunta [
	"En este test se verifica el funcionamiento del metodo borrar pregunta, se crean instancias de topico y preguntas"
	user1 agregarPregunta: preg1.
	self assert: (user1 preguntas includes: preg1).
	"Se borra la pregunta y luego se verifica que la cantidad de preguntas sea 0"
	user1 borrarPregunta: preg1.
	self assert: user1 preguntas size identicalTo: 0
]

{ #category : #tests }
TestUsuario >> testCalcularPuntajeDePreguntas [
	"En este test se verifica el funcionamiento del metodo calcular puntaje de preguntas, se crean 2 pregutas y a una se le asigna una reaccion"

	| reaccion |
	reaccion := Reaccion newConEstado: false Usuario: user1.
	preg1 agregarReaccion: reaccion.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	"Se verifica que sea correcto preg1(20 - 1 dislike) + preg2(20) = 39"
	self assert: user1 calcularPuntajeDePreguntas identicalTo: 39
]

{ #category : #testing }
TestUsuario >> testExistePregunta [
	user1 agregarPregunta: preg1.
	self assert:(user1 preguntas includes: preg1)
]

{ #category : #testing }
TestUsuario >> testObtenerPreguntasDelTopico [
	"En este test se prueba el funcionamiento del metodo obtener las preguntas de un topico. Se crean instancias de preguntas 1,2 y 3 a las cuales las primeras 2 corresponden al mismo topico"

	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	user1 agregarPregunta: preg3.
	"Luego de que se agregen todas las preguntas, se verifica que devuelva las preguntas correspondientes"
	self
		assert: ((user1 obtenerPreguntasDelTopico: topicFutbol) includes: preg1).
	self
		assert: ((user1 obtenerPreguntasDelTopico: topicTenis) includes: preg2)
]

{ #category : #testing }
TestUsuario >> testSeguirUsuario [
	"En este test se prueba el funcionamiento del metodo seguir Usuario , se crea un usuario"
	user2 seguirUsuario: user1.
	"Se verifica que user1 tenga incluido a user en sus seguidos"
	self assert: (user2 seguidos includes: user1)
]
