Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'text'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialize }
Respuesta class >> con: aText [
	| instance |
	instance := self new.
	instance text: aText.
	^ instance
]

{ #category : #initialize }
Respuesta >> initialize [
	super initialize.
]
