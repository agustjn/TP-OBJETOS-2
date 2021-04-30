Class {
	#name : #TestPublicacion,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topico',
		'reaccion',
		'reaccionNeg',
		'usuario'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestPublicacion >> setUp [
	topico := Topico newConNombre: 'Futbol' yDesc: 'Copa'.
	pregunta := Pregunta
		newConTitulo: 'Messi es el mejor'
		yTexto: 's'
		relacionadoA: topico.
	usuario := Usuario nuevoConNombre: 'Pablo' yContraseña: '123'.
	reaccion := Reaccion newConEstado: true Usuario: usuario .
	reaccionNeg := Reaccion newConEstado: false Usuario: usuario .
]

{ #category : #testing }
TestPublicacion >> testAgregarReaccion [
	"Se agregue una reaccion realizada por user, que es un like"

	pregunta agregarReaccion: reaccion.
	self assert: (pregunta reacciones includes: reaccion).
	self assert: pregunta likes identicalTo: 1.
	self assert: pregunta dislikes identicalTo: 0.
	"Luego, se agrega una reaccion negativa(dislike) realizada por el mismo usuario, entonces se borra la anterior y solo queda esta"
	pregunta agregarReaccion: reaccionNeg.
	self assert: pregunta likes identicalTo: 0 .
	self assert: pregunta dislikes identicalTo: 1.
]

{ #category : #testing }
TestPublicacion >> testAplicarReaccion [
	pregunta agregarReaccion: reaccion.
	self assert: (pregunta reacciones includes: reaccion)
]

{ #category : #testing }
TestPublicacion >> testBuscarReaccion [
	"Este test prueba el funcionamiento del metodo buscar reaccion, busca si el usuario ya habia realizado alguna reaccion, si es así la retorna, caso contrario retorna nil"
	|nuevaReac nuevoUser|
	nuevoUser := Usuario nuevoConNombre: 'Julian' yContraseña: '123'.
	nuevaReac := Reaccion newConEstado: false Usuario: nuevoUser .
	pregunta agregarReaccion: reaccion.
	self assert: (pregunta buscarReaccion: reaccion) equals: reaccion.
	self assert: (pregunta buscarReaccion: nuevaReac ) equals: nil .
	



	"| r |
	r := reacciones
		detect: [ :reaction | reaction mismoUsuario: aReaction usuario ]
		ifNone: [ ^ nil ].
	^ r"
]

{ #category : #testing }
TestPublicacion >> testCalcularPuntaje [
	self assert: pregunta calcularPuntaje identicalTo: 0.
	pregunta agregarReaccion: reaccion.
	self assert: pregunta calcularPuntaje identicalTo: 1.
]

{ #category : #testing }
TestPublicacion >> testDislikes [
	self assert: pregunta dislikes identicalTo: 0.
	pregunta agregarReaccion: reaccionNeg.
	self assert: pregunta dislikes identicalTo: 1
]

{ #category : #testing }
TestPublicacion >> testLikes [
	self assert: pregunta likes identicalTo: 0.
	pregunta agregarReaccion: reaccion.
	self assert: pregunta likes identicalTo: 1
]

{ #category : #testing }
TestPublicacion >> testQuitarReaccion [
	pregunta agregarReaccion: reaccion.
	self assert: (pregunta reacciones includes: reaccion).
	pregunta quitarReaccion: reaccion.
	self assert: pregunta reacciones size identicalTo: 0
]
