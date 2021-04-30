Class {
	#name : #TestRespuesta,
	#superclass : #TestCase,
	#instVars : [
		'respuesta',
		'user'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestRespuesta >> setUp [
	user := Usuario nuevoConNombre: 'Pablo' yContraseña: '123'.
	respuesta := Respuesta newCon: 'Tenes razon' Usuario: user. 

	
]

{ #category : #testing }
TestRespuesta >> testPerteneceA [
	"Este test prueba el metodo perteneceA que verifica si la respuesta pertenece al usuario ingresado por parametro"

	| user2 |
	user2 := Usuario nuevoConNombre: 'Pepe' yContraseña: '123'.
	self assert: (respuesta perteneceA: user).
	self assert: (respuesta perteneceA: user2) identicalTo: false .
	
]
