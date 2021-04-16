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
Respuesta class >> newCon: aText Usuario: anUser [
	| instance |
	instance := self new.
	instance initializeCon: aText Usuario: anUser .
	^ instance
]

{ #category : #initialize }
Respuesta >> initializeCon: aText Usuario: anUser [
	self initialize.
	text := aText.
	usuario := anUser
]

{ #category : #queries }
Respuesta >> perteneceA: aUser [
	^ usuario == aUser 
]

{ #category : #accessing }
Respuesta >> text [
	^ text
]

{ #category : #accessing }
Respuesta >> text: anObject [
	text := anObject
]

{ #category : #queries }
Respuesta >> usuario [
	^ usuario
]
