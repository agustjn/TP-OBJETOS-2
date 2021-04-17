Class {
	#name : #TestUsuario,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestUsuario >> setUp [
	user := Usuario nuevoConNombre: 'pedro' yContraseña: '123'.

	
]

{ #category : #testing }
TestUsuario >> testAgregarPregunta [
	| preg topic |
	"En este test se verifica el funcionamiento del metodo agregar pregunta, se crean instancias de topico y preguntas"
	topic := Topico newConNombre: '' yDesc: ''.
	preg := Pregunta newConTitulo: 'hola' yTexto: '' relacionadoA: topic.
	"Se verifica que la pregunta este agregada correctamente"
	user agregarPregunta: preg.
	self assert: (user preguntas includes: preg).
	
]

{ #category : #testing }
TestUsuario >> testAgregarTopicoDeInteres [
	| topic |
	"En este test se verifica el funcionamiento del metodo agregar topico de interes, se crea una instancia de topico"
	topic := Topico newConNombre: '' yDesc: ''.
	user agregarTopicoDeInteres: topic .
	"Se verifica que la pregunta este agregada correctamente"
	self assert: (user topicosDeInteres includes: topic)
	
]

{ #category : #testing }
TestUsuario >> testBorrarPregunta [
	| preg topic |
	"En este test se verifica el funcionamiento del metodo borrar pregunta, se crean instancias de topico y preguntas"
	topic := Topico newConNombre: '' yDesc: ''.
	preg := Pregunta newConTitulo: 'hola' yTexto: '' relacionadoA: topic.
	"Se verifica que la pregunta este agregada correctamente"
	user agregarPregunta: preg.
	self assert: (user preguntas includes: preg).
	"Se borra la pregunta y luego se verifica que la cantidad de preguntas sea 0"
	user borrarPregunta: preg.
	self assert: user preguntas size identicalTo: 0
]

{ #category : #tests }
TestUsuario >> testCalcularPuntajeDePreguntas [
	"En este test se verifica el funcionamiento del metodo calcular puntaje de preguntas, se crean 2 pregutas y a una se le asigna una reaccion"

	| preg1 preg2 reaccion |
	preg1 := Pregunta newConTitulo: 'hola' yTexto: '' relacionadoA: nil.
	preg2 := Pregunta newConTitulo: 'chau' yTexto: '' relacionadoA: nil.
	reaccion := Reaccion newConEstado: false Usuario: user.
	preg1 agregarReaccion: reaccion.
	user agregarPregunta: preg1.
	user agregarPregunta: preg2.
	"Se verifica que sea correcto preg1(20 - 1 dislike) + preg2(20) = 39"
	self assert: user calcularPuntajeDePreguntas identicalTo: 39
]

{ #category : #testing }
TestUsuario >> testObtenerPreguntasDelTopico [
	| preg1 preg2 preg3 topic1 topic2 |
	"En este test se prueba el funcionamiento del metodo obtener las preguntas de un topico. Se crean instancias de preguntas 1,2 y 3 a las cuales las primeras 2 corresponden al mismo topico"
	topic1 := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	topic2 := Topico newConNombre: 'Basquet' yDesc: 'Se habla de basquet'.
	preg1 := Pregunta
		newConTitulo: 'Messi '
		yTexto: ''
		relacionadoA: topic1.
	preg2 := Pregunta
		newConTitulo: 'Ronaldo'
		yTexto: ''
		relacionadoA: topic1.
	preg3 := Pregunta
		newConTitulo: 'Campazzo'
		yTexto: ''
		relacionadoA: topic2.
	user agregarPregunta: preg1.
	user agregarPregunta: preg2.
	user agregarPregunta: preg3.
	"Luego de que se agregen todas las preguntas, se verifica que devuelva las preguntas correspondientes"
	self
		assert: ((user obtenerPreguntasDelTopico: topic1) includes: preg1).
	self
		assert: ((user obtenerPreguntasDelTopico: topic1) includes: preg2)
]

{ #category : #testing }
TestUsuario >> testSeguirUsuario [
	"En este test se prueba el funcionamiento del metodo seguir Usuario , se crea un usuario"

	| user1 |
	user1 := Usuario nuevoConNombre: 'Pedro' yContraseña: '123'.
	"User1 sigue a user"
	user1 seguirUsuario: user.
	"Se verifica que user1 tenga incluido a user en sus seguidos"
	self assert: (user1 seguidos includes: user)
]
