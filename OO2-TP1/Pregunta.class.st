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
Pregunta class >> newConTitulo: aTitle yTexto:aText relacionadoA:aTopicCollection [
	| instance |
	instance := self new.
	instance initializeConTitulo: aTitle Texto: aText topicos: aTopicCollection .
	^ instance 
	
]

{ #category : #accessing }
Pregunta >> agregarRespuesta: aAnswer [
	respuestas add: aAnswer .
]

{ #category : #initialize }
Pregunta >> initializeConTitulo: aTitle Texto: aText topicos: someTopics [
	self initialize.
	titulo := aTitle.
	texto := aText.
	topicos := someTopics.
	respuestas := OrderedCollection new
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestasOrdenadas [
	^ (respuestas asSortedCollection: [ :r1 :r2 | r1 calcularPuntaje > r2 calcularPuntaje])
]

{ #category : #accessing }
Pregunta >> texto [
	^ texto
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos asOrderedCollection 
]
