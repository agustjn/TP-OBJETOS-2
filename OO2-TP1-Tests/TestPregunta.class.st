Class {
	#name : #TestPregunta,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topico'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestPregunta >> setUp [
	topico := Topico newConNombre: 'Futbol' yDesc: 'Se habla de futbol'.
	pregunta := Pregunta
		newConTitulo: 'Prueba'
		yTexto: ''
		relacionadoA: topico
]

{ #category : #testing }
TestPregunta >> testAgregarReaccion [
	"En este test se prueba el metodo agregar reaccion . Se crea un usuario, una pregunta y una respuesta a esa pregunta"

	| reaccion user |
	user := Usuario nuevoConNombre: 'pepe' yContraseña: '123'.
	reaccion := Reaccion newConEstado: true Usuario: user.
	"luego de creearse lo ya nombrado, se agrega la respuesta a esa pregunta y se verica que la respuesta pertenezca a las respuestas de la instancia pregunta"
	pregunta agregarReaccion: reaccion.
	self assert: (pregunta reacciones includes: reaccion).
	
]

{ #category : #testing }
TestPregunta >> testAgregarRespuesta [
	"En este test se prueba el metodo agregar respuesta . Se crea un usuario, una pregunta y una respuesta a esa pregunta"
	| respuesta user |
	user := Usuario nuevoConNombre: 'pepe' yContraseña: '123'.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user.
	"luego de creearse lo ya nombrado, se agrega la respuesta a esa pregunta y se verica que la respuesta pertenezca a las respuestas de la instancia pregunta"
	pregunta agregarRespuesta: respuesta.
	self assert: (pregunta respuestas includes: respuesta)
	
]

{ #category : #testing }
TestPregunta >> testObtenerRespuestasOrdenadas [
	"En este test se prueba el metodo de obtener las respuestas ordenadas por la cantidad de likes,
	se crean dos instancias de respuestas, una con 1 like y otra con un dislike"
	| respuesta1 respuesta2 user reaccion1 reaccion2 |
	user := Usuario nuevoConNombre: 'pepe' yContraseña: '123'.
	respuesta1 := Respuesta newCon: 'Tenes razon' Usuario: user.
	respuesta2 := Respuesta newCon: 'hola' Usuario: user.
	reaccion1 := Reaccion newConEstado: true Usuario: user.
	reaccion2 := Reaccion newConEstado: false Usuario: user.
	respuesta1 agregarReaccion: reaccion2.
	respuesta2 agregarReaccion: reaccion1.
	pregunta agregarRespuesta: respuesta1.
	pregunta agregarRespuesta: respuesta2.
	"se verifica que la primera es la tiene mas likes"
	self assert: pregunta respuestasOrdenadas first equals: respuesta2
]
