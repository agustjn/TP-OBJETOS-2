Class {
	#name : #TestReaccion,
	#superclass : #TestCase,
	#instVars : [
		'user1',
		'reaction1',
		'publication'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestReaccion >> setUp [
	user1 := Usuario nuevoConNombre: 'Juan' yContraseña: '123'.
	reaction1 := Reaccion newConEstado: true Usuario: user1.

]

{ #category : #tests }
TestReaccion >> testMismoUsuario [
	self assert: (reaction1 mismoUsuario: user1).
	
]
