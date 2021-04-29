Class {
	#name : #TestTopico,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topic1',
		'topic2'
	],
	#category : #'OO2-TP1-Tests'
}

{ #category : #running }
TestTopico >> setUp [
	cuoora := CuOOra new.
	topic1 := Topico newConNombre:'Futbol' yDesc:'Una seccion referida con el futbol'.
	topic2 := Topico newConNombre:'Tenis' yDesc:'Una seccion referida con el tenis'.
	cuoora agregarTopico: topic1.
	cuoora agregarTopico: topic2.
	

]

{ #category : #tests }
TestTopico >> testMismoNombre [
	self assert: topic1 nombre equals: 'Futbol'.
	self assert: topic2 nombre equals: 'Tenis'
]
