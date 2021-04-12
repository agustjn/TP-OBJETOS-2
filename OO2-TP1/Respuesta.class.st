Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'text',
		'usuario'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialize }
Respuesta class >> newCon: aText [
	| instance |
	instance := self new.
	instance initializeCon: aText .
	^ instance
]

{ #category : #initialize }
Respuesta >> initializeCon: aText [
	super initialize.
	text := aText 
]

{ #category : #queries }
Respuesta >> perteneceA: aUser [
	^ usuario == aUser 
]

{ #category : #queries }
Respuesta >> usuario [
	^ usuario
]
