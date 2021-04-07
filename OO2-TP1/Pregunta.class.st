Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'titulo',
		'texto',
		'topicos',
		'respuestas'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #initialize }
Pregunta class >> conTitulo: aTitle yTexto:aText relacionadoA:aTopicCollection [
	| instance |
	instance := self new.
	instance titulo: aTitle.
	instance texto: aText.
	instance topicos addAll: aTopicCollection .
	^ instance
]

{ #category : #accessing }
Pregunta >> agregarRespuesta: aAnswer [
	respuestas add: aAnswer .
]

{ #category : #initialize }
Pregunta >> initialize [
	super initialize.
	topicos := OrderedCollection new.
	respuestas := OrderedCollection new.
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
Pregunta >> texto [
	^ texto
]

{ #category : #accessing }
Pregunta >> texto: anObject [
	texto := anObject
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: anObject [
	topicos := anObject
]
