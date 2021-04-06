Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'text',
		'topicos',
		'respuestas'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialize }
Pregunta class >> con: aText [
	| instance |
	instance := self new.
	instance text: aText.
	^ instance
]

{ #category : #initialize }
Pregunta >> initialize [
	super initialize.
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #accessing }
Pregunta >> text [
	^ text
]

{ #category : #accessing }
Pregunta >> text: anObject [
	text := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: anObject [
	topicos := anObject
]
